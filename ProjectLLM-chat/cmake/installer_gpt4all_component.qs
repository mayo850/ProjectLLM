function Component() {
}

var targetDirectory;
Component.prototype.beginInstallation = function() {
    targetDirectory = installer.value("TargetDir");
};

Component.prototype.createOperations = function() {
    try {
        // call the base create operations function
        component.createOperations();
        if (systemInfo.productType === "windows") {
            try {
                var userProfile = installer.environmentVariable("USERPROFILE");
                installer.setValue("UserProfile", userProfile);
                component.addOperation("CreateShortcut",
                    targetDirectory + "/bin/chat.exe",
                    "@UserProfile@/Desktop/ProjectLLM.lnk",
                    "workingDirectory=" + targetDirectory + "/bin",
                    "iconPath=" + targetDirectory + "/ProjectLLM.ico",
                    "iconId=0", "description=Open ProjectLLM");
            } catch (e) {
                print("ERROR: creating desktop shortcut" + e);
            }
            component.addOperation("CreateShortcut",
                targetDirectory + "/bin/chat.exe",
                "@StartMenuDir@/ProjectLLM.lnk",
                "workingDirectory=" + targetDirectory + "/bin",
                "iconPath=" + targetDirectory + "/ProjectLLM.ico",
                "iconId=0", "description=Open ProjectLLM");
        } else if (systemInfo.productType === "macos") {
            var ProjectLLMAppPath = targetDirectory + "/bin/ProjectLLM.app";
            var symlinkPath = targetDirectory + "/../ProjectLLM.app";
            // Remove the symlink if it already exists
            component.addOperation("Execute", "rm", "-f", symlinkPath);
            // Create the symlink
            component.addOperation("Execute", "ln", "-s", ProjectLLMAppPath, symlinkPath);
        } else { // linux
            var homeDir = installer.environmentVariable("HOME");
            if (!installer.fileExists(homeDir + "/Desktop/ProjectLLM.desktop")) {
                component.addOperation("CreateDesktopEntry",
                    homeDir + "/Desktop/ProjectLLM.desktop",
                    "Type=Application\nTerminal=false\nExec=\"" + targetDirectory +
                    "/bin/chat\"\nName=ProjectLLM\nIcon=" + targetDirectory +
                    "/ProjectLLM-48.png\nName[en_US]=ProjectLLM");
            }
        }
    } catch (e) {
        print("ERROR: running post installscript.qs" + e);
    }
}

Component.prototype.createOperationsForArchive = function(archive)
{
    component.createOperationsForArchive(archive);

    if (systemInfo.productType === "macos") {
        var uninstallTargetDirectory = installer.value("TargetDir");
        var symlinkPath = uninstallTargetDirectory + "/../ProjectLLM.app";

        // Remove the symlink during uninstallation
        if (installer.isUninstaller()) {
            component.addOperation("Execute", "rm", "-f", symlinkPath, "UNDOEXECUTE");
        }
    }
}

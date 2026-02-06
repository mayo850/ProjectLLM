function(sign_target_windows tgt)
    if(WIN32 AND ProjectLLM_SIGN_INSTALL)
        add_custom_command(TARGET ${tgt}
            POST_BUILD
            COMMAND AzureSignTool.exe sign
                -du "https://www.nomic.ai/ProjectLLM"
                -kvu https://ProjectLLM.vault.azure.net
                -kvi "$Env{AZSignGUID}"
                -kvs "$Env{AZSignPWD}"
                -kvc "$Env{AZSignCertName}"
                -kvt "$Env{AZSignTID}"
                -tr http://timestamp.digicert.com
                -v
                $<TARGET_FILE:${tgt}>
        )
    endif()
endfunction()

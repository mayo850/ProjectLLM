import QtCore
import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects
import llm
import chatlistmodel
import download
import modellist
import network
import ProjectLLM
import mysettings

Rectangle {
    id: homeView

    Theme {
        id: theme
    }

    color: theme.viewBackground
    signal chatViewRequested()
    signal localDocsViewRequested()
    signal settingsViewRequested(int page)
    signal addModelViewRequested()
    property bool shouldShowFirstStart: false

    ColumnLayout {
        id: mainArea
        anchors.fill: parent
        anchors.margins: 30
        spacing: 30

        ColumnLayout {
            Layout.fillWidth: true
            Layout.maximumWidth: 1530
            Layout.alignment: Qt.AlignCenter
            Layout.topMargin: 20
            spacing: 30

            ColumnLayout {
                Layout.alignment: Qt.AlignHCenter
                spacing: 5

                Text {
                    id: welcome
                    Layout.alignment: Qt.AlignHCenter
                    text: qsTr("Welcome to VMs first LLM!")
                    font.pixelSize: theme.fontSizeBannerLarge
                    color: theme.titleTextColor
                }

                Text {
                    Layout.alignment: Qt.AlignHCenter
                    text: qsTr("The PRIVACY first LLM chat application, YAY (x2)")
                    font.pixelSize: theme.fontSizeLarge
                    color: theme.titleInfoTextColor
                }
            }

            MyButton {
                id: startChat
                visible: shouldShowFirstStart
                Layout.alignment: Qt.AlignHCenter
                text: qsTr("Start chatting")
                onClicked: {
                    chatViewRequested()
                }
            }

            RowLayout {
                spacing: 15
                visible: !startChat.visible
                Layout.alignment: Qt.AlignHCenter

                MyWelcomeButton {
                    Layout.fillWidth: true
                    Layout.maximumWidth: 150 + 200 * theme.fontScale
                    Layout.preferredHeight: 40 + 90 * theme.fontScale
                    text: qsTr("Start Chatting")
                    description: qsTr("Chat with any LLM (no deepseek plz)")
                    imageSource: "qrc:/ProjectLLM/icons/chat.svg"
                    onClicked: {
                        chatViewRequested()
                    }
                }
                MyWelcomeButton {
                    Layout.fillWidth: true
                    Layout.maximumWidth: 150 + 200 * theme.fontScale
                    Layout.preferredHeight: 40 + 90 * theme.fontScale
                    text: qsTr("LocalDocs")
                    description: qsTr("Chat with your local files")
                    imageSource: "qrc:/ProjectLLM/icons/db.svg"
                    onClicked: {
                        localDocsViewRequested()
                    }
                }
                MyWelcomeButton {
                    Layout.fillWidth: true
                    Layout.maximumWidth: 150 + 200 * theme.fontScale
                    Layout.preferredHeight: 40 + 90 * theme.fontScale
                    text: qsTr("Find Models")
                    description: qsTr("Explore and download models")
                    imageSource: "qrc:/ProjectLLM/icons/models.svg"
                    onClicked: {
                        addModelViewRequested()
                    }
                }
            }

            Item {
                visible: !startChat.visible && Download.latestNews !== ""
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.minimumHeight: 120
                Layout.maximumHeight: textAreaNews.height

                Rectangle {
                    id: roundedFrameNews // latest news
                    anchors.fill: parent
                    z: 299
                    radius: 10
                    border.width: 1
                    border.color: theme.controlBorder
                    color: "transparent"
                    clip: true
                }

                Item {
                    anchors.fill: parent
                    layer.enabled: true
                    layer.effect: OpacityMask {
                        maskSource: Rectangle {
                            width: roundedFrameNews.width
                            height: roundedFrameNews.height
                            radius: 10
                        }
                    }

                    RowLayout {
                        spacing: 0
                        anchors.fill: parent
                        Rectangle {
                            color: "transparent"
                            width: 82
                            height: 100
                            Image {
                                id: newsImg
                                anchors.centerIn: parent
                                sourceSize: Qt.size(48, 48)
                                mipmap: true
                                visible: false
                                source: "qrc:/ProjectLLM/icons/ProjectLLM_transparent.svg"
                            }

                            ColorOverlay {
                                anchors.fill: newsImg
                                source: newsImg
                                color: theme.styledTextColor
                            }
                        }

                        Item {
                            id: myItem
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            Rectangle {
                                anchors.fill: parent
                                color: theme.conversationBackground
                            }

                            ScrollView {
                                id: newsScroll
                                anchors.fill: parent
                                clip: true
                                ScrollBar.vertical.policy: ScrollBar.AsNeeded
                                ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
                                Text {
                                    id: textAreaNews
                                    width: myItem.width
                                    padding: 20
                                    color: theme.styledTextColor
                                    font.pixelSize: theme.fontSizeLarger
                                    textFormat: TextEdit.MarkdownText
                                    wrapMode: Text.WordWrap
                                    text:"PRIVACY COMMITMENT FOR LLM VM POC:\n\n" +
                          "-> Data Isolation: All model processing occurs within secure virtual containers\n\n" +
                          "-> Zero Data Retention: No conversations or prompts are stored persistently\n\n" +
                          "-> Local Processing: No external API calls or cloud dependencies\n\n" +
                          "-> Encryption: All memory and disk operations use AES-256 encryption\n\n" +
                          "-> Audit Trail: Optional logging for compliance purposes only\n\n" +
                          "UPCOMING FEATURES:\n\n" +
                          "-> Hardware-backed security modules (Q3 2025)\n\n" +
                          "-> Differential privacy integration (Q4 2025)\n" 
                                    focus: false
                                    Accessible.role: Accessible.Paragraph
                                    Accessible.name: qsTr("Latest news")
                                    Accessible.description: qsTr("Latest news from Von Maur Information Systems")
                                    onLinkActivated: function(link) {
                                        Qt.openUrlExternally(link);
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        Rectangle {
            id: linkBar
            Layout.alignment: Qt.AlignBottom
            Layout.fillWidth: true
            border.width: 1
            border.color: theme.dividerColor
            radius: 6
            z: 200
            height: 30
            color: theme.conversationBackground

            RowLayout {
                anchors.fill: parent
                spacing: 0
                RowLayout {
                    Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                    spacing: 4

                    MyFancyLink {
                        text: qsTr("Release Notes")
                        imageSource: "qrc:/ProjectLLM/icons/notes.svg"
                        onClicked: { Qt.openUrlExternally("https://vonmaur.com") }
                    }

                    MyFancyLink {
                        text: qsTr("Documentation")
                        imageSource: "qrc:/ProjectLLM/icons/info.svg"
                        onClicked: { Qt.openUrlExternally("https://vonmaur.com") }
                    }

                }
            }
        }
    }

    Rectangle {
        anchors.top: mainArea.top
        anchors.right: mainArea.right
        border.width: 1
        border.color: theme.dividerColor
        radius: 6
        z: 200
        height: 30
        color: theme.conversationBackground
        width: subscribeLink.width
        RowLayout {
            anchors.centerIn: parent
            MyFancyLink {
                id: subscribeLink
                Layout.alignment: Qt.AlignCenter
                text: qsTr("Submit Jira Ticket")
                imageSource: "qrc:/ProjectLLM/icons/email.svg"
                onClicked: { Qt.openUrlExternally("https://vonmaur.com") }
            }
        }
    }
}

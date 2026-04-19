import QtQuick
import QtQuick.Layouts

import qs.common
import qs.icons
import qs.services

MouseArea {
    id: root

    Layout.fillHeight: true
    Layout.preferredWidth: container.width
    Layout.margins: Constants.marginS
    acceptedButtons: Qt.LeftButton | Qt.RightButton | Qt.MiddleButton
    onClicked: event => {
        event.accepted = true;
        if (event.button === Qt.LeftButton) {
            MediaService.togglePlaying();
        } else if (event.button === Qt.RightButton) {
            MediaService.next();
        } else if (event.button === Qt.MiddleButton) {
            MediaService.previous();
        }
    }

    Rectangle {
        id: container
        anchors {
            top: parent.top
            bottom: parent.bottom
        }
        implicitWidth: layout.width + (Constants.marginS)
        color: Colors.background
        radius: Constants.radius
        RowLayout {
            id: layout
            anchors {
                top: parent.top
                bottom: parent.bottom
            }
            spacing: 0
            Item {
                id: icon
                Layout.alignment: Qt.AlignVCenter
                Layout.fillHeight: true
                Layout.preferredWidth: height
                Layout.margins: Constants.marginS
                Layout.rightMargin: 0
                MediaCircleIcon {
                    anchors {
                        centerIn: parent
                    }
                    size: 22
                }
                MediaPlayIcon {
                    anchors {
                        centerIn: parent
                    }
                    size: 22
                    opacity: MediaService.playing ? 0 : 1
                    Behavior on opacity {
                        AnimateNumber {}
                    }
                }
                MediaPauseIcon {
                    anchors {
                        centerIn: parent
                    }
                    size: 22
                    opacity: MediaService.playing ? 1 : 0
                    Behavior on opacity {
                        AnimateNumber {}
                    }
                }
            }
            CText {
                Layout.margins: Constants.marginS
                Layout.alignment: Qt.AlignVCenter
                Layout.maximumWidth: 200
                Layout.minimumWidth: contentWidth
                Layout.preferredWidth: contentWidth
                text: MediaService.track
                elide: Text.ElideRight
            }
        }
        MediaProgress {
            progress: MediaService.progress
            radius: Constants.radius
            anchors {
                fill: parent
            }
        }
    }
}

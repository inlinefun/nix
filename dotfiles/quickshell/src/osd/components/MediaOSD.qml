import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets

import qs.common
import qs.icons
import qs.services

OSDItem {
    id: root

    property double progress: MediaService.progress * 100.0
    property color color: Colors.foreground

    RowLayout {
        id: layout
        anchors {
            fill: parent
        }
        IconImage {
            Layout.fillHeight: true
            Layout.preferredWidth: height
            Layout.margins: Constants.marginS
            source: MediaService.url
            mipmap: true
        }
        ColumnLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.margins: Constants.marginS
            spacing: Constants.marginS
            RowLayout {
                Layout.fillHeight: true
                Layout.fillWidth: true
                ColumnLayout {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    spacing: 0
                    CText {
                        Layout.fillWidth: true
                        text: MediaService.track
                        size: 16
                        color: Colors.foreground
                    }
                    CText {
                        Layout.fillWidth: true
                        text: MediaService.artist
                        size: 12
                        color: Colors.foreground_variant
                    }
                }
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
            }
            Item {
                Layout.fillHeight: true
            }
            RowLayout {
                Layout.fillWidth: true
                Layout.fillHeight: true
                spacing: Constants.marginS
                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredWidth: root.progress
                    implicitHeight: 4
                    color: Colors.blue
                    radius: 2
                    opacity: root.progress === 0 ? 0 : 1
                    Behavior on opacity {
                        AnimateNumber {}
                    }
                }
                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredWidth: 100 - root.progress
                    Layout.preferredHeight: 4
                    color: Colors.background_variant
                    radius: 2
                    opacity: root.progress === 100 ? 0 : 1
                    Behavior on opacity {
                        AnimateNumber {}
                    }
                }
            }
            Item {
                Layout.fillHeight: true
            }
        }
    }
    Behavior on progress {
        AnimateNumber {}
    }
}

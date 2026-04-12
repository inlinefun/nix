import QtQuick
import QtQuick.Layouts

import qs.common
import qs.icons
import qs.services

OSDItem {
    id: root

    property int volume: PipewireService.sinkVolume
    property color color: {
        if (PipewireService.sinkMuted || PipewireService.sinkVolume == 0) {
            return Colors.red;
        } else if (PipewireService.sinkVolume == 100) {
            return Colors.cyan;
        } else if (PipewireService.sinkVolume <= 10) {
            return Colors.orange;
        } else if (PipewireService.sinkVolume <= 20) {
            return Colors.yellow;
        }
        return Colors.foreground;
    }

    RowLayout {
        id: layout
        anchors {
            fill: parent
        }
        Item {
            Layout.fillHeight: true
            Layout.preferredWidth: height
            VolumeIcon {
                anchors {
                    centerIn: parent
                }
                color: root.color
                size: 28
            }
            VolumeOverlay0 {
                anchors {
                    centerIn: parent
                }
                color: root.color
                size: 28
                opacity: PipewireService.sinkVolume / 50
            }
            VolumeOverlay1 {
                anchors {
                    centerIn: parent
                }
                color: root.color
                size: 28
                opacity: (PipewireService.sinkVolume - 50) / 50
            }
            Item {
                anchors {
                    centerIn: parent
                }
                implicitHeight: 36
                implicitWidth: 36
                rotation: -45
                Rectangle {
                    anchors {
                        horizontalCenter: parent.horizontalCenter
                    }
                    implicitHeight: PipewireService.sinkMuted ? parent.height : 0
                    implicitWidth: 6
                    radius: width
                    border {
                        color: Colors.background
                        width: 2
                    }
                    color: root.color
                    Behavior on implicitHeight {
                        AnimateNumber {}
                    }
                }
            }
        }
        ColumnLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.margins: Constants.marginS
            RowLayout {
                Layout.fillWidth: true
                Layout.fillHeight: true
                CText {
                    Layout.fillWidth: true
                    text: "Volume"
                    size: 18
                }
                CText {
                    text: root.volume
                    size: 18
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
                    Layout.preferredWidth: root.volume
                    implicitHeight: 4
                    color: Colors.blue
                    radius: 2
                    opacity: root.volume === 0 ? 0 : 1
                    Behavior on opacity {
                        AnimateNumber {}
                    }
                }
                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredWidth: 100 - root.volume
                    Layout.preferredHeight: 4
                    color: Colors.background_variant
                    radius: 2
                    opacity: root.volume === 100 ? 0 : 1
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
    Behavior on volume {
        AnimateNumber {}
    }
    Behavior on color {
        AnimateColor {}
    }
}

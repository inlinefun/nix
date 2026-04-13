import QtQuick
import QtQuick.Layouts

import qs.common
import qs.icons
import qs.services

OSDItem {
    id: root

    property color color: BluetoothService.enabled ? Colors.foreground : Colors.red

    RowLayout {
        id: layout
        anchors {
            fill: parent
        }
        Item {
            Layout.fillHeight: true
            Layout.preferredWidth: height
            BluetoothIcon {
                anchors {
                    centerIn: parent
                }
                size: 28
                color: root.color
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
                    implicitHeight: BluetoothService.enabled ? 0 : parent.height
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
        Item {
            Layout.fillHeight: true
            Layout.fillWidth: true
            CText {
                anchors {
                    centerIn: parent
                }
                text: "Bluetooth"
                color: Colors.foreground
            }
        }
    }
    Behavior on color {
        AnimateColor {}
    }
}

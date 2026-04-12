import QtQuick
import QtQuick.Layouts

import qs.common
import qs.icons
import qs.services

MouseArea {
    id: root

    property color color: BluetoothService.enabled ? Colors.foreground : Colors.red

    Layout.fillHeight: true
    Layout.preferredWidth: height
    hoverEnabled: true
    acceptedButtons: Qt.RightButton
    onClicked: event => {
        event.accepted = true;
        if (event.button == Qt.RightButton) {
            BluetoothService.toggleBluetooth();
        }
    }

    BluetoothIcon {
        anchors {
            centerIn: parent
        }
        color: root.color
    }
    BluetoothOverlay {
        anchors {
            centerIn: parent
        }
        opacity: BluetoothService.connected ? 1 : 0
        color: BluetoothService.connected ? Colors.blue : root.color
        Behavior on opacity {
            AnimateNumber {}
        }
        Behavior on color {
            AnimateColor {}
        }
    }
    Item {
        anchors {
            centerIn: parent
        }
        implicitHeight: 32
        implicitWidth: 32
        rotation: -45
        Rectangle {
            anchors {
                horizontalCenter: parent.horizontalCenter
            }
            implicitHeight: BluetoothService.enabled ? 0 : 32
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

    Behavior on color {
        AnimateColor {}
    }
}

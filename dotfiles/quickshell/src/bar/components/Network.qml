import QtQuick
import QtQuick.Layouts

import qs.common
import qs.icons
import qs.services

MouseArea {
    id: root

    property color color: {
        if (NetworkService.limitedConnectivity && NetworkService.connected) {
            return Colors.orange;
        } else if (NetworkService.connected) {
            return Colors.cyan;
        } else if (NetworkService.wifiEnabled) {
            return Colors.foreground;
        }
        return Colors.red;
    }

    Layout.fillHeight: true
    Layout.preferredWidth: height
    hoverEnabled: true
    acceptedButtons: Qt.RightButton
    onClicked: event => {
        event.accepted = true;
        if (event.button === Qt.RightButton) {
            NetworkService.toggleWifi();
        }
    }

    WifiIcon {
        anchors {
            centerIn: parent
        }
        color: root.color
    }
    WifiOverlay0 {
        anchors {
            centerIn: parent
        }
        color: root.color
        opacity: NetworkService.networkStrength / 0.50
        Behavior on opacity {
            AnimateNumber {}
        }
    }
    WifiOverlay1 {
        anchors {
            centerIn: parent
        }
        color: root.color
        opacity: (NetworkService.networkStrength - 0.50) / 0.50
        Behavior on opacity {
            AnimateNumber {}
        }
    }
    WifiLockOverlay {
        anchors {
            centerIn: parent
        }
        color: Colors.foreground
        opacity: NetworkService.secureNetwork ? 1 : 0
        Behavior on opacity {
            AnimateNumber {}
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
            implicitHeight: NetworkService.wifiEnabled ? 0 : 32
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

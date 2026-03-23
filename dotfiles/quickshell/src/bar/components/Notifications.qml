import QtQuick
import QtQuick.Layouts

import qs.animations
import qs.common
import qs.icons
import qs.services
import qs.sidebar

MouseArea {
    id: root

    property color color: {
        if (AudioService.sinkMuted || AudioService.sinkVolume == 0) {
            return Colors.red;
        }
        if (AudioService.sinkVolume == 100) {
            return Colors.cyan;
        } else if (AudioService.sinkVolume <= 10) {
            return Colors.orange;
        } else if (AudioService.sinkVolume <= 20) {
            return Colors.yellow;
        }
        return Colors.foreground;
    }

    Layout.fillHeight: true

    acceptedButtons: Qt.LeftButton
    hoverEnabled: true
    implicitWidth: height
    onClicked: event => {
        if (event.button == Qt.LeftButton) {
            Persistence.toggleRightbar();
        }
    }
    onWheel: event => {
        var increment = event.angleDelta.y > 0.0;
        AudioService.changeSinkVolume(increment);
    }

    Rectangle {
        anchors.fill: parent
        color: Colors.backgroundVariant
        opacity: root.containsMouse ? 1 : 0
        Behavior on opacity {
            AnimateNumber {}
        }
    }
    ChatIcon {
        size: 20
        anchors.centerIn: parent
        color: root.color
        Item {
            anchors {
                fill: parent
            }
            Rectangle {
                anchors {
                    top: parent.top
                    left: parent.right
                    leftMargin: 4
                    topMargin: -1
                }
                implicitWidth: 12
                implicitHeight: width
                radius: width
                border {
                    width: 2
                    color: root.containsMouse ? Colors.backgroundVariant : Colors.background
                    Behavior on color {
                        AnimateColor {}
                    }
                }
            }
        }
    }
    Behavior on color {
        AnimateColor {}
    }
}

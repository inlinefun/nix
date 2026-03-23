import QtQuick
import QtQuick.Layouts

import qs.animations
import qs.common
import qs.icons

MouseArea {
    id: root

    property color color: {
        return Colors.foreground;
    }

    Layout.fillHeight: true
    hoverEnabled: true
    implicitWidth: height

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

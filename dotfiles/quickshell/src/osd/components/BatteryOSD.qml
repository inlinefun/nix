import QtQuick
import QtQuick.Layouts

import qs.common
import qs.services

OSDItem {
    id: root

    property color fill: {
        if (PowerService.battery <= 30) {
            return Colors.orange;
        } else if (PowerService.battery <= 15) {
            return Colors.red;
        } else if (PowerService.charging) {
            return Colors.blue;
        } else if (PowerService.full) {
            return Colors.cyan;
        } else {
            return Colors.foreground;
        }
    }

    RowLayout {
        id: layout
        anchors {
            fill: parent
        }
        Item {
            Layout.fillHeight: true
            Layout.preferredWidth: height
            RowLayout {
                anchors {
                    centerIn: parent
                }
                spacing: 1
                Rectangle {
                    id: cell
                    Layout.preferredWidth: 30
                    Layout.preferredHeight: 20
                    radius: 4
                    color: root.fill
                    CText {
                        anchors {
                            centerIn: parent
                        }
                        text: PowerService.battery
                        size: 13
                        font.bold: true
                        color: Colors.background
                    }
                }
                Rectangle {
                    Layout.preferredHeight: cell.height / 2
                    Layout.preferredWidth: 2
                    topRightRadius: 2
                    bottomRightRadius: 2
                    color: cell.color
                }
            }
        }
        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true
            CText {
                anchors {
                    centerIn: parent
                }
                text: PowerService.label
                color: Colors.foreground
            }
        }
    }

    Behavior on fill {
        AnimateColor {}
    }
}

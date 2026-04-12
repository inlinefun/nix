import QtQuick
import QtQuick.Layouts

import qs.common
import qs.services

MouseArea {
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

    Layout.fillHeight: true
    Layout.preferredWidth: root.height
    hoverEnabled: true
    RowLayout {
        id: layout
        anchors {
            fill: parent
            margins: 4
        }
        spacing: 1
        Rectangle {
            id: cell
            Layout.fillWidth: true
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
    Behavior on fill {
        AnimateColor {}
    }
}

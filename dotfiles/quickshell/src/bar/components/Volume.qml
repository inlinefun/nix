import QtQuick
import QtQuick.Layouts

import qs.animations
import qs.common
import qs.services

MouseArea {
    id: root

    Layout.fillHeight: true

    hoverEnabled: true
    implicitWidth: height

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

    Rectangle {
        anchors.fill: parent
        color: Colors.backgroundVariant
        opacity: root.containsMouse ? 1 : 0
        Behavior on opacity {
            AnimateNumber {}
        }
    }
    RowLayout {
        anchors {
            fill: parent
            margins: 6
        }
        spacing: 2
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 16
            radius: Constants.radius
            color: root.color
        }
        Rectangle {
            Layout.preferredWidth: 2
            Layout.preferredHeight: 8
            topRightRadius: Constants.radius
            bottomRightRadius: Constants.radius
            color: root.color
        }
    }
    Behavior on color {
        AnimateColor {}
    }
}

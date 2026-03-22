import QtQuick
import QtQuick.Layouts
import Quickshell.Services.UPower

import qs.animations
import qs.common
import qs.icons
import qs.services

MouseArea {
    id: root

    Layout.fillHeight: true

    hoverEnabled: true
    implicitWidth: height

    property color color: {
        if (PowerService.critical) {
            return Colors.red;
        }
        if (PowerService.profile == PowerProfile.Performance) {
            return Colors.blue;
        } else if (PowerService.profile == PowerProfile.PowerSaver) {
            return Colors.green;
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
            FlashIcon {
                anchors {
                    centerIn: parent
                }
                size: 12
                color: Colors.background
                opacity: PowerService.charging ? 1 : 0
                Behavior on opacity {
                    AnimateNumber {}
                }
            }
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

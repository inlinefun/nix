import QtQuick
import QtQuick.Layouts
import Quickshell

import qs.animations
import qs.common

MouseArea {
    id: container

    Layout.fillHeight: true
    Layout.topMargin: Constants.barMargin
    Layout.bottomMargin: Constants.barMargin

    implicitWidth: text.width + 16
    hoverEnabled: true
    Rectangle {
        anchors {
            fill: parent
        }
        color: Colors.backgroundVariant
        radius: Constants.radius
        opacity: container.containsMouse ? 1 : 0
        Behavior on opacity {
            AnimateNumber {}
        }
    }
    CText {
        id: text
        size: 14
        anchors {
            centerIn: parent
        }
        text: Qt.formatDateTime(clock.date, "hh:mm A | MMM dd")
    }
    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }
}

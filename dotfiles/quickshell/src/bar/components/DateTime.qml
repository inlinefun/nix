import QtQuick
import QtQuick.Layouts
import Quickshell

import qs.common

MouseArea {
    id: root
    Layout.fillHeight: true
    Layout.preferredWidth: text.width + (Constants.marginS * 6)
    hoverEnabled: true
    Rectangle {
        anchors {
            fill: parent
            margins: Constants.marginS
        }
        radius: 2
        color: root.containsMouse ? Colors.background_variant : Colors.background
        Behavior on color {
            AnimateColor {}
        }
    }
    CText {
        id: text
        anchors {
            centerIn: parent
        }
        size: 20
        text: Qt.formatDateTime(clock.date, "hh:mm A | MMM dd")
    }
    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }
}

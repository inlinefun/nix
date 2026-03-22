import QtQuick
import QtQuick.Layouts
import Quickshell

import qs.common

MouseArea {
    id: container

    Layout.fillHeight: true
    Layout.topMargin: Constants.barMargin
    Layout.bottomMargin: Constants.barMargin

    implicitWidth: text.width + 16
    Rectangle {
        anchors {
            fill: parent
        }
        color: Colors.backgroundVariant
        radius: Constants.radius
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

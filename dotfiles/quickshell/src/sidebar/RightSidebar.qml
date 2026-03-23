import QtQuick
import QtQuick.Layouts
import Quickshell

import qs.common
import qs.uncommon

// qmllint disable uncreatable-type
Scope {
    id: root

    PanelWindow {
        id: right
        anchors {
            top: true
            right: true
            bottom: true
        }
        color: Colors.background
        implicitWidth: Constants.screenBorder
    }
    PanelWindow {
        id: topRightCorner
        implicitHeight: Constants.screenRadius
        implicitWidth: Constants.screenRadius
        color: "transparent"
        anchors {
            top: true
            right: true
        }
        TopRightCorner {
            implicitHeight: Constants.screenRadius
            implicitWidth: Constants.screenRadius
        }
    }
    PanelWindow {
        id: bottomRightCorner
        implicitHeight: Constants.screenRadius
        implicitWidth: Constants.screenRadius
        color: "transparent"
        anchors {
            bottom: true
            right: true
        }
        BottomRightCorner {
            implicitHeight: Constants.screenRadius
            implicitWidth: Constants.screenRadius
        }
    }
}

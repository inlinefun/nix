import Quickshell
import QtQuick

import qs.common
import qs.panel
import qs.uncommon

// qmllint disable uncreatable-type
Scope {
    id: root

    RightPanel {}
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
    PanelWindow {
        id: bottom
        anchors {
            left: true
            right: true
            bottom: true
        }
        implicitHeight: Constants.screenBorder
        color: Colors.background
    }
    PanelWindow {
        id: bottomLeftCorner
        implicitHeight: Constants.screenRadius
        implicitWidth: Constants.screenRadius
        color: "transparent"
        anchors {
            bottom: true
            left: true
        }
        BottomLeftCorner {
            implicitHeight: Constants.screenRadius
            implicitWidth: Constants.screenRadius
        }
    }
    PanelWindow {
        id: left
        anchors {
            top: true
            left: true
            bottom: true
        }
        implicitWidth: Constants.screenBorder
        color: Colors.background
    }
    PanelWindow {
        id: topLeftCorner
        implicitHeight: Constants.screenRadius
        implicitWidth: Constants.screenRadius
        color: "transparent"
        anchors {
            top: true
            left: true
        }
        TopLeftCorner {
            implicitHeight: Constants.screenRadius
            implicitWidth: Constants.screenRadius
        }
    }
}

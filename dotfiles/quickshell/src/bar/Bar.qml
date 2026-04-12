import QtQuick
import QtQuick.Layouts
import Quickshell

import qs.bar.components
import qs.common
import qs.services

// qmllint disable uncreatable-type
PanelWindow {
    id: root
    anchors {
        top: true
        left: true
        right: true
    }
    implicitHeight: Constants.barHeight
    color: Colors.background

    RowLayout {
        id: left
        anchors {
            top: parent.top
            left: parent.left
            bottom: parent.bottom
            leftMargin: Constants.borderSize
        }
        Media {
            visible: MediaService.player !== null
        }
    }
    RowLayout {
        id: center
        anchors {
            top: parent.top
            bottom: parent.bottom
            horizontalCenter: parent.horizontalCenter
        }
        DateTime {}
    }
    RowLayout {
        id: right
        anchors {
            top: parent.top
            right: parent.right
            bottom: parent.bottom
            rightMargin: Constants.borderSize
        }
        Network {}
        Bluetooth {}
        Audio {}
        Battery {}
    }
}

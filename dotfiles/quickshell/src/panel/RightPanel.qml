import QtQuick
import Quickshell

import qs.animations
import qs.common
import qs.uncommon

// qmllint disable uncreatable-type
PanelWindow {
    id: root
    readonly property int targetHeight: 300
    readonly property int targetWidth: 300
    readonly property bool show: HoverState.hoverState === HoverStates.RightBar || HoverState.hoverState === HoverStates.RightPanel
    implicitHeight: (root.show || container.implicitHeight > 0 ? root.targetHeight : 0) + Constants.screenRadius
    implicitWidth: (root.show || container.implicitHeight > 0 ? root.targetWidth : 0) + Constants.screenRadius
    color: "transparent"
    anchors {
        top: true
        right: true
    }
    Rectangle {
        id: container
        anchors {
            top: parent.top
            right: parent.right
        }
        implicitWidth: root.show ? root.targetWidth : 0
        implicitHeight: root.show ? root.targetHeight : 0
        bottomLeftRadius: Constants.screenRadius
        color: "transparent"
        MouseArea {
            id: hover
            anchors.fill: parent
            hoverEnabled: true
            onEntered: HoverState.updateHover(HoverStates.RightPanel)
            onExited: HoverState.updateHover(HoverStates.None)
        }
        Behavior on implicitWidth {
            AnimateNumber {}
        }
        Behavior on implicitHeight {
            AnimateNumber {}
        }
        Rectangle {
            id: panel
            anchors {
                top: parent.top
                right: parent.right
            }
            implicitWidth: container.width - Constants.screenRadius
            implicitHeight: container.height - Constants.screenRadius
            bottomLeftRadius: Constants.screenRadius
            color: Colors.background
        }
        TopRightCorner {
            anchors {
                top: parent.top
                left: parent.left
            }
            implicitHeight: Constants.screenRadius
            implicitWidth: Constants.screenRadius
        }
        TopRightCorner {
            anchors {
                right: parent.right
                bottom: parent.bottom
            }
            implicitHeight: Constants.screenRadius
            implicitWidth: Constants.screenRadius
        }
    }
}

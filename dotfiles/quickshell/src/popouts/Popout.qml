import QtQuick
import Quickshell
import Quickshell.Widgets

import qs.animations
import qs.common
import qs.uncommon

// qmllint disable uncreatable-type
PanelWindow {
    id: root

    property int targetHeight: 300
    property int targetWidth: 300

    anchors {
        top: true
        right: true
    }
    color: Colors.red
    implicitHeight: targetHeight
    implicitWidth: targetWidth

    Rectangle {
        id: container
        property int previousHeight: 0
        property int previousWidth: 0
        anchors {
            // fill: parent
            top: parent.top
            right: parent.right
        }
        implicitHeight: (loader.item?.height ?? 0) + Constants.screenRadius
        implicitWidth: (loader.item?.width ?? 0) + Constants.screenRadius
        color: "transparent"
        Behavior on implicitHeight {
            AnimateNumber {}
        }
        Behavior on implicitWidth {
            AnimateNumber {}
        }
        MouseArea {
            anchors {
                fill: parent
            }
            hoverEnabled: true
            onEntered: Persistence.updateFocus(PopoutItems.Popout)
            onExited: Persistence.updateFocus(PopoutItems.None)
        }
        ClippingRectangle {
            id: popout
            anchors {
                top: parent.top
                right: parent.right
            }
            implicitHeight: container.height - Constants.screenRadius
            implicitWidth: container.width - Constants.screenRadius
            bottomLeftRadius: Constants.screenRadius
            color: Colors.background
            Loader {
                id: loader
                anchors {
                    top: parent.top
                    right: parent.right
                }
                sourceComponent: {
                    var component = null;
                    var item = Persistence.focusedItem;
                    if (item == PopoutItems.Battery) {
                        component = "BatteryPopout";
                    } else if (item == PopoutItems.Volume) {
                        component = "VolumePopout";
                    } else {
                        return null;
                    }
                    return Qt.createComponent(Quickshell.shellDir + "/popouts/components/" + component + ".qml");
                }
            }
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

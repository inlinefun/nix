pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Shapes
import Quickshell

import qs.common
import qs.osd.components
import qs.services

// qmllint disable uncreatable-type
PanelWindow {
    id: root
    // qmllint enable
    property list<string> items: []
    property int windowHeight: 0
    // qmllint disable unresolved-type unqualified missing-property
    margins.bottom: Constants.borderSize
    // qmllint enable
    anchors {
        bottom: true
    }
    exclusionMode: ExclusionMode.Ignore
    implicitWidth: 240 + (2 * Constants.radius) + (2 * Constants.marginS)
    implicitHeight: windowHeight + (windowHeight === 0 ? 0 : Constants.marginS)
    color: "transparent"
    Rectangle {
        id: container
        anchors {
            bottom: parent.bottom
            horizontalCenter: parent.horizontalCenter
        }
        color: Colors.background
        implicitWidth: 240 + (2 * Constants.marginS)
        implicitHeight: list.contentHeight + (list.contentHeight === 0 ? 0 : Constants.marginS)
        topLeftRadius: Constants.radius
        topRightRadius: Constants.radius
        ListView {
            id: list
            anchors {
                bottom: parent.bottom
                horizontalCenter: parent.horizontalCenter
            }
            orientation: Qt.Vertical
            layoutDirection: ListView.BottomToTop
            clip: true
            implicitWidth: 240
            implicitHeight: contentHeight
            model: ScriptModel {
                // qmllint disable incompatible-type
                values: root.items
                // qmllint enable
            }
            delegate: Loader {
                id: loader
                clip: true
                required property var modelData
                sourceComponent: {
                    if (modelData === "volume") {
                        return volume;
                    } else if (modelData === "bluetooth") {
                        return bluetooth;
                    } else if (modelData === "battery") {
                        return battery;
                    }
                    return null;
                }
                onLoaded: {
                    // qmllint disable missing-property
                    item.onCloseRequest.connect(() => {
                        let index = root.items.indexOf(modelData);
                        root.items.splice(index, 1);
                    });
                    // qmllint enable
                }
            }
            spacing: 5
            add: Transition {
                ParallelAnimation {
                    AnimateNumber {
                        property: "opacity"
                        from: 0
                        to: 1
                    }
                    AnimateNumber {
                        property: "y"
                        from: 0
                    }
                }
            }
            displaced: Transition {
                ParallelAnimation {
                    AnimateNumber {
                        property: "y"
                    }
                    AnimateNumber {
                        property: "opacity"
                    }
                }
            }
            remove: Transition {
                ParallelAnimation {
                    AnimateNumber {
                        property: "y"
                        to: 0
                    }
                    AnimateNumber {
                        property: "opacity"
                        from: 1
                        to: 0
                    }
                }
            }
        }
        Behavior on implicitHeight {
            AnimateNumber {
                onRunningChanged: {
                    if (!running) {
                        root.windowHeight = list.contentHeight;
                    } else if (root.windowHeight <= list.contentHeight) {
                        root.windowHeight = list.contentHeight;
                    }
                }
            }
        }
    }
    Rectangle {
        anchors {
            right: parent.right
            bottom: parent.bottom
        }
        implicitHeight: root.windowHeight === 0 ? 0 : Constants.radius
        implicitWidth: Constants.radius
        color: "transparent"
        Shape {
            anchors {
                fill: parent
            }
            preferredRendererType: Shape.CurveRenderer
            ShapePath {
                strokeWidth: 0
                fillColor: Colors.background
                startX: Constants.radius
                startY: Constants.radius
                PathArc {
                    x: 0
                    y: 0
                    radiusX: Constants.radius
                    radiusY: Constants.radius
                }
                PathLine {
                    x: 0
                    y: Constants.radius
                }
            }
        }
        Behavior on implicitHeight {
            AnimateNumber {}
        }
    }
    Rectangle {
        anchors {
            left: parent.left
            bottom: parent.bottom
        }
        implicitHeight: root.windowHeight === 0 ? 0 : Constants.radius
        implicitWidth: Constants.radius
        color: "transparent"
        Shape {
            anchors {
                fill: parent
            }
            preferredRendererType: Shape.CurveRenderer
            ShapePath {
                strokeWidth: 0
                fillColor: Colors.background
                startX: Constants.radius
                startY: 0
                PathArc {
                    x: 0
                    y: Constants.radius
                    radiusX: Constants.radius
                    radiusY: Constants.radius
                }
                PathLine {
                    x: Constants.radius
                    y: Constants.radius
                }
            }
        }
        Behavior on implicitHeight {
            AnimateNumber {}
        }
    }
    Component {
        id: volume
        VolumeOSD {}
    }
    Component {
        id: bluetooth
        BluetoothOSD {}
    }
    Component {
        id: battery
        BatteryOSD {}
    }
    function updateOSD(id) {
        let index = root.items.findIndex(it => it === id);
        if (index === -1) {
            root.items.push(id);
        } else {
            // qmllint disable missing-property
            list.itemAtIndex(index)?.item?.reset();
            // qmllint enable
        }
    }
    Component.onCompleted: {
        PipewireService.onSinkUpdate.connect(() => {
            updateOSD("volume");
        });
        BluetoothService.onUpdate.connect(() => {
            updateOSD("bluetooth");
        });
        PowerService.onUpdate.connect(() => {
            updateOSD("battery");
        });
    }
}

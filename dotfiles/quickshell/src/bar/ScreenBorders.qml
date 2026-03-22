import Quickshell
import QtQuick
import QtQuick.Shapes

import qs.common
import qs.generated

// qmllint disable uncreatable-type
Scope {
    id: root

    PanelWindow {
        id: topRight
        anchors {
            top: true
            right: true
        }
        implicitWidth: Constants.screenRadius
        implicitHeight: Constants.screenRadius
        color: "transparent"
        Rectangle {
            Shape {
                anchors.fill: parent
                preferredRendererType: Shape.CurveRenderer
                ShapePath {
                    strokeWidth: 0
                    fillColor: Colors.background
                    startX: 0
                    startY: 0
                    PathArc {
                        x: Constants.screenRadius
                        y: Constants.screenRadius
                        radiusX: Constants.screenRadius
                        radiusY: Constants.screenRadius
                        direction: PathArc.Clockwise
                    }
                    PathLine {
                        x: Constants.screenRadius
                        y: 0
                    }
                    PathLine {
                        x: 0
                        y: 0
                    }
                }
            }
        }
    }
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
        Rectangle {
            Shape {
                anchors.fill: parent
                preferredRendererType: Shape.CurveRenderer
                ShapePath {
                    strokeWidth: 0
                    fillColor: Colors.background
                    startX: 0
                    startY: Constants.screenRadius
                    PathLine {
                        x: Constants.screenRadius
                        y: Constants.screenRadius
                    }
                    PathLine {
                        x: Constants.screenRadius
                        y: 0
                    }
                    PathArc {
                        x: 0
                        y: Constants.screenRadius
                        radiusX: Constants.screenRadius
                        radiusY: Constants.screenRadius
                        direction: PathArc.Clockwise
                    }
                }
            }
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
        Rectangle {
            Shape {
                anchors.fill: parent
                preferredRendererType: Shape.CurveRenderer
                ShapePath {
                    strokeWidth: 0
                    fillColor: Colors.background
                    startX: Constants.screenRadius
                    startY: Constants.screenRadius
                    PathArc {
                        x: 0
                        y: 0
                        radiusX: Constants.screenRadius
                        radiusY: Constants.screenRadius
                        direction: PathArc.Clockwise
                    }
                    PathLine {
                        x: 0
                        y: Constants.screenRadius
                    }
                    PathLine {
                        x: Constants.screenRadius
                        y: Constants.screenRadius
                    }
                }
            }
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
        Rectangle {
            Shape {
                anchors.fill: parent
                preferredRendererType: Shape.CurveRenderer
                ShapePath {
                    strokeWidth: 0
                    fillColor: Colors.background
                    startX: 0
                    startY: Constants.screenRadius
                    PathArc {
                        x: Constants.screenRadius
                        y: 0
                        radiusX: Constants.screenRadius
                        radiusY: Constants.screenRadius
                        direction: PathArc.Clockwise
                    }
                    PathLine {
                        x: 0
                        y: 0
                    }
                    PathLine {
                        x: 0
                        y: Constants.screenRadius
                    }
                }
            }
        }
    }
}

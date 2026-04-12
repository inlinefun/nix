import QtQuick
import QtQuick.Shapes
import Quickshell

import qs.common

// qmllint disable uncreatable-type
Scope {
    id: root
    PanelWindow {
        id: topLeft
        anchors {
            top: true
            left: true
        }
        implicitWidth: Constants.radius
        implicitHeight: Constants.radius
        color: "transparent"
        Rectangle {
            anchors {
                fill: parent
            }
            color: "transparent"
            Shape {
                anchors {
                    fill: parent
                }
                preferredRendererType: Shape.CurveRenderer
                ShapePath {
                    strokeWidth: 0
                    fillColor: Colors.background
                    startX: 0
                    startY: Constants.radius
                    PathArc {
                        x: Constants.radius
                        y: 0
                        radiusX: Constants.radius
                        radiusY: Constants.radius
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
        id: left
        anchors {
            top: true
            left: true
            bottom: true
        }
        implicitWidth: Constants.borderSize
        color: Colors.background
    }
    PanelWindow {
        id: bottomLeft
        anchors {
            left: true
            bottom: true
        }
        implicitWidth: Constants.radius
        implicitHeight: Constants.radius
        color: "transparent"
        Rectangle {
            anchors {
                fill: parent
            }
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
        }
    }
    PanelWindow {
        id: bottom
        anchors {
            left: true
            right: true
            bottom: true
        }
        implicitHeight: Constants.borderSize
        color: Colors.background
    }
    PanelWindow {
        id: bottomRight
        anchors {
            right: true
            bottom: true
        }
        implicitWidth: Constants.radius
        implicitHeight: Constants.radius
        color: "transparent"
        Rectangle {
            anchors {
                fill: parent
            }
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
        }
    }
    PanelWindow {
        id: right
        anchors {
            top: true
            right: true
            bottom: true
        }
        implicitWidth: Constants.borderSize
        color: Colors.background
    }
    PanelWindow {
        id: topRight
        anchors {
            top: true
            right: true
        }
        implicitWidth: Constants.radius
        implicitHeight: Constants.radius
        color: "transparent"
        Rectangle {
            anchors {
                fill: parent
            }
            color: "transparent"
            Shape {
                anchors {
                    fill: parent
                }
                preferredRendererType: Shape.CurveRenderer
                ShapePath {
                    strokeWidth: 0
                    fillColor: Colors.background
                    startX: 0
                    startY: 0
                    PathArc {
                        x: Constants.radius
                        y: Constants.radius
                        radiusX: Constants.radius
                        radiusY: Constants.radius
                    }
                    PathLine {
                        x: Constants.radius
                        y: 0
                    }
                }
            }
        }
    }
}

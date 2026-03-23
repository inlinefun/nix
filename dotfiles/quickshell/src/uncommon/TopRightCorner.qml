import QtQuick
import QtQuick.Shapes

import qs.common

Rectangle {
    color: "transparent"
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

// Generated from SVG file svg/chat.svg
import QtQuick
import QtQuick.VectorImage
import QtQuick.Shapes

import qs.common

Item {
    id: __qt_toplevel

    required property int size
    property color color: Colors.foreground

    implicitWidth: __qt_toplevel.size
    implicitHeight: __qt_toplevel.size
    transform: [
        Scale {
            xScale: __qt_toplevel.width / 32
            yScale: __qt_toplevel.height / 32
        }
    ]
    Shape {
        id: _qt_node0
        preferredRendererType: Shape.CurveRenderer
        objectName: "icon"
        ShapePath {
            id: _qt_shapePath_0
            strokeColor: "transparent"
            fillColor: __qt_toplevel.color
            fillRule: ShapePath.WindingFill
            pathHints: ShapePath.PathQuadratic | ShapePath.PathNonIntersecting | ShapePath.PathNonOverlappingControlPointTriangles
            PathSvg {
                path: "M 17.74 30 L 16 29 L 20 22 L 26 22 Q 26.8284 22 27.4142 21.4142 Q 28 20.8284 28 20 L 28 8 Q 28 7.17157 27.4142 6.58579 Q 26.8284 6 26 6 L 6 6 Q 5.17157 6 4.58579 6.58579 Q 4 7.17157 4 8 L 4 20 Q 4 20.8284 4.58579 21.4142 Q 5.17157 22 6 22 L 15 22 L 15 24 L 6 24 Q 4.34315 24 3.17157 22.8284 Q 2 21.6569 2 20 L 2 8 Q 2 6.34315 3.17157 5.17157 Q 4.34315 4 6 4 L 26 4 Q 27.6569 4 28.8284 5.17157 Q 30 6.34315 30 8 L 30 20 Q 30 21.6569 28.8284 22.8284 Q 27.6569 24 26 24 L 21.16 24 L 17.74 30 "
            }
        }
        ShapePath {
            id: _qt_shapePath_1
            strokeColor: "transparent"
            fillColor: __qt_toplevel.color
            fillRule: ShapePath.WindingFill
            pathHints: ShapePath.PathQuadratic | ShapePath.PathNonIntersecting | ShapePath.PathNonOverlappingControlPointTriangles
            PathSvg {
                path: "M 8 10 L 24 10 L 24 12 L 8 12 L 8 10 "
            }
        }
        ShapePath {
            id: _qt_shapePath_2
            strokeColor: "transparent"
            fillColor: __qt_toplevel.color
            fillRule: ShapePath.WindingFill
            pathHints: ShapePath.PathQuadratic | ShapePath.PathNonIntersecting | ShapePath.PathNonOverlappingControlPointTriangles
            PathSvg {
                path: "M 8 16 L 18 16 L 18 18 L 8 18 L 8 16 "
            }
        }
    }
}

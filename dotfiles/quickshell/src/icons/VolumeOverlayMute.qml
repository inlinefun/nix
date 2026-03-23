// Generated from SVG file svg/volume_mute.svg
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
            objectName: "svg_path:polygon1"
            strokeColor: "transparent"
            fillColor: __qt_toplevel.color
            fillRule: ShapePath.WindingFill
            pathHints: ShapePath.PathQuadratic | ShapePath.PathNonIntersecting | ShapePath.PathNonOverlappingControlPointTriangles
            PathSvg {
                path: "M 31 12.41 L 29.59 11 L 26 14.59 L 22.41 11 L 21 12.41 L 24.59 16 L 21 19.59 L 22.41 21 L 26 17.41 L 29.59 21 L 31 19.59 L 27.41 16 L 31 12.41 "
            }
        }
    }
}

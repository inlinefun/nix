// Generated from SVG file svg/volume_overlay_1.svg
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
            objectName: "svg_path:path2"
            strokeColor: "transparent"
            fillColor: __qt_toplevel.color
            fillRule: ShapePath.WindingFill
            pathHints: ShapePath.PathQuadratic | ShapePath.PathNonIntersecting | ShapePath.PathNonOverlappingControlPointTriangles
            PathSvg {
                path: "M 21.58 12 Q 23.0432 13.735 22.9917 16.004 Q 22.9403 18.2731 21.4 19.94 L 22.87 21.3 Q 24.923 19.0751 24.9887 16.0485 Q 25.0545 13.0219 23.1 10.71 L 21.58 12 "
            }
        }
    }
}

// Generated from SVG file svg/volume_icon.svg
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
            objectName: "svg_path:path3"
            strokeColor: "transparent"
            fillColor: __qt_toplevel.color
            fillRule: ShapePath.WindingFill
            pathHints: ShapePath.PathQuadratic | ShapePath.PathNonIntersecting | ShapePath.PathNonOverlappingControlPointTriangles
            PathSvg {
                path: "M 18 30 Q 17.5824 29.9983 17.29 29.7 L 9.67 22 L 3 22 Q 2.58579 22 2.29289 21.7071 Q 2 21.4142 2 21 L 2 11 Q 2 10.5858 2.29289 10.2929 Q 2.58579 10 3 10 L 9.67 10 L 17.29 2.3 Q 17.5825 2.00921 17.995 2.00921 Q 18.4075 2.00921 18.7 2.3 Q 18.9941 2.58823 19 3 L 19 29 Q 19 29.4142 18.7071 29.7071 Q 18.4142 30 18 30 "
            }
        }
    }
}

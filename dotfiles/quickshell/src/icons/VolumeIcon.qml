// Generated from SVG file svgs/volume_icon.svg
import QtQuick
import QtQuick.VectorImage
import QtQuick.Shapes

import qs.common

Item {
    id: __qt_toplevel
    property int size: 24
    property color color: Colors.foreground
    implicitWidth: __qt_toplevel.size
    implicitHeight: __qt_toplevel.size
    transform: [
        Translate {
            x: 0
            y: 960
        },
        Scale {
            xScale: __qt_toplevel.width / 960
            yScale: __qt_toplevel.height / 960
        }
    ]
    Shape {
        id: _qt_node0
        preferredRendererType: Shape.CurveRenderer
        objectName: "svg1"
        ShapePath {
            id: _qt_shapePath_0
            objectName: "svg_path:path1"
            strokeColor: "transparent"
            fillColor: __qt_toplevel.color
            fillRule: ShapePath.WindingFill
            pathHints: ShapePath.PathQuadratic | ShapePath.PathNonIntersecting | ShapePath.PathNonOverlappingControlPointTriangles
            PathSvg {
                path: "M 280 -360 L 160 -360 Q 143 -360 131.5 -371.5 Q 120 -383 120 -400 L 120 -560 Q 120 -577 131.5 -588.5 Q 143 -600 160 -600 L 280 -600 L 412 -732 Q 431 -751 455.5 -740.5 Q 480 -730 480 -703 L 480 -257 Q 480 -230 455.5 -219.5 Q 431 -209 412 -228 L 280 -360 M 400 -606 L 314 -520 L 200 -520 L 200 -440 L 314 -440 L 400 -354 L 400 -606 "
            }
        }
    }
}

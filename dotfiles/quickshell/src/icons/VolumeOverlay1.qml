// Generated from SVG file svgs/volume_overlay_1.svg
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
                path: "M 760 -481 Q 760 -564 716 -632.5 Q 672 -701 598 -735 Q 583 -742 576 -756.5 Q 569 -771 574 -786 Q 580 -802 595.5 -809 Q 611 -816 627 -809 Q 724 -766 782 -677.5 Q 840 -589 840 -481 Q 840 -373 782 -284.5 Q 724 -196 627 -153 Q 611 -146 595.5 -153 Q 580 -160 574 -176 Q 569 -191 576 -205.5 Q 583 -220 598 -227 Q 672 -261 716 -329.5 Q 760 -398 760 -481 "
            }
        }
    }
}

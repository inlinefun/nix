// Generated from SVG file svgs/volume_overlay_0.svg
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
                path: "M 660 -480 Q 660 -438 641 -400.5 Q 622 -363 591 -339 Q 581 -333 570.5 -338.5 Q 560 -344 560 -356 L 560 -606 Q 560 -618 570.5 -623.5 Q 581 -629 591 -623 Q 622 -598 641 -560 Q 660 -522 660 -480 "
            }
        }
    }
}

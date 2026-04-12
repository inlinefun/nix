// Generated from SVG file svgs/mic_overlay.svg
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
                path: "M 395 -435 Q 360 -470 360 -520 L 360 -760 Q 360 -810 395 -845 Q 430 -880 480 -880 Q 530 -880 565 -845 Q 600 -810 600 -760 L 600 -520 Q 600 -470 565 -435 Q 530 -400 480 -400 Q 430 -400 395 -435 "
            }
        }
    }
}

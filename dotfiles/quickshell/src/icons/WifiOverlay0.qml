// Generated from SVG file svgs/wifi_overlay_0.svg
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
                path: "M 622.5 -536 Q 690 -512 745 -470 Q 765 -455 765.5 -430.5 Q 766 -406 748 -388 Q 731 -371 706 -370.5 Q 681 -370 661 -384 Q 623 -410 577 -425 Q 531 -440 480 -440 Q 429 -440 383 -425 Q 337 -410 299 -384 Q 279 -370 254 -371 Q 229 -372 212 -389 Q 195 -407 195 -431.5 Q 195 -456 215 -471 Q 270 -513 337.5 -536.5 Q 405 -560 480 -560 Q 555 -560 622.5 -536 "
            }
        }
    }
}

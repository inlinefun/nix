// Generated from SVG file svgs/wifi_lock_overlay.svg
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
                path: "M 760 0 Q 743 0 731.5 -11.5 Q 720 -23 720 -40 L 720 -160 Q 720 -177 731.5 -188.5 Q 743 -200 760 -200 L 760 -240 Q 760 -273 783.5 -296.5 Q 807 -320 840 -320 Q 873 -320 896.5 -296.5 Q 920 -273 920 -240 L 920 -200 Q 937 -200 948.5 -188.5 Q 960 -177 960 -160 L 960 -40 Q 960 -23 948.5 -11.5 Q 937 0 920 0 L 760 0 M 800 -200 L 880 -200 L 880 -240 Q 880 -257 868.5 -268.5 Q 857 -280 840 -280 Q 823 -280 811.5 -268.5 Q 800 -257 800 -240 L 800 -200 "
            }
        }
    }
}

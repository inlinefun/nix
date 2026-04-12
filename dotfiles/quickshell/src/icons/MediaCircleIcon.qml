// Generated from SVG file svgs/media_circle.svg
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
                path: "M 480 -80 Q 397 -80 324 -111.5 Q 251 -143 197 -197 Q 143 -251 111.5 -324 Q 80 -397 80 -480 Q 80 -563 111.5 -636 Q 143 -709 197 -763 Q 251 -817 324 -848.5 Q 397 -880 480 -880 Q 563 -880 636 -848.5 Q 709 -817 763 -763 Q 817 -709 848.5 -636 Q 880 -563 880 -480 Q 880 -397 848.5 -324 Q 817 -251 763 -197 Q 709 -143 636 -111.5 Q 563 -80 480 -80 M 480 -160 Q 614 -160 707 -253 Q 800 -346 800 -480 Q 800 -614 707 -707 Q 614 -800 480 -800 Q 346 -800 253 -707 Q 160 -614 160 -480 Q 160 -346 253 -253 Q 346 -160 480 -160 "
            }
        }
    }
}

// Generated from SVG file svgs/media_play.svg
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
                path: "M 426 -330 L 621 -455 Q 635 -464 635 -480 Q 635 -496 621 -505 L 426 -630 Q 411 -640 395.5 -631.5 Q 380 -623 380 -605 L 380 -355 Q 380 -337 395.5 -328.5 Q 411 -320 426 -330 "
            }
        }
    }
}

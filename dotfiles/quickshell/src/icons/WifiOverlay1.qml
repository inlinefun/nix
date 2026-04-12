// Generated from SVG file svgs/wifi_overlay_1.svg
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
                path: "M 715.5 -759 Q 826 -718 914 -643 Q 934 -626 935 -601 Q 936 -576 918 -558 Q 901 -541 876 -540.5 Q 851 -540 831 -556 Q 759 -615 669.5 -647.5 Q 580 -680 480 -680 Q 380 -680 290.5 -647.5 Q 201 -615 129 -556 Q 109 -540 84 -540.5 Q 59 -541 42 -558 Q 24 -576 25 -601 Q 26 -626 46 -643 Q 134 -718 244.5 -759 Q 355 -800 480 -800 Q 605 -800 715.5 -759 "
            }
        }
    }
}

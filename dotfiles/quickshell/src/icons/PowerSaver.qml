// Generated from SVG file svgs/power_saver.svg
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
        ShapePath {
            id: _qt_shapePath_0
            strokeColor: "transparent"
            fillColor: __qt_toplevel.color
            fillRule: ShapePath.WindingFill
            pathHints: ShapePath.PathQuadratic | ShapePath.PathNonIntersecting | ShapePath.PathNonOverlappingControlPointTriangles
            PathSvg {
                path: "M 480 -240 Q 580 -240 649 -310 Q 718 -380 720 -480 L 720 -720 L 480 -720 Q 380 -718 310 -649 Q 240 -580 240 -480 Q 240 -380 310 -310 Q 380 -240 480 -240 M 433 -307 L 617 -471 Q 626 -479 622 -490 Q 618 -501 606 -503 L 462 -517 L 548 -636 Q 551 -641 551.5 -645.5 Q 552 -650 548 -654 Q 544 -659 538 -658.5 Q 532 -658 527 -654 L 344 -490 Q 335 -482 339 -471 Q 343 -460 355 -458 L 499 -444 L 412 -325 Q 409 -320 409 -315.5 Q 409 -311 413 -307 Q 417 -303 422.5 -303 Q 428 -303 433 -307 M 480 -160 Q 424 -160 374.5 -177.5 Q 325 -195 284 -227 L 229 -172 Q 223 -166 215.5 -163 Q 208 -160 200 -160 Q 183 -160 171.5 -171.5 Q 160 -183 160 -200 Q 160 -208 163 -215.5 Q 166 -223 172 -229 L 227 -284 Q 195 -325 177.5 -374.5 Q 160 -424 160 -480 Q 160 -614 253 -707 Q 346 -800 480 -800 L 720 -800 Q 753 -800 776.5 -776.5 Q 800 -753 800 -720 L 800 -480 Q 800 -346 707 -253 Q 614 -160 480 -160 "
            }
        }
    }
}

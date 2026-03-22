// Generated from SVG file svg/flash.svg
import QtQuick
import QtQuick.VectorImage
import QtQuick.VectorImage.Helpers
import QtQuick.Shapes

import qs.common

Item {
    id: __qt_toplevel

    required property int size
    property color color: Colors.foreground

    implicitWidth: __qt_toplevel.size
    implicitHeight: __qt_toplevel.size
    transform: [
        Scale {
            xScale: __qt_toplevel.width / 32
            yScale: __qt_toplevel.height / 32
        }
    ]
    Shape {
        id: _qt_node1
        preferredRendererType: Shape.CurveRenderer
        ShapePath {
            id: _qt_shapePath_0
            strokeColor: "transparent"
            fillColor: __qt_toplevel.color
            fillRule: ShapePath.WindingFill
            pathHints: ShapePath.PathQuadratic | ShapePath.PathNonIntersecting | ShapePath.PathNonOverlappingControlPointTriangles
            PathSvg {
                path: "M 11.61 29.92 Q 11.2943 29.7867 11.1267 29.4878 Q 10.959 29.1889 11.01 28.85 L 12.83 17 L 8 17 Q 7.50779 17.0132 7.19718 16.6312 Q 6.88657 16.2491 7 15.77 L 10 2.77 Q 10.0816 2.42412 10.3632 2.20731 Q 10.6448 1.9905 11 2 L 21 2 Q 21.4785 1.99837 21.78 2.37 Q 22.0863 2.74647 21.98 3.22 L 20.25 11 L 25 11 Q 25.2868 10.9994 25.5303 11.1509 Q 25.7738 11.3025 25.9 11.56 Q 26.0094 11.8066 25.9799 12.0748 Q 25.9504 12.343 25.79 12.56 L 12.79 29.56 Q 12.5065 29.9802 12 30 Q 11.7976 29.9962 11.61 29.92 "
            }
        }
    }
    Shape {
        id: _qt_node2
        objectName: "_Transparent_Rectangle_"
        transform: TransformGroup {
            id: _qt_node2_transform_base_group
            Matrix4x4 {
                matrix: PlanarTransform.fromAffineMatrix(-1, -1.22465e-16, 1.22465e-16, -1, 32, 32)
            }
        }
        preferredRendererType: Shape.CurveRenderer
    }
}

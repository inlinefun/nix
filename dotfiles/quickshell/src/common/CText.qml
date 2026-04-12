import QtQuick

import qs.common

Text {
    id: root
    property int size: Constants.fontSize
    color: Colors.foreground
    font {
        pixelSize: root.size
        family: Constants.font
    }
}

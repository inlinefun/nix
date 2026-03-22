import QtQuick

import qs.common

Text {
    id: root
    property int size: 14
    font {
        family: Constants.fontFamily
        pointSize: root.size
    }
    color: Colors.foreground
}

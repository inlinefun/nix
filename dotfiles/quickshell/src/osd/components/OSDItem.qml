import QtQuick

Item {
    id: root

    signal onCloseRequest

    implicitWidth: 240
    implicitHeight: 60

    function reset() {
        timer.restart();
    }

    Timer {
        id: timer
        interval: 3000
        repeat: false
        running: true
        onTriggered: root.onCloseRequest()
    }
}

import QtQuick
import QtQuick.Layouts

import qs.animations
import qs.common
import qs.icons
import qs.services

MouseArea {
    id: root

    property color color: {
        if (AudioService.sinkMuted || AudioService.sinkVolume == 0) {
            return Colors.red;
        }
        if (AudioService.sinkVolume == 100) {
            return Colors.cyan;
        } else if (AudioService.sinkVolume <= 10) {
            return Colors.orange;
        } else if (AudioService.sinkVolume <= 20) {
            return Colors.yellow;
        }
        return Colors.foreground;
    }

    Layout.fillHeight: true

    acceptedButtons: Qt.RightButton
    hoverEnabled: true
    implicitWidth: height
    onClicked: event => {
        if (event.button == Qt.RightButton) {
            AudioService.toggleSinkMute();
        }
    }
    onWheel: event => {
        var increment = event.angleDelta.y > 0.0;
        AudioService.changeSinkVolume(increment);
    }

    Rectangle {
        anchors.fill: parent
        color: Colors.backgroundVariant
        opacity: root.containsMouse ? 1 : 0
        Behavior on opacity {
            AnimateNumber {}
        }
    }
    VolumeIcon {
        size: 20
        anchors.centerIn: parent
        color: root.color
    }
    VolumeOverlay1 {
        size: 20
        anchors.centerIn: parent
        opacity: (AudioService.sinkVolume * 2) / 100
        color: root.color
        Behavior on opacity {
            AnimateNumber {}
        }
    }
    VolumeOverlay2 {
        size: 20
        anchors.centerIn: parent
        opacity: (Math.max(AudioService.sinkVolume, 50) - 50) / 100 * 2
        color: root.color
        Behavior on opacity {
            AnimateNumber {}
        }
    }
    Behavior on color {
        AnimateColor {}
    }
}

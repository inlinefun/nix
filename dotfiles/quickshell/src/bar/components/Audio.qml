import QtQuick
import QtQuick.Layouts

import qs.common
import qs.icons
import qs.services

MouseArea {
    id: root

    property color color: {
        if (PipewireService.sinkMuted || PipewireService.sinkVolume == 0) {
            return Colors.red;
        } else if (PipewireService.sinkVolume == 100) {
            return Colors.cyan;
        } else if (PipewireService.sinkVolume <= 10) {
            return Colors.orange;
        } else if (PipewireService.sinkVolume <= 20) {
            return Colors.yellow;
        }
        return Colors.foreground;
    }

    Layout.fillHeight: true
    Layout.preferredWidth: height
    hoverEnabled: true
    acceptedButtons: Qt.RightButton
    onWheel: event => {
        let change = event.angleDelta.y;
        let increment = 5;
        if (change < 0) {
            increment *= -1;
        }
        PipewireService.incrementSinkVolume(increment);
    }
    onClicked: event => {
        event.accepted = true;
        if (event.button == Qt.RightButton) {
            PipewireService.toggleSinkMute();
        }
    }

    VolumeIcon {
        anchors {
            centerIn: parent
        }
        color: root.color
    }
    VolumeOverlay0 {
        anchors {
            centerIn: parent
        }
        color: root.color
        opacity: PipewireService.sinkVolume / 50
    }
    VolumeOverlay1 {
        anchors {
            centerIn: parent
        }
        color: root.color
        opacity: (PipewireService.sinkVolume - 50) / 50
    }
    Item {
        anchors {
            centerIn: parent
        }
        implicitHeight: 32
        implicitWidth: 32
        rotation: -45
        Rectangle {
            anchors {
                horizontalCenter: parent.horizontalCenter
            }
            implicitHeight: PipewireService.sinkMuted ? 32 : 0
            implicitWidth: 6
            radius: width
            border {
                color: Colors.background
                width: 2
            }
            color: root.color
            Behavior on implicitHeight {
                AnimateNumber {}
            }
        }
    }
    Behavior on color {
        AnimateColor {}
    }
}

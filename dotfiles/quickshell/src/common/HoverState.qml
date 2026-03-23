pragma Singleton

import Quickshell
import QtQuick

Singleton {
    id: root

    readonly property int hoverState: p.hoverState

    function updateHover(state: int) {
        p.tempHoverState = state;
        timer.restart();
    }

    Timer {
        id: timer
        interval: 150
        running: false
        repeat: false
        onTriggered: {
            p.hoverState = p.tempHoverState;
        }
    }
    PersistentProperties {
        id: p
        property int hoverState: HoverStates.None
        property int tempHoverState: HoverStates.None
    }
}

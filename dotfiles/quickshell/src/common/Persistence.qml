pragma Singleton

import QtQuick
import Quickshell

Singleton {
    id: root

    readonly property int focusedItem: persistence.focusedItem

    function updateFocus(item: int) {
        persistence._focusedItem = item;
    }

    Timer {
        id: focusTimer
        interval: 200
        repeat: false
        running: false
        onTriggered: {
            if (persistence._focusedItem === PopoutItems.Popout) {
                return;
            }
            persistence.focusedItem = persistence._focusedItem;
        }
    }
    PersistentProperties {
        id: persistence

        property int focusedItem: PopoutItems.None
        property int _focusedItem: PopoutItems.None
        on_FocusedItemChanged: {
            if (persistence._focusedItem === PopoutItems.Popout) {
                return;
            } else if (persistence._focusedItem === PopoutItems.None) {
                focusTimer.restart();
            } else {
                persistence.focusedItem = persistence._focusedItem;
            }
        }
    }
}

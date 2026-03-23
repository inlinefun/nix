pragma Singleton

import Quickshell

Singleton {
    id: root

    property bool rightSidebar: persistence.rightBar

    function toggleRightbar() {
        persistence.rightBar = !persistence.rightBar;
    }

    PersistentProperties {
        id: persistence
        property bool rightBar: false
    }
}

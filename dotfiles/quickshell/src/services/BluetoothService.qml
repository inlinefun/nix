pragma Singleton

import Quickshell
import Quickshell.Bluetooth

Singleton {
    id: root

    // qmllint disable unresolved-type
    readonly property BluetoothAdapter adapter: Bluetooth.defaultAdapter
    readonly property bool connected: adapter?.devices.length > 0
    readonly property int state: adapter?.state ?? BluetoothAdapterState.Disabled
    // qmllint enable
    readonly property bool enabled: adapter?.enabled ?? false

    signal onUpdate

    onStateChanged: {
        root.onUpdate();
    }

    function toggleBluetooth() {
        if (adapter === null) {
            return;
        }
        adapter.enabled = !adapter.enabled;
    }
}

pragma Singleton

import Quickshell
import Quickshell.Services.UPower

Singleton {
    id: root

    readonly property UPowerDevice device: UPower.displayDevice
    readonly property int isLaptop: device.isLaptopBattery
    readonly property int battery: device.percentage * 100
    readonly property int state: device.state
    readonly property bool charging: device.state == UPowerDeviceState.Charging
    readonly property bool full: device.state == UPowerDeviceState.FullyCharged
    readonly property string label: UPowerDeviceState.toString(state)

    signal onUpdate

    onStateChanged: {
        // i hate this moving all around between Discharging to Fully Charged every minute or so
        if (battery === 100) {
            return;
        }
        root.onUpdate();
    }
    onBatteryChanged: {
        if (root.battery === 100) {
            root.onUpdate();
        } else if (root.battery <= 30 && root.battery % 5 === 0) {
            root.onUpdate();
        }
    }
}

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
}

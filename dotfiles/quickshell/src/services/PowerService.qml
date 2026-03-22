pragma Singleton

import Quickshell
import Quickshell.Services.UPower

Singleton {
    id: root

    readonly property UPowerDevice device: UPower.displayDevice
    readonly property int charge: (device.percentage * 100)
    readonly property int state: device.state
    readonly property bool charging: state == UPowerDeviceState.Charging
    readonly property bool full: state == UPowerDeviceState.FullyCharged
    readonly property bool critical: charge <= 25

    readonly property int profile: PowerProfiles.profile
    readonly property bool performance: profile == PowerProfile.Performance
    readonly property bool balanced: profile == PowerProfile.Balanced
    readonly property bool powersaver: profile == PowerProfile.PowerSaver
}

pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Networking

Singleton {
    id: root

    readonly property var secureTypes: [WifiSecurityType.Wpa2Psk, WifiSecurityType.Wpa2Eap, WifiSecurityType.WpaEap, WifiSecurityType.Sae, WifiSecurityType.Wpa3SuiteB192]
    readonly property var limitedConnections: [NetworkConnectivity.Portal, NetworkConnectivity.Limited, NetworkConnectivity.Unknown]

    readonly property bool wifiEnabled: Networking.wifiEnabled
    readonly property int connectivity: Networking.connectivity
    readonly property bool limitedConnectivity: limitedConnections.indexOf(connectivity) !== -1
    readonly property bool connected: connectivity === NetworkConnectivity.Full

    readonly property list<NetworkDevice> devices: Networking.devices.values ?? []
    readonly property WifiDevice wifi: devices.find(device => device.type === DeviceType.Wifi) ?? null
    readonly property list<Network> wifiNetworks: wifi?.networks.values ?? []
    readonly property WifiNetwork wifiNetwork: wifiNetworks[0] ?? null
    // qmllint disable unresolved-type
    readonly property bool secureNetwork: secureTypes.indexOf(wifiNetwork?.security ?? null) !== -1
    // qmllint enable
    readonly property real networkStrength: wifiNetwork?.signalStrength ?? 1

    function toggleWifi() {
        Networking.wifiEnabled = !Networking.wifiEnabled;
    }
}

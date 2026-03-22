pragma ComponentBehavior: Bound
pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root
    // qmllint disable unqualified
    readonly property color background: adapter.base00
    readonly property color foreground: adapter.base05
    readonly property color red: adapter.base08
    readonly property color orange: adapter.base09
    readonly property color yellow: adapter.base0A
    readonly property color green: adapter.base0B
    readonly property color cyan: adapter.base0C
    readonly property color blue: adapter.base0D
    readonly property color magenta: adapter.base0E

    readonly property color backgroundVariant: adapter.base01

    FileView {
        id: file
        path: {
            let configDir = Quickshell.env("XDG_CONFIG_DIR") ?? (Quickshell.env("HOME") + "/.config/");
            let quickshellConfig = configDir + (configDir.endsWith("/") ? "" : "/") + "quickshell/";
            let path = quickshellConfig + "colors.json";
            return path;
        }
        watchChanges: true
        onFileChanged: reload()
        onLoadFailed: err => {
            console.log(err);
            if (err == FileViewError.FileNotFound) {
                writeAdapter();
            }
        }
        // qmllint disable unresolved-type
        JsonAdapter {
            id: adapter
            property color base00: "#0b0e14"
            property color base01: "#131721"
            property color base02: "#202229"
            property color base03: "#3e4b59"
            property color base04: "#bfbdb6"
            property color base05: "#e6e1cf"
            property color base06: "#ece8db"
            property color base07: "#f2f0e7"
            property color base08: "#f07178"
            property color base09: "#ff8f40"
            property color base0A: "#ffb454"
            property color base0B: "#aad94c"
            property color base0C: "#95e6cb"
            property color base0D: "#59c2ff"
            property color base0E: "#d2a6ff"
            property color base0F: "#e6b450"
            property color base10: "#0a0d13"
            property color base11: "#06070A"
            property color base12: "#f26d78"
            property color base13: "#e6b673"
            property color base14: "#7fd962"
            property color base15: "#39bae6"
            property color base16: "#73b8ff"
            property color base17: "#ddbcff"
        }
    }
}

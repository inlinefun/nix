pragma ComponentBehavior: Bound
pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root

    // qmllint disable unresolved-type
    readonly property color background: file.adapter.base00
    readonly property color background_variant: file.adapter.base01
    readonly property color background_dark: file.adapter.base11
    readonly property color foreground: file.adapter.base05
    readonly property color foreground_variant: file.adapter.base06
    readonly property color foreground_bright: file.adapter.base07
    readonly property color red: file.adapter.base08
    readonly property color orange: file.adapter.base09
    readonly property color yellow: file.adapter.base0A
    readonly property color green: file.adapter.base0B
    readonly property color cyan: file.adapter.base0C
    readonly property color blue: file.adapter.base0D
    readonly property color magenta: file.adapter.base0E
    // qmllint enable

    FileView {
        id: file
        path: {
            let path = Quickshell.env("HOME");
            let colors = path + (path.endsWith("/") ? "" : "/") + ".scheme.json";
            return colors;
        }
        onLoadFailed: err => {
            if (err == FileViewError.FileNotFound) {
                writeAdapter();
            } else {
                console.log(err);
            }
        }
        // qmllint disable unresolved-type
        adapter: JsonAdapter {
            // qmllint enable
            id: adapter
            property string base00: "#262427"
            property string base01: "#3b393c"
            property string base02: "#514f52"
            property string base03: "#676567"
            property string base04: "#7c7b7d"
            property string base05: "#fcfcfc"
            property string base06: "#eae9eb"
            property string base07: "#fcfcfc"
            property string base08: "#ff7272"
            property string base09: "#fc9d6f"
            property string base0A: "#ffca58"
            property string base0B: "#bcdf59"
            property string base0C: "#aee8f4"
            property string base0D: "#49cae4"
            property string base0E: "#a093e2"
            property string base0F: "#ff8787"
            property string base10: "#1e1d1f"
            property string base11: "#0f0e10"
            property string base12: "#ff8787"
            property string base13: "#ffd271"
            property string base14: "#c6e472"
            property string base15: "#baebf6"
            property string base16: "#64d2e8"
            property string base17: "#aea3e6"
        }
    }
}

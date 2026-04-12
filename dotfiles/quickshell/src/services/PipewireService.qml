pragma Singleton

import Quickshell
import Quickshell.Services.Pipewire

Singleton {
    id: root

    readonly property PwNode sink: Pipewire.defaultAudioSink
    readonly property bool sinkReady: sink?.ready ?? false
    readonly property PwNodeAudio sinkAudio: sink?.audio ?? null
    readonly property int sinkVolume: sinkReady ? (sinkAudio.volume * 100) : 0
    readonly property bool sinkMuted: sinkReady ? sinkAudio.muted : false

    readonly property PwNode source: Pipewire.defaultAudioSource
    readonly property bool sourceReady: source?.ready ?? false
    readonly property PwNodeAudio sourceAudio: source?.audio ?? null
    readonly property int sourceVolume: sourceReady ? (sourceAudio.volume * 100) : 0
    readonly property bool sourceMuted: sourceReady ? sinkAudio.muted : false

    signal onSinkUpdate
    signal onSourceUpdate

    function toggleSinkMute() {
        if (sinkAudio !== null) {
            sinkAudio.muted = !sinkMuted;
        }
    }

    onSinkVolumeChanged: {
        root.onSinkUpdate();
    }
    onSinkMutedChanged: {
        root.onSinkUpdate();
    }

    PwObjectTracker {
        id: tracker
        objects: [root.sink, root.source]
    }
}

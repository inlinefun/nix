pragma Singleton

import Quickshell
import Quickshell.Services.Pipewire

Singleton {
    id: root

    readonly property PwNode sink: Pipewire.preferredDefaultAudioSink ?? Pipewire.defaultAudioSink
    readonly property bool sinkMuted: sink?.audio.muted ?? false
    readonly property int sinkVolume: (sink?.audio.volume ?? 0.0) * 100.0
    property bool _sinkReadied: false
    signal onSinkVolumeChange
    signal onSinkMuteChange

    readonly property PwNode source: Pipewire.preferredDefaultAudioSource ?? Pipewire.defaultAudioSource
    readonly property bool sourceMuted: source?.audio.muted ?? false
    readonly property int sourceVolume: (source?.audio.volume ?? 0.0) * 100.0
    property bool _sourceReadied: false
    signal onSourceVolumeChange
    signal onSourceMuteChange

    function changeSinkVolume(increment: bool) {
        let amount = 0.05 * (increment ? 1 : -1);
        sink.audio.volume += amount;
        sink.audio.volume = Math.max(0.0, Math.min(1.0, sink.audio.volume));
    }
    function toggleSinkMute() {
        sink.audio.muted = !sinkMuted;
    }

    PwObjectTracker {
        objects: [root.sink, root.source]
    }
}

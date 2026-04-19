pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets

import qs.common
import qs.services

OSDItem {
    id: root

    property double progress: MediaService.progress * 100.0
    property color color: Colors.foreground

    RowLayout {
        id: layout
        anchors {
            fill: parent
        }
        Item {
            Layout.fillHeight: true
            Layout.preferredWidth: image.status === Image.Ready ? height : 0
            IconImage {
                id: image
                anchors {
                    centerIn: parent
                }
                implicitSize: parent.height - (Constants.marginS * 2)
                source: MediaService.url
                mipmap: true
                asynchronous: true
            }
            Behavior on Layout.margins {
                AnimateNumber {}
            }
            Behavior on Layout.preferredWidth {
                AnimateNumber {}
            }
        }
        ColumnLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.margins: Constants.marginS
            spacing: Constants.marginS
            RowLayout {
                Layout.fillHeight: true
                Layout.fillWidth: true
                ColumnLayout {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    spacing: 0
                    CText {
                        Layout.fillWidth: true
                        Layout.preferredWidth: contentWidth
                        text: MediaService.track
                        size: 16
                        color: Colors.foreground
                        elide: Text.ElideRight
                    }
                    CText {
                        Layout.fillWidth: true
                        Layout.preferredWidth: contentWidth
                        text: MediaService.artist
                        size: 12
                        color: Colors.foreground_variant
                        elide: Text.ElideRight
                    }
                }
                Item {
                    id: icon

                    property color color: quantizer.colors[14] ?? Colors.blue

                    Layout.alignment: Qt.AlignVCenter
                    Layout.fillHeight: true
                    Layout.preferredWidth: height
                    Layout.margins: Constants.marginS
                    Layout.rightMargin: 0
                    ColorQuantizer {
                        id: quantizer
                        source: MediaService.url
                        depth: 4
                        rescaleSize: 64
                    }
                    RowLayout {
                        anchors {
                            centerIn: parent
                        }
                        spacing: 3
                        Repeater {
                            model: 4
                            delegate: Rectangle {
                                id: rect
                                required property int index
                                readonly property int minHeight: 8
                                readonly property int maxHeight: 16
                                Layout.preferredWidth: 2
                                radius: 2
                                color: icon.color
                                SequentialAnimation on Layout.preferredHeight {
                                    running: MediaService.playing
                                    loops: Animation.Infinite
                                    PauseAnimation {
                                        duration: rect.index * 100
                                    }
                                    NumberAnimation {
                                        from: rect.maxHeight
                                        to: rect.minHeight
                                    }
                                    NumberAnimation {
                                        from: rect.minHeight
                                        to: rect.maxHeight
                                    }
                                }
                            }
                        }
                    }
                    Behavior on color {
                        AnimateColor {}
                    }
                }
            }
            Item {
                Layout.fillHeight: true
            }
            RowLayout {
                Layout.fillWidth: true
                Layout.fillHeight: true
                spacing: Constants.marginS
                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredWidth: root.progress
                    implicitHeight: 4
                    color: Colors.blue
                    radius: 2
                    opacity: root.progress === 0 ? 0 : 1
                    Behavior on opacity {
                        AnimateNumber {}
                    }
                }
                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredWidth: 100 - root.progress
                    Layout.preferredHeight: 4
                    color: Colors.background_variant
                    radius: 2
                    opacity: root.progress === 100 ? 0 : 1
                    Behavior on opacity {
                        AnimateNumber {}
                    }
                }
            }
            Item {
                Layout.fillHeight: true
            }
        }
    }
    Behavior on progress {
        AnimateNumber {}
    }
}

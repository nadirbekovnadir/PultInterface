import QtQuick 2.0

import "../Common"
import "../TopScreen/Compass"
import "../TopScreen/Attitude"
import "../TopScreen/Depth"
import "../TopScreen/Force"
import QtQuick.Layouts 6.0
import QtQuick.Controls 6.2

Window {
    property var context

    id: mainWindow
    width: 1900
    height: 800
    visible: true
    color: "#434343"
    minimumWidth: 640
    minimumHeight: 480

    property int marginsHorizontal: 40
    property int marginsVertical: 40
    property real fontSize: 0.5

    CameraModule {
        id: mainCamera
        anchors.fill: parent
        context: mainWindow.context.mainCameraViewModel

        MouseArea {
            anchors.fill: parent
            onClicked: console.log(mainCamera.context)
        }
    }


    Component.onCompleted: console.log(BasicScreen.heightRatio)


    Item {
        id: currentTimeModule
        width: 341
        height: 60
        anchors.top: parent.top
        anchors.topMargin: marginsVertical
        anchors.horizontalCenter: parent.horizontalCenter

        Pane {
            id: pane
            opacity: 0.5
            anchors.fill: parent
        }

        Label {
            id: timeLabel
            text: "01/12/22"
            anchors.fill: parent
            font.pixelSize: height * fontSize
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }

    Item {
        id: warningsModule
        width: parent.width * 0.3
        height: 60
        anchors.bottom: parent.bottom
        anchors.bottomMargin: marginsVertical
        Pane {
            id: pane2
            opacity: 0.5
            anchors.fill: parent
        }

        Label {
            id: lagLabel
            text: "WARNING"
            anchors.fill: parent
            font.pixelSize: height * fontSize
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Item {
        id: telemetryModule
        anchors.fill: parent
        anchors.rightMargin: marginsHorizontal
        anchors.leftMargin: marginsHorizontal
        anchors.bottomMargin: marginsVertical
        anchors.topMargin: marginsVertical

        GridLayout {
            id: gridLayout
            anchors.fill: parent
            columnSpacing: 20
            antialiasing: false
            rowSpacing: 20
            layoutDirection: Qt.RightToLeft
            flow: GridLayout.TopToBottom
            rows: 2
            columns: 2

            Item {
                id: forceBox
                width: 200
                height: 200
                visible: true
                Layout.fillHeight: true
                Layout.fillWidth: true
                enabled: true

                ForceModule {
                    id: forceModule
                    anchors.fill: parent
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.preferredHeight: parent.height / 2
                    Layout.preferredWidth: parent.height / 2
                }

                Pane {
                    id: pane3
                    opacity: 0.5
                    visible: true
                    anchors.fill: parent
                }

                Rectangle {
                    id: attitudeBackground1
                    width: parent.height
                    height: parent.height
                    color: "#c34a00"
                    radius: parent.height
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.verticalCenterOffset: 0
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.horizontalCenterOffset: 1
                }
            }
            Item {
                id: compassBox
                width: 200
                height: 200
                Layout.fillHeight: true
                Layout.fillWidth: true


                Pane {
                    id: pane1
                    x: 739
                    y: -54
                    opacity: 0.5
                    anchors.fill: parent
                }
                CompassModule {
                    id: compassModule
                    anchors.fill: parent
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.preferredHeight: parent.height / 2
                    Layout.preferredWidth: parent.height / 2
                    mode: mainWindow.context.imuMode
                }
            }
            Item {
                id: item6
                width: 200
                height: 200
                Layout.fillHeight: true
                Layout.fillWidth: true
            }
            Item {
                id: item3
                width: 200
                height: 200
                Layout.fillWidth: true
                Layout.fillHeight: true
            }
            Item {
                id: item4
                width: 200
                height: 200
                Layout.fillWidth: true
                Layout.fillHeight: true
            }
            Item {
                id: item5
                width: 200
                height: 200
                Layout.fillWidth: true
                Layout.fillHeight: true
            }
            Item {
                id: depthBox
                width: 200
                height: 200
                Layout.fillHeight: true
                Layout.fillWidth: true


                Pane {
                    id: pane4
                    opacity: 0.5
                    anchors.fill: parent
                }
                DepthModule {
                    id: depthModule
                    anchors.fill: parent
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.preferredHeight: parent.height / 2
                    Layout.preferredWidth: parent.height / 2
                }
            }
            Item {
                id: attitudeBox
                width: 200
                height: 200
                visible: true
                Layout.fillHeight: true
                Layout.fillWidth: true

                Pane {
                    id: pane5
                    x: -1620
                    y: -303
                    opacity: 0.5
                    anchors.fill: parent
                }

                Item {
                    id: item2
                    x: -736
                    y: 370
                    width: 200
                    height: 200
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }

                Item {
                    id: item1
                    x: -920
                    y: 0
                    width: 200
                    height: 200
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                }

                Rectangle {
                    id: attitudeBackground
                    width: parent.height
                    height: parent.height
                    color: "#c34a00"
                    radius: parent.height
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.verticalCenterOffset: 0
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.horizontalCenterOffset: 1
                }
            }
        }
    }
}



/*##^##
Designer {
    D{i:0;formeditorZoom:0.5}D{i:2}D{i:1}D{i:4}D{i:5}D{i:3}D{i:7}D{i:8}D{i:6}D{i:12}D{i:13}
D{i:14}D{i:11}D{i:16}D{i:17}D{i:15}D{i:18}D{i:19}D{i:20}D{i:21}D{i:23}D{i:24}D{i:22}
D{i:26}D{i:27}D{i:28}D{i:29}D{i:25}D{i:10}D{i:9}
}
##^##*/

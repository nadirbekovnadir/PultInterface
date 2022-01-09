import QtQuick 2.0

import "../Common"
import "IMUModule"

Window {
    id: sysWindow
    title: "Systems"
    visible: true
    color: "#434343"
    minimumHeight: 480
    minimumWidth: 640
    width: 640
    height: 480

    property var context

    property color baseColor: "#FAAFFF"

    property int marginsHorizontal: BasicScreen.aspectRatio * sysWindow.height * BasicScreen.spacingFill
    property int marginsVertical: BasicScreen.aspectRatio * sysWindow.height * BasicScreen.spacingFill

    property int textBoxesSize: sysWindow.height * BasicScreen.textBoxesRatio

    Column {
        id: rightColumn
        anchors.left: parent.right
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.topMargin: sysWindow.marginsVertical
        anchors.leftMargin: - rightColumn.height * 0.5
        spacing: sysWindow.height * BasicScreen.spacingFill
        anchors.rightMargin: sysWindow.marginsHorizontal
        anchors.bottomMargin: sysWindow.marginsVertical

        property int numOfModules: 4
        property int moduleWidth: rightColumn.width
        property int moduleHeight: (rightColumn.height - (numOfModules - 1) * spacing) / numOfModules

        ChangeWorkStateModule {
            id: changeWorkStateModule
            width: rightColumn.moduleWidth
            height: rightColumn.moduleHeight
        }

        SystemCtrlsModule {
            id: systemCtrlsModule
            width: rightColumn.moduleWidth
            height: rightColumn.moduleHeight
        }

        IMUModule {
            id: imuModule
            width: rightColumn.moduleWidth
            height: rightColumn.moduleHeight
        }

        DiagnosticsModule {
            id: diagnosticsModule
            width: rightColumn.moduleWidth
            height: rightColumn.moduleHeight
        }
    }

    Column {
        id: leftColumn
        anchors.left: parent.left
        anchors.right: rightColumn.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: sysWindow.marginsHorizontal
        anchors.bottomMargin: sysWindow.marginsVertical
        anchors.leftMargin: sysWindow.marginsVertical
        anchors.topMargin: sysWindow.marginsVertical
        spacing: sysWindow.height * BasicScreen.spacingFill

        property int numOfModules: 2
        property int moduleWidth: leftColumn.width
        property int moduleHeight: (leftColumn.height - (numOfModules - 1) * spacing) / numOfModules

        Item {
            id: btmCamerasModule
            width: leftColumn.width
            height: leftColumn.height * 0.5
            visible: true

            VideoRecorderModule {
                id: videoRecorderModule
                height: sysWindow.textBoxesSize
                width: parent.width

            }

            Row {
                id: camerasRow
                spacing: sysWindow.width * BasicScreen.spacingFill

                property int numOfCameras: 2
                property real cameraHeight: btmCamerasModule.height
                property real cameraWidth: (leftColumn.width - (numOfCameras - 1) * spacing) / numOfCameras
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: videoRecorderModule.bottom
                anchors.bottom: parent.bottom
                anchors.topMargin: sysWindow.marginsVertical

                CameraModule {
                    id: cameraOne
                    context: sysWindow.context.cameraOneViewModel
                    width: camerasRow.cameraWidth
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom

                    MouseArea {
                        anchors.fill: parent
                        onClicked: sysWindow.context.onCameraModuleClicked(cameraOne.context)
                    }
                }

                CameraModule {
                    id: cameraTwo
                    context: sysWindow.context.cameraTwoViewModel
                    width: camerasRow.cameraWidth

                    anchors.top: parent.top
                    anchors.bottom: parent.bottom

                    MouseArea {
                        anchors.fill: parent
                        onClicked: sysWindow.context.onCameraModuleClicked(cameraTwo.context)
                    }
                }
            }
        }
        MapAndSysModule {
            id: mapAndSysModule
            width: leftColumn.moduleWidth
            height: leftColumn.height - btmCamerasModule.height - leftColumn.spacing
        }
    }

//    BasicScreen {
//        id: basicScreen
//    }

}

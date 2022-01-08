import QtQuick 2.0

import "../Common"
import "../TopScreen/Compass"
import "../TopScreen/Attitude"
import "../TopScreen/Depth"
import "../TopScreen/Force"

Window {
    property var context

    id: mainWindow
    width: 640
    height: 480
    visible: true
    color: "#ffffff"
    minimumWidth: 640
    minimumHeight: 480

    property int marginsHorizontal: BasicScreen.aspectRatio * mainWindow.height * BasicScreen.spacingFill
    property int marginsVertical: BasicScreen.aspectRatio * mainWindow.height * BasicScreen.spacingFill

    property int textBoxesSize: mainWindow.height * BasicScreen.textBoxesRatio

    CameraModule {
        id: mainCamera
        anchors.fill: parent
        context: mainWindow.context.mainCameraViewModel

        MouseArea {
            anchors.fill: parent
            onClicked: console.log(mainCamera.context)
        }
    }

    TickerModule {
        id: tickerModule
        height: mainWindow.textBoxesSize
        anchors.left: parent.left
        anchors.right: telemetryColumn.left
        anchors.bottom: parent.bottom
        anchors.leftMargin: mainWindow.marginsHorizontal
        anchors.bottomMargin: mainWindow.marginsVertical
        anchors.rightMargin: mainWindow.marginsHorizontal
    }

    ClockAndElapsedTimeModule {
        id: clockAndElapsedTimeModule
        height: mainWindow.textBoxesSize
        anchors.left: parent.left
        anchors.right: telemetryColumn.left
        anchors.top: parent.top
        anchors.topMargin: mainWindow.marginsVertical
        anchors.leftMargin: mainWindow.marginsHorizontal
        anchors.rightMargin: mainWindow.marginsHorizontal
    }

    Column {
        id: telemetryColumn
        anchors.left: parent.right
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.topMargin: mainWindow.marginsVertical
        anchors.leftMargin: - telemetryColumn.height * 0.5
        spacing: mainWindow.height * BasicScreen.spacingFill
        anchors.rightMargin: mainWindow.marginsHorizontal
        anchors.bottomMargin: mainWindow.marginsVertical

        property int numOfModules: 4
        property int moduleWidth: telemetryColumn.width
        property int moduleHeight: (telemetryColumn.height - (numOfModules - 1) * spacing) / numOfModules

        AttitudeModule {
            id: attitudeModule
            width: telemetryColumn.moduleWidth
            height: telemetryColumn.moduleHeight
        }

        DepthModule {
            id: depthModule
            y: 220
            width: telemetryColumn.moduleWidth
            height: telemetryColumn.moduleHeight
        }

        ForceModule {
            id: forceModule
            y: 220
            width: telemetryColumn.moduleWidth
            height: telemetryColumn.moduleHeight
        }

        CompassModule {
            id: compassModule
            y: 321
            width: telemetryColumn.moduleWidth
            height: telemetryColumn.moduleHeight
        }
    }

//    BasicScreen {
//        id: basicScreen
//    }

    Component.onCompleted: console.log(BasicScreen.heightRatio)
}



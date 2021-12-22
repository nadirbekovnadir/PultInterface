import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 6.0
import QtSensors 6.0
import QtQuick.Templates 6.2
import QtQuick.Controls.Windows 6.0
import QtQuick.Window 2.14

import "../Common"

Window {
    property var context

    id: mainWindow
    width: 640
    height: 480
    visible: true
    minimumWidth: 640
    minimumHeight: 480

    property real spacingFill: 0.03

    property int widthRatio: 16
    property int heightRatio: 16
    property real aspectRatio: heightRatio / widthRatio

    property int marginsHorizontal: aspectRatio * mainWindow.width * spacingFill
    property int marginsVertical: aspectRatio * mainWindow.height * spacingFill

    property real textBoxesRatio: 0.05
    property int textBoxesSize: mainWindow.height * mainWindow.textBoxesRatio

    CameraModule {
        id: mainCamera
        anchors.fill: parent
        clip: true
        transformOrigin: Item.Center
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
        spacing: mainWindow.height * mainWindow.spacingFill
        anchors.rightMargin: mainWindow.marginsHorizontal
        anchors.bottomMargin: mainWindow.marginsVertical

        property int numOfModules: 4
        property int moduleWidth: telemetryColumn.width
        property int moduleHeight: (telemetryColumn.height - (numOfModules - 1) * spacing) / numOfModules

        HorizonModule {
            id: horizonModule
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
}



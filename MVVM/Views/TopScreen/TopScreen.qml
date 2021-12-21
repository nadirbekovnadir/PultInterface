import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 6.0
import QtSensors 6.0
import QtQuick.Templates 6.2
import QtQuick.Controls.Windows 6.0
import QtQuick.Window 2.14


Window {
    id: mainWindow
    width: 640
    height: 480
    visible: true
    minimumWidth: 640
    minimumHeight: 480
    title: "Main"

    property real spacingFill: 0.03

    property int widthRatio: 16
    property int heightRatio: 16
    property real aspectRatio: heightRatio / widthRatio

    property int marginsHorizontal: aspectRatio * mainWindow.width * spacingFill
    property int marginsVertical: aspectRatio * mainWindow.height * spacingFill

    CameraModule {
        id: cameraModule
        anchors.fill: parent
    }

    TickerModule {
        id: tickerModule
        height: 20
        anchors.left: parent.left
        anchors.right: telemetryColumn.left
        anchors.bottom: parent.bottom
        anchors.bottomMargin: mainWindow.marginsVertical
        anchors.leftMargin: mainWindow.marginsHorizontal
        anchors.rightMargin: mainWindow.marginsVertical
    }

    Column {
        id: telemetryColumn
        anchors.left: parent.right
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.topMargin: mainWindow.marginsVertical
        anchors.leftMargin: - telemetryColumn.height * 0.4
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

/*##^##
Designer {
    D{i:0;formeditorZoom:1.1}D{i:1}D{i:2}D{i:4}D{i:5}D{i:6}D{i:7}D{i:3}
}
##^##*/

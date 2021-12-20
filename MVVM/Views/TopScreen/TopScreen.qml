import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 6.0
import QtSensors 6.0
import QtQuick.Templates 6.2
import QtQuick.Controls.Windows 6.0


Window {
    property var context

    id: mainWindow
    width: 640
    height: 480
    visible: true
    title: "Main"

    CameraModule {
        id: mainCamera
        context: mainWindow.context.mainCameraViewModel

        anchors.fill: parent
    }

    TickerModule {
        id: tickerModule
        anchors.left: parent.left
        anchors.right: telemetryColumn.left
        anchors.top: parent.bottom
        anchors.bottom: parent.bottom
        anchors.topMargin: -mainWindow.height * 0.1
        anchors.bottomMargin: 20
        anchors.leftMargin: 20
        anchors.rightMargin: 20
    }

    Column {
        id: telemetryColumn
        anchors.left: parent.right
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.topMargin: 20
        anchors.leftMargin: - mainWindow.width * 0.2
        spacing: telemetryColumn.height * 0.03
        anchors.rightMargin: 20
        anchors.bottomMargin: 20

        HorizonModule {
            id: horizonModule
            y: 119
            width: telemetryColumn.width
            height: (telemetryColumn.height - telemetryColumn.spacing * 3) / 4
        }

        DepthModule {
            id: depthModule
            y: 220
            width: telemetryColumn.width
            height: (telemetryColumn.height - telemetryColumn.spacing * 3) / 4
        }

        ForceModule {
            id: forceModule
            y: 220
            width: telemetryColumn.width
            height: (telemetryColumn.height - telemetryColumn.spacing * 3) / 4
        }

        CompassModule {
            id: compassModule
            y: 321
            width: telemetryColumn.width
            height: (telemetryColumn.height - telemetryColumn.spacing * 3) / 4
        }
    }



}

/*##^##
Designer {
    D{i:0;formeditorZoom:1.1}D{i:1;locked:true}D{i:2}D{i:4}D{i:5}D{i:6}D{i:7}D{i:3}
}
##^##*/

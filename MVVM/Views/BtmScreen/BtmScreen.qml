import QtQuick 2.0

import "../Common"

Window {
    property var context

    id: window
    title: "Systems"
    visible: true
    color: "#434343"
    width: 640
    height: 480

    Column {
        id: leftColumn
        anchors.left: parent.right
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: -200
        anchors.rightMargin: margin
        anchors.bottomMargin: margin
        anchors.topMargin: margin
        
        CameraModule {
            id: cameraOne
            context: window.context.cameraOneViewModel

            x: 200
            y: 0
            width: 200
            height: 200

            MouseArea {
                anchors.fill: parent
                onClicked: window.context.onCameraModuleClicked(cameraOne.context)
            }
        }

        CameraModule {
            id: cameraTwo
            context: window.context.cameraTwoViewModel

            x: 0
            y: 0
            width: 200
            height: 200

            MouseArea {
                anchors.fill: parent
                onClicked: window.context.onCameraModuleClicked(cameraTwo.context)
            }
        }

        ChangeWorkStateModule {
            id: changeWorkStateModule
            width: 284
            height: 113
        }

        SystemCtrlsModule {
            id: systemCtrlsModule
        }

        IMUModule {
            id: iMUModule
        }

        DiagnosticsModule {
            id: diagnosticsModule
        }
    }

    Column {
        id: rightColumn
        x: 40
        y: 40
        anchors.left: parent.left
        anchors.right: leftColumn.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: margin
        anchors.bottomMargin: margin
        anchors.topMargin: margin
        anchors.leftMargin: margin

        MapAndSysModule {
            id: mapAndSysModule
            width: 384
            height: 220
        }
    }

}

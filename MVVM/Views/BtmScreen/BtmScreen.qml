import QtQuick 2.0

import "../Common"

Window {
    property var context

    id: window
    title: "Systems"
    visible: true
    width: 640
    height: 480

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

    Flow {
        property int margin: 20
        id: flow1
        anchors.fill: parent
        anchors.topMargin: margin
        anchors.rightMargin: margin
        anchors.leftMargin: margin
        anchors.bottomMargin: margin
    }

}

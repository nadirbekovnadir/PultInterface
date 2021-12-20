import QtQuick 2.0

import "../Common"

Window {
    property var context

    id: window
    title: "Systems"
    visible: true
    width: 640
    height: 480

//    CameraModule {
//        id: cameraOne
//        context: window.context.cameraOneViewModel

//        anchors.fill: parent
//        anchors.rightMargin: 336

//        MouseArea {
//            anchors.fill: parent
//            onClicked: window.context.onCameraModuleClicked(cameraOne.context)
//        }
//    }

    CameraModule {
        id: cameraTwo
        context: window.context.cameraTwoViewModel

        anchors.fill: parent

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

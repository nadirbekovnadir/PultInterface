import QtQuick 2.0

import "../Common"

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
    
    property real spacingFill: 0.03
    
    property int widthRatio: 16
    property int heightRatio: 16
    property real aspectRatio: heightRatio / widthRatio
    
    property int marginsHorizontal: aspectRatio * sysWindow.width * spacingFill
    property int marginsVertical: aspectRatio * sysWindow.height * spacingFill
    
    Column {
        id: rightColumn
        anchors.left: parent.right
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.topMargin: sysWindow.marginsVertical
        anchors.leftMargin: - rightColumn.height * 0.5
        spacing: sysWindow.height * sysWindow.spacingFill
        anchors.rightMargin: sysWindow.marginsHorizontal
        anchors.bottomMargin: sysWindow.marginsVertical
        
        property int numOfModules: 4
        property int moduleWidth: rightColumn.width
        property int moduleHeight: (rightColumn.height - (numOfModules - 1) * spacing) / numOfModules
        
        ChangeWorkStateModule {
            id: changeWorkStateModule
            width: 284
            height: 113
        }
        
        SystemCtrlsModule {
            id: systemCtrlsModule
        }
        
        IMUModule {
            id: imuModule
        }
        
        DiagnosticsModule {
            id: diagnosticsModule
        }
    }
    
    Column {
        id: leftColumn
        anchors.left: parent.left
        anchors.right: rightColumn.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: sysWindow.marginsHorizontal
        anchors.bottomMargin: sysWindow.marginsHorizontal
        anchors.leftMargin: sysWindow.marginsVertical
        anchors.topMargin: sysWindow.marginsHorizontal
        spacing: sysWindow.height * sysWindow.spacingFill
        
        property int numOfModules: 2
        property int moduleWidth: leftColumn.width
        property int moduleHeight: (leftColumn.height - (numOfModules - 1) * spacing) / numOfModules
        
        
        
        Item {
            id: btmCamerasModule
            width: leftColumn.width
            height: leftColumn.height * 0.5
            visible: true

            Row {
                id: camerasRow
                anchors.fill: parent
                transformOrigin: Item.Center
                layer.enabled: false

                property int numOfCameras: 2
                spacing: sysWindow.width * sysWindow.spacingFill
                property int cameraHeight: btmCamerasModule.height
                property real cameraWidth: (leftColumn.width - (numOfCameras - 1) * spacing) / numOfCameras

                CameraModule {
                    id: cameraOne
                    context: window.context.cameraOneViewModel
                    width: camerasRow.cameraWidth
                    height: camerasRow.cameraHeight

                    MouseArea {
                        anchors.fill: parent
                        onClicked: window.context.onCameraModuleClicked(cameraOne.context)
                    }
                }

                CameraModule {
                    id: cameraTwo
                    context: window.context.cameraTwoViewModel
                    width: camerasRow.cameraWidth
                    height: camerasRow.cameraHeight

                    MouseArea {
                        anchors.fill: parent
                        onClicked: window.context.onCameraModuleClicked(cameraTwo.context)
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
    
}

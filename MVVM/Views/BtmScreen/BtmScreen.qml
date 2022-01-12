import QtQuick 2.0

import "../Common"
import QtQuick.Controls 6.2
import QtQuick.Layouts 6.0

Window {
    id: sysWindow
    title: "Systems"
    visible: true
    color: "#434343"
    property alias buttonFontpixelSize: yawStabilizationButton.font.pixelSize
    minimumHeight: 480
    minimumWidth: 640
    width: 1800
    height: 900
    
    property var context
    
    property color baseColor: "#FAAFFF"
    
    property int marginsHorizontal: 40
    property int marginsVertical: 40
    property int textBoxesSize: sysWindow.height * BasicScreen.textBoxesRatio
    
    property real fontSize: 0.5
    
    
    Item {
        id: btmCamerasModule
        height: parent.height * 0.4
        visible: true
        anchors.left: parent.left
        anchors.right: rowLayout.left
        anchors.top: tabBar.bottom
        anchors.leftMargin: 40
        anchors.rightMargin: marginsHorizontal
        anchors.topMargin: marginsVertical
        
        Item {
            id: recorderModule
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: camerasLayout.bottom
            anchors.bottom: parent.bottom
            anchors.topMargin: 20
            anchors.bottomMargin: 0
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            
            Pane {
                id: pane4
                x: 0
                y: -386
                opacity: 0.5
                anchors.left: stopButton.right
                anchors.right: elapsedTime.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.leftMargin: 0
                anchors.rightMargin: 0
            }
            
            Button {
                id: playButton
                width: height
                text: qsTr("Button")
                anchors.left: stopButton.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.topMargin: 0
                anchors.bottomMargin: 0
                anchors.leftMargin: marginsHorizontal
                
                Image {
                    id: play_pauseButtonIMg
                    anchors.fill: parent
                    source: "qrc:/qtquickplugin/images/template_image.png"
                    fillMode: Image.PreserveAspectFit
                }
            }
            
            Button {
                id: stopButton
                width: height
                text: qsTr("Button")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.topMargin: 0
                anchors.bottomMargin: 0
                anchors.leftMargin: 0
                
                Image {
                    id: stopButtonImg
                    anchors.fill: parent
                    source: "qrc:/qtquickplugin/images/template_image.png"
                    fillMode: Image.PreserveAspectFit
                }
            }
            
            Label {
                id: elapsedTime
                width: 124
                text: qsTr("Label")
                anchors.left: playButton.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                font.pixelSize: height * fontSize
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.leftMargin: marginsHorizontal
                anchors.bottomMargin: 0
                anchors.topMargin: 0
            }
            
            Pane {
                id: pane7
                visible: true
                anchors.left: elapsedTime.right
                anchors.right: elapsedTime.left
                anchors.top: elapsedTime.bottom
                anchors.bottom: elapsedTime.top
                anchors.topMargin: 0
                anchors.bottomMargin: 0
                anchors.rightMargin: 0
                anchors.leftMargin: 0
            }
            
        }
        
        RowLayout {
            id: camerasLayout
            height: parent.height * 0.8
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            spacing: 20
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0
            
            CameraModule {
                id: cameraTwo
                context: sysWindow.context.cameraTwoViewModel
                width: (parent.width - parent.spacing) / 2
                
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                
                MouseArea {
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: cameraLabel2.bottom
                    anchors.bottom: parent.bottom
                    anchors.topMargin: 0
                    onClicked: sysWindow.context.onCameraModuleClicked(cameraTwo.context)
                }
                
                Label {
                    id: cameraLabel2
                    height: parent.height * 0.2
                    text: qsTr("CAMERA 2")
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    font.pixelSize: fontSize * height
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.preferShaping: false
                    font.bold: false
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.topMargin: 0
                }
                
            }
            
            CameraModule {
                id: cameraOne
                context: sysWindow.context.cameraOneViewModel
                width: (parent.width - parent.spacing) / 2
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                
                
                
                MouseArea {
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: cameraLabel1.bottom
                    anchors.bottom: parent.bottom
                    anchors.topMargin: 0
                    onClicked: sysWindow.context.onCameraModuleClicked(cameraOne.context)
                }
                
                
                Label {
                    id: cameraLabel1
                    x: -620
                    y: 0
                    text: qsTr("CAMERA 1")
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    font.pixelSize: fontSize * height
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.bottomMargin: 276
                    anchors.topMargin: 0
                    anchors.leftMargin: 0
                    anchors.rightMargin: 0
                }
                
                
                
            }
            
        }
        
        
    }
    
    TabBar {
        id: tabBar
        width: sysWindow.width / 1.618
        height: 60
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: marginsVertical
        anchors.topMargin: marginsHorizontal
        
        TabButton {
            id: normalTab
            text: qsTr("NORMAL")
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            font.pixelSize: height * fontSize
            anchors.topMargin: 0
            anchors.bottomMargin: 0
        }
        
        TabButton {
            id: vmaSetupTab
            text: qsTr("VMA SETUP")
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            font.pixelSize: height * fontSize
            autoExclusive: false
            anchors.topMargin: 0
            anchors.bottomMargin: 0
        }
        
        TabButton {
            id: controlSystemTab
            text: qsTr("CONTROL SYSTEM ")
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            font.pixelSize: height * fontSize
            anchors.bottomMargin: 0
            anchors.topMargin: 0
        }
    }
    
    RowLayout {
        id: rowLayout
        height: tabBar.height
        anchors.left: tabBar.right
        anchors.right: parent.right
        anchors.top: parent.top
        spacing: marginsHorizontal
        anchors.leftMargin: marginsHorizontal
        anchors.rightMargin: marginsHorizontal
        anchors.topMargin: marginsVertical
        
        
        RoundButton {
            id: connectionButton
            height: tabBar.height
            font.pixelSize: height * fontSize
            text: "CONNECT"
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        
        Label {
            id: dataLabel
            text: "Text"
            font.pixelSize: height * fontSize
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        Button {
            id: themeButton
            height: tabBar.height
            text: qsTr("Button")
            checkable: true
            font.pixelSize: height * fontSize
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
    }
    
    
    MapAndSysModule {
        id: mapAndSysModule
        anchors.left: parent.left
        anchors.right: rowLayout.left
        anchors.top: btmCamerasModule.bottom
        anchors.bottom: parent.bottom
        anchors.topMargin: marginsVertical
        anchors.rightMargin: marginsHorizontal
        anchors.leftMargin: marginsHorizontal
        anchors.bottomMargin: marginsVertical
        
        Pane {
            id: pane5
            x: 0
            y: 0
            opacity: 0.5
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: peripheralsTabBar.bottom
            anchors.bottom: parent.bottom
            anchors.topMargin: 0
        }
        
        TabBar {
            id: peripheralsTabBar
            height: 60
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.leftMargin: 0
            anchors.rightMargin: 0
            TabButton {
                id: mapTab
                text: qsTr("MAP VIEW")
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                font.pixelSize: height * fontSize
                anchors.topMargin: 0
                anchors.bottomMargin: 0
            }
            
            TabButton {
                id: systemTab
                text: qsTr("SYSTEM")
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                font.pixelSize: height * fontSize
                anchors.topMargin: 0
                autoExclusive: false
                anchors.bottomMargin: 0
            }

            RouteMap {
                id: routeMap
                context: sysWindow.context.mapViewModel
                anchors.fill: parent
            }
        }
    }
    
    Item {
        id: imuCntlModule
        height: parent.height * 0.5
        anchors.left: btmCamerasModule.right
        anchors.right: parent.right
        anchors.top: rowLayout.bottom
        anchors.leftMargin: marginsHorizontal
        anchors.rightMargin: marginsHorizontal
        anchors.topMargin: marginsVertical
        
        Pane {
            id: pane
            opacity: 0.5
            anchors.fill: parent
        }
        
        Item {
            id: imuModesControl
            x: 0
            y: 80
            anchors.fill: parent
            anchors.topMargin: 20

            Grid {
                id: positionHoldButton1
                anchors.fill: parent
                columns: 1
                spacing: 20
                Button {
                    id: yawStabilizationButton1
                    width: (parent.width - (parent.columns - 1) * parent.spacing) / parent.columns
                    height: (parent.height - (parent.rows - 1) * parent.spacing) / parent.rows
                    text: qsTr("HOLD YAW")
                    font.pixelSize: height * fontSize
                }

                Button {
                    id: depthStabilizationButton1
                    width: (parent.width - (parent.columns - 1) * parent.spacing) / parent.columns
                    height: (parent.height - (parent.rows - 1) * parent.spacing) / parent.rows
                    text: qsTr("HOLD DEPTH")
                    font.pixelSize: height * fontSize
                }

                Button {
                    id: pitchStabilizationButton1
                    width: (parent.width - (parent.columns - 1) * parent.spacing) / parent.columns
                    height: (parent.height - (parent.rows - 1) * parent.spacing) / parent.rows
                    text: qsTr("HOLD PITCH")
                    font.pixelSize: height * fontSize
                }
                rows: 3
            }
        }
        
        
        TabBar {
            id: imuTabBar
            height: 60
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0
            TabButton {
                id: modesTab
                text: qsTr("MODE")
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                font.pixelSize: height * fontSize
                anchors.topMargin: 0
                anchors.bottomMargin: 0
            }
            
            TabButton {
                id: tareTab
                text: qsTr("TARE")
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                font.pixelSize: height * fontSize
                anchors.topMargin: 0
                autoExclusive: false
                anchors.bottomMargin: 0
            }
            
            TabButton {
                id: setupTab
                text: qsTr("SETUP")
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                font.pixelSize: height * fontSize
                anchors.topMargin: 0
                anchors.bottomMargin: 0
            }
        }

        
    }
    
    Item {
        id: item1
        anchors.left: mapAndSysModule.right
        anchors.right: parent.right
        anchors.top: imuCntlModule.bottom
        anchors.bottom: parent.bottom
        anchors.topMargin: marginsVertical
        anchors.bottomMargin: marginsVertical
        anchors.rightMargin: 40
        anchors.leftMargin: 40
        
        Pane {
            id: pane1
            opacity: 0.5
            anchors.fill: parent
        }
        
        Grid {
            id: positionHoldButton
            anchors.fill: parent
            spacing: 20
            rows: 4
            columns: 1
            
            
            Button {
                id: yawStabilizationButton
                width: (parent.width - (parent.columns - 1) * parent.spacing) / parent.columns
                height: (parent.height - (parent.rows - 1) * parent.spacing) / parent.rows
                text: qsTr("HOLD YAW")
                font.pixelSize: height * fontSize
            }
            
            Button {
                id: depthStabilizationButton
                width: (parent.width - (parent.columns - 1) * parent.spacing) / parent.columns
                height: (parent.height - (parent.rows - 1) * parent.spacing) / parent.rows
                text: qsTr("HOLD DEPTH")
                font.pixelSize: height * fontSize
            }
            
            Button {
                id: pitchStabilizationButton
                width: (parent.width - (parent.columns - 1) * parent.spacing) / parent.columns
                height: (parent.height - (parent.rows - 1) * parent.spacing) / parent.rows
                text: qsTr("HOLD PITCH")
                font.pixelSize: height * fontSize
            }
            
            Button {
                id: holdButton
                width: (parent.width - (parent.columns - 1) * parent.spacing) / parent.columns
                height: (parent.height - (parent.rows - 1) * parent.spacing) / parent.rows
                text: qsTr("HOLD POSITION")
                font.pixelSize: height * fontSize
            }
        }
    }
    
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.75}D{i:3}D{i:5}D{i:4}D{i:7}D{i:6}D{i:8}D{i:9}D{i:2}D{i:12}
D{i:13}D{i:11}D{i:15}D{i:16}D{i:14}D{i:10}D{i:1}D{i:18}D{i:19}D{i:20}D{i:17}D{i:22}
D{i:23}D{i:24}D{i:21}D{i:26}D{i:28}D{i:29}D{i:27}D{i:25}D{i:31}D{i:34}D{i:35}D{i:36}
D{i:33}D{i:32}D{i:38}D{i:39}D{i:40}D{i:37}D{i:30}D{i:42}D{i:44}D{i:45}D{i:46}D{i:47}
D{i:43}D{i:41}
}
##^##*/

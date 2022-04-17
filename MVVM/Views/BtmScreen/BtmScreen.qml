import QtQuick 2.0

import "../Common"
import QtQuick.Controls 6.2
import QtQuick.Layouts 6.0

Window {
    id: sysWindow
    title: "Systems"
    visible: true
    color: "#434343"
    minimumHeight: 480
    minimumWidth: 640
    width: 1800
    height: 900
    
    property var context
    
    property color baseColor: "#FAAFFF"
    
    property int marginsHorizontal: 40
    property int marginsVertical: 40
    
    property real fontSize: 0.5
    
    
    Item {
        id: btmCamerasModule
        height: parent.height * 0.4
        visible: true
        anchors.left: parent.left
        anchors.right: rowLayout.left
        anchors.top: tabBar.bottom
        anchors.leftMargin: marginsHorizontal
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
                anchors.left: parent.left
                anchors.right: elapsedTimeLabel.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.leftMargin: 0
                anchors.rightMargin: 0
            }

            Pane {
                id: pane7
                x: 3
                y: -385
                opacity: 1
                anchors.left: pane4.right
                anchors.right: elapsedTimeLabel.right
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
                anchors.leftMargin: 20
                anchors.topMargin: 0
                anchors.bottomMargin: 0
                
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
                id: elapsedTimeLabel
                width: 124
                text: qsTr("Label")
                anchors.left: playButton.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                font.pixelSize: height * fontSize
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.leftMargin: 20
                anchors.bottomMargin: 0
                anchors.topMargin: 0
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
                Layout.fillHeight: true
                Layout.fillWidth: true
                
                Pane {
                    id: pane8
                    opacity: 0.0
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: cameraLabel2.bottom
                    anchors.bottom: parent.bottom
                    anchors.topMargin: 0
                }

                Pane {
                    id: pane9
                    x: 6
                    y: 48
                    opacity: 1
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: pane8.top
                    anchors.bottomMargin: 0
                    anchors.topMargin: 0
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


                
                MouseArea {

                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: cameraLabel2.bottom
                    anchors.bottom: parent.bottom
                    anchors.topMargin: 0

                    onClicked: sysWindow.context.onCameraModuleClicked(cameraTwo.context)
                }
            }
            
            CameraModule {
                id: cameraOne
                context: sysWindow.context.cameraOneViewModel
                width: (parent.width - parent.spacing) / 2
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                Layout.fillHeight: true
                Layout.fillWidth: true
                
                
                
                Pane {
                    id: pane6
                    x: 0
                    y: 58
                    opacity: 0.0
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: cameraLabel1.bottom
                    anchors.bottom: parent.bottom

                    anchors.topMargin: 0
                }

                
                


                Pane {
                    id: pane10
                    x: 5
                    opacity: 1
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: pane6.top
                    anchors.bottomMargin: 0
                    anchors.topMargin: 0
                }
                
                
                
                Label {
                    id: cameraLabel1
                    x: -620
                    y: 0
                    height: parent.height * 0.2
                    text: qsTr("CAMERA 1")
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    font.pixelSize: fontSize * height
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.topMargin: 0
                    anchors.leftMargin: 0
                    anchors.rightMargin: 0
                }
                MouseArea {
                    anchors.left: parent.left
                    anchors.right: parent.right

                    anchors.top: cameraLabel1.bottom
                    anchors.bottom: parent.bottom
                    anchors.topMargin: 0
                    onClicked: sysWindow.context.onCameraModuleClicked(cameraOne.context)
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
            autoExclusive: true
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
            radius: 0
            font.pixelSize: height * fontSize
            text: "CONNECT"
            Layout.fillHeight: true
            Layout.fillWidth: true
        }

        Button {
            id: themeButton
            height: tabBar.height
            text: qsTr("DARK")
            checkable: true
            font.pixelSize: height * fontSize
            checked: true
            autoExclusive: false
            Layout.rowSpan: 1
            Layout.columnSpan: 1
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
                autoExclusive: true
                anchors.bottomMargin: 0
            }
        }

        RouteMap {
            id: routeMap
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: peripheralsTabBar.bottom
            anchors.bottom: parent.bottom
            anchors.rightMargin: 5
            anchors.leftMargin: 5
            anchors.bottomMargin: 5
            anchors.topMargin: 5
            context: sysWindow.context.mapViewModel

        }
    }
    
    Item {
        id: imuCntlModule
        anchors.left: btmCamerasModule.right
        anchors.right: parent.right
        anchors.top: rowLayout.bottom
        anchors.bottom: mapAndSysModule.top
        anchors.bottomMargin: marginsVertical
        anchors.rightMargin: marginsHorizontal
        anchors.leftMargin: marginsHorizontal
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
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: imuTabBar.bottom
            anchors.bottom: parent.bottom
            anchors.topMargin: 0

            ColumnLayout {
                id: columnLayout
                width: 100
                height: 100
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: filterButton.top
                layoutDirection: Qt.LeftToRight
                spacing: 5
                anchors.bottomMargin: 20
                anchors.topMargin: 0
                anchors.leftMargin: 0
                anchors.rightMargin: 0
                property int rows: 3

                ButtonGroup {
                    buttons: columnLayout.children
                }

                Button {
                    id: absoluteButton
                    width: parent.width
                    height: (parent.height - (parent.rows - 1) * parent.spacing) / parent.rows
                    text: qsTr("ABSOLUTE")
                    font.pixelSize: height * fontSize
                    autoRepeat: true
                    checkable: false
                    checked: false
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    autoExclusive: true
                    onClicked: sysWindow.context.onIMUModeChanged("ABSOLUTE")
                }

                Button {
                    id: relativeButton
                    width: parent.width
                    height: (parent.height - (parent.rows - 1) * parent.spacing) / parent.rows
                    text: qsTr("RELATIVE")
                    font.pixelSize: height * fontSize
                    autoRepeat: true
                    checkable: false
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    autoExclusive: true
                    onClicked: sysWindow.context.onIMUModeChanged("RELATIVE")

                }

                 Button {
                    id: indoorButton
                    width: parent.width
                    height: (parent.height - (parent.rows - 1) * parent.spacing) / parent.rows
                    text: qsTr("INDOOR")
                    font.pixelSize: height * fontSize
                    autoRepeat: true
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    checkable: false
                    autoExclusive: true
                    onClicked: sysWindow.context.onIMUModeChanged("INDOOR")

                }
            }

            Button {
                id: filterButton
                y: 0
                height: 60
                text: qsTr("HM KF")
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                font.pixelSize: height * fontSize
                anchors.rightMargin: 0
                anchors.leftMargin: 0
                anchors.bottomMargin: 0
                checkable: true
                onClicked: sysWindow.context.onIMUModeChanged("HM KF")
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
                autoExclusive: true
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
        id: rovControlModule
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
            id: positionHoldRow
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
                highlighted: false
                checkable: true
            }
            
            Button {
                id: depthStabilizationButton
                width: (parent.width - (parent.columns - 1) * parent.spacing) / parent.columns
                height: (parent.height - (parent.rows - 1) * parent.spacing) / parent.rows
                text: qsTr("HOLD DEPTH")
                font.pixelSize: height * fontSize
                display: AbstractButton.TextBesideIcon
                checkable: true
            }
            
            Button {
                id: pitchStabilizationButton
                width: (parent.width - (parent.columns - 1) * parent.spacing) / parent.columns
                height: (parent.height - (parent.rows - 1) * parent.spacing) / parent.rows
                text: qsTr("HOLD PITCH")
                font.pixelSize: height * fontSize
                checkable: true
            }
            
            Button {
                id: holdButton
                width: (parent.width - (parent.columns - 1) * parent.spacing) / parent.columns
                height: (parent.height - (parent.rows - 1) * parent.spacing) / parent.rows
                text: qsTr("HOLD POSITION")
                font.pixelSize: height * fontSize
                checkable: true
            }
        }
    }
    
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.75}D{i:3}D{i:4}D{i:6}D{i:5}D{i:8}D{i:7}D{i:9}D{i:2}D{i:12}
D{i:13}D{i:14}D{i:15}D{i:11}D{i:17}D{i:18}D{i:19}D{i:20}D{i:16}D{i:10}D{i:1}D{i:22}
D{i:23}D{i:24}D{i:21;locked:true}D{i:26}D{i:27}D{i:25}D{i:29}D{i:31}D{i:32}D{i:30}
D{i:33}D{i:28}D{i:35}D{i:38}D{i:39}D{i:40}D{i:41}D{i:37}D{i:42}D{i:36}D{i:44}D{i:45}
D{i:46}D{i:43}D{i:34}D{i:48}D{i:50}D{i:51}D{i:52}D{i:53}D{i:49}D{i:47}
}
##^##*/

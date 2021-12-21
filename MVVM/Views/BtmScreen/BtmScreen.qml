import QtQuick 2.0

Window {
    id: window
    title: "Systems"
    visible: true
    color: "#434343"
    width: 640
    height: 480

    property int margin: 20

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

        BtmCamerasModule {
            id: btmCamerasModule
            width: 243
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 323
            anchors.leftMargin: margin
            anchors.topMargin: margin
        }

        MapAndSysModule {
            id: mapAndSysModule
            width: 384
            height: 220
        }
    }

}

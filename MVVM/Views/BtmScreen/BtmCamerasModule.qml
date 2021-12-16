import QtQuick 2.0

Item {

    property int margin: 20

    id: item1
    Rectangle {
        id: camera1
        opacity: 0.5
        color: "#929500"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: item1.width / 2 + margin / 2
        anchors.leftMargin: 0
        anchors.bottomMargin: 0
        anchors.topMargin: 0
    }

    Rectangle {
        id: camera2
        opacity: 0.5
        color: "#2a004f"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        clip: false
        anchors.leftMargin: item1.width / 2 + margin / 2
        anchors.topMargin: 0
        anchors.bottomMargin: 0
        anchors.rightMargin: 0
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:1}D{i:2}
}
##^##*/

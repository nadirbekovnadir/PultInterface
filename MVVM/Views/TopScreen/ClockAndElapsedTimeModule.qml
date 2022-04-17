import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: baseItem
    width: 640
    height: 480

    Text {
        id: currentTime
        y: 208
        text: qsTr("Text")
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        font.pixelSize: 12
        verticalAlignment: Text.AlignVCenter
        anchors.bottomMargin: 0
        anchors.topMargin: 0
        anchors.rightMargin: baseItem.width / 2
        anchors.leftMargin: 0
    }

    Text {
        id: timeElapsed
        text: qsTr("Text")
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        font.pixelSize: 12
        horizontalAlignment: Text.AlignRight
        verticalAlignment: Text.AlignVCenter
        anchors.topMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: baseItem.width / 2
        anchors.rightMargin: 0
    }
}

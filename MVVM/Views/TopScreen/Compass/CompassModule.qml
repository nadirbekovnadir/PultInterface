import QtQuick 2.0
import QtQuick.Controls 6.2

Item {
    id: baseItem
    property int size: baseItem.height

    Rectangle {
        id: compassBackground
        color: "#c34a00"
        radius: parent.size
        anchors.fill: parent
    }

    Image {
        id: compassScaleImage
        anchors.left: compassBackground.right
        anchors.right: parent.right
        anchors.top: compassBackground.bottom
        anchors.bottom: compassBackground.top
        source: "CompassScale.svg"
        anchors.leftMargin: -640
        anchors.bottomMargin: -640
        anchors.topMargin: -640
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: compassPointerImage
        width: parent.size
        height: parent.size / 2
        anchors.verticalCenter: compassBackground.verticalCenter
        source: "CompassPointer.svg"
        rotation: 0
        anchors.verticalCenterOffset: 0
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: compassBackground.horizontalCenter
        fillMode: Image.PreserveAspectFit
    }


}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:1}D{i:2}D{i:3}
}
##^##*/

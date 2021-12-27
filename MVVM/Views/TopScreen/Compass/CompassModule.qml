import QtQuick 2.0

Item {
    id: baseItem
    property int size: baseItem.height

    Rectangle {
        id: compassBackground
        width: parent.size
        height: parent.size
        color: "#c34a00"
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        radius: parent.size
        anchors.verticalCenter: parent.verticalCenter
    }

    Image {
        id: compassScaleImage
        width: parent.size
        height: parent.size - 5
        anchors.verticalCenter: parent.verticalCenter
        source: "CompassScale.svg"
        anchors.verticalCenterOffset: 0
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: compassPointerImage
        width: parent.size
        height: parent.size / 2
        anchors.verticalCenter: parent.verticalCenter
        source: "CompassPointer.svg"
        rotation: 0
        anchors.verticalCenterOffset: 0
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        fillMode: Image.PreserveAspectFit
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:1}D{i:2}D{i:3}
}
##^##*/

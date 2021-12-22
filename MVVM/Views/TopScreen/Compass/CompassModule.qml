import QtQuick 2.0

Item {
    id: baseItem
    property int size: baseItem.height

    Rectangle {
        id: compassBackground
        width: parent.size
        height: parent.size
        color: "#c34a00"
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        radius: parent.size
    }

    Image {
        id: compassScaleImage
        width: parent.size
        height: parent.size
        anchors.verticalCenter: parent.verticalCenter
        source: "compassScale.png"
        anchors.horizontalCenter: parent.horizontalCenter
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: compassPointerImage
        width: parent.size / 2
        height: parent.size / 2
        anchors.verticalCenter: parent.verticalCenter
        source: "compassPointer.png"
        anchors.horizontalCenter: parent.horizontalCenter
        fillMode: Image.PreserveAspectFit
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:1}D{i:2}D{i:3}
}
##^##*/

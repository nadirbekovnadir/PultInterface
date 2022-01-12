import QtQuick 2.0

Item {
    id: baseItem
    property int size: baseItem.height

    Rectangle {
        id: depthGaugeBackground
        width: parent.size
        height: parent.size
        color: "#c34a00"
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        radius: parent.size
        anchors.verticalCenter: parent.verticalCenter
    }

    Image {
        id: depthGaugeScaleImage
        width: parent.size
        height: parent.size - 5
        anchors.verticalCenter: parent.verticalCenter
        source: "DepthScale.svg"
        anchors.horizontalCenterOffset: - depthGaugeBackground.width / 6.5
        anchors.horizontalCenter: depthGaugeBackground.horizontalCenter
        anchors.verticalCenterOffset: 0
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: depthGaugePointerImage
        width: parent.size
        height: parent.size / 2
        anchors.bottom: parent.bottom
        source: "DepthPointer.svg"
        anchors.bottomMargin: depthGaugeScaleImage.paintedHeight / 2 - depthGaugeScaleImage.paintedHeight * 0.05
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        fillMode: Image.PreserveAspectFit
    }

    Timer {
        interval: 100; running: true; repeat: true
        onTriggered: {
            depthGaugePointerImage.rotation += 5;
        }
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:1}D{i:2}D{i:3}
}
##^##*/

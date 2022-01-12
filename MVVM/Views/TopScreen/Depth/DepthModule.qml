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

    Timer {
        interval: 100; running: true; repeat: true
        onTriggered: {
            pointerRotator.rotation += 0.1;
        }
    }

    Item {
        id: pointerRotator
        anchors.fill: parent

        Image {
            id: depthGaugePointerImage
            x: 80
            y: 235
            width: 200
            height: 200
            anchors.bottom: parent.bottom
            source: "DepthPointer.svg"
            rotation: 180
            anchors.bottomMargin: 45
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            fillMode: Image.PreserveAspectFit
        }
    }


}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:1}D{i:2}D{i:3}D{i:5}D{i:4}
}
##^##*/

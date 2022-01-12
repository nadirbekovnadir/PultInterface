import QtQuick 2.0

Item {
    id: baseItem

    property string mode

    property int size: baseItem.height
    property int speed: 1
    property int maxDeviation: 30
    property bool forward: true

    onModeChanged: {
        if (mode === "INDOOR") {
            speed = 1;
            maxDeviation = 30;
        }
        else if (mode === "ABSOLUTE") {
            speed = 3;
            maxDeviation = 50;
        }
        else if (mode === "RELATIVE") {
            speed = 6;
            maxDeviation = 20;
        }
        else if (mode === "HM KF") {
            speed = 12;
            maxDeviation = 100;
        }
    }

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

    Timer {
        interval: 100; running: true; repeat: true
        onTriggered: {
            if (compassPointerImage.rotation >= maxDeviation)
            {
                baseItem.forward = false;
            }
            else if (compassPointerImage.rotation <= -maxDeviation)
            {
                baseItem.forward = true;
            }

            if (baseItem.forward)
            {
                compassPointerImage.rotation += speed;
            }
            else
            {
                compassPointerImage.rotation -= speed;
            }
        }
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:1}D{i:2}D{i:3}
}
##^##*/

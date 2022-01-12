import QtQuick 2.0
import QtQuick.Controls 6.2

Item {
    id: baseItem

    property string mode

    property int size: baseItem.height
    property int speed: 1
    property int maxDeviation: 30
    property bool forward: true
    height: 640

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
        //console.log(mode)
    }

    Rectangle {
        id: compassBackground
        color: "#c34a00"
        radius: parent.size
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.height
        height: parent.height
    }

    Image {
        id: compassScaleImage
        anchors.fill: parent
        source: "CompassScale.svg"
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

    Timer {
        interval: 10; running: true; repeat: true
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
    D{i:0;height:640;width:640}D{i:1}D{i:2}D{i:3}D{i:4}
}
##^##*/

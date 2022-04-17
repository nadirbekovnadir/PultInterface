import QtQuick 2.0
import QtQuick.Controls 6.2

Item {
    id: baseItem
    width: 198
    height: 198
    property string mode
//    property int size: baseItem.height
//    property int speed: 1
//    property int maxDeviation: 30
//    property bool forward: true
//    height: 640

//    onModeChanged: {
//        if (mode === "INDOOR") {
//            speed = 1;
//            maxDeviation = 30;
//        }
//        else if (mode === "ABSOLUTE") {
//            speed = 3;
//            maxDeviation = 50;
//        }
//        else if (mode === "RELATIVE") {
//            speed = 6;
//            maxDeviation = 20;
//        }
//        else if (mode === "HM KF") {
//            speed = 12;
//            maxDeviation = 100;
//        }
//    }

    Rectangle {
        id: compassBackground
        color: "#0F878AA0"
        width: 198
        height: 198


        Image {
            id: compassScaleImage
            fillMode: Image.PreserveAspectFit
            anchors.verticalCenter: compassBackground.verticalCenter
            anchors.horizontalCenter: compassBackground.horizontalCenter
            //smooth : true
            //anchors.fill: parent
            source: "point.svg"
        }

        Image {
            id: compassPointerImage
            anchors.verticalCenter: compassBackground.verticalCenter
            anchors.horizontalCenter: compassBackground.horizontalCenter
            source: "compass.svg"
            //rotation: 0
            //smooth : true
            //anchors.verticalCenterOffset: 0
            //anchors.horizontalCenterOffset: 0
            //anchors.horizontalCenter: compassBackground.horizontalCenter
            fillMode: Image.PreserveAspectFit
            RotationAnimation on rotation {
                loops: Animation.Infinite
                from: 0
                to: 360
                duration: 10000
            }
        }
    }
//    Timer {
//        interval: 100; running: true; repeat: true
//        onTriggered: {

//            if (compassPointerImage.rotation >= maxDeviation)
//            {
//                baseItem.forward = false;
//            }
//            else if (compassPointerImage.rotation <= -maxDeviation)
//            {
//                baseItem.forward = true;
//            }
//            if (baseItem.forward)
//            {
//                compassPointerImage.rotation += speed;
//            }
//            else
//            {
//                compassPointerImage.rotation -= speed;
//            }
//        }
//    }
}



/*##^##
Designer {
    D{i:0;height:640;width:640}D{i:1}D{i:2}D{i:3}D{i:4}
}
##^##*/

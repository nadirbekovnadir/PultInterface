import QtQuick 2.0

Item {
    id: item1
    width: 640
    height: 480

    Rectangle {
        id: attitudeBackground
        width:  parent.height
        height: parent.height
        color: "#c34a00"
        radius: parent.height
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 0
        anchors.horizontalCenterOffset: 1
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Image {
        id: attitudePointerImage
        anchors.fill: parent
        source: "AttitudePointer.svg"
        anchors.rightMargin: 181
        anchors.bottomMargin: 168
        anchors.leftMargin: 183
        anchors.topMargin: 82
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: pitchScaleImage
        x: 198
        y: 144
        width: 245
        height: 303
        source: "PitchScale.svg"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: rollScaleImage
        width: 363
        height: 153
        anchors.verticalCenter: parent.verticalCenter
        source: "RollScale.svg"
        anchors.verticalCenterOffset: -140
        anchors.horizontalCenterOffset: 1
        anchors.horizontalCenter: parent.horizontalCenter
        fillMode: Image.PreserveAspectFit
    }

}

/*##^##
Designer {
    D{i:0;formeditorZoom:1.25}D{i:1}D{i:2}D{i:3}D{i:4}
}
##^##*/

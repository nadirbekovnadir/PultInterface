import QtQuick 2.0

Item {
    property alias tickerTextFontpointSize: tickerText.font.pointSize
    Rectangle {
        id: rectangle
        opacity: 0.5
        color: "#410000"
        anchors.fill: parent

        Text {
            id: tickerText
            text: qsTr("Warning: I AM FILLER")
            anchors.fill: parent
            verticalAlignment: Text.AlignVCenter
            font.pointSize: rectangle.transformOriginPoint.y
            font.family: "Courier"
        }
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:2}D{i:1}
}
##^##*/

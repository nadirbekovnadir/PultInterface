import QtQuick 2.0

Item {
    id: baseItem
    property alias tickerTextFontpointSize: tickerText.font.pointSize

    Text {
        id: tickerLine
        text: qsTr("Text")
        anchors.fill: parent
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:1}
}
##^##*/

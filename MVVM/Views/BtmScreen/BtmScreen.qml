import QtQuick 2.0

Window {
    id: window
    title: "Systems"
    visible: true
    width: 640
    height: 480

    Flow {
        property int margin: 20
        id: flow1
        anchors.fill: parent
        anchors.topMargin: margin
        anchors.rightMargin: margin
        anchors.leftMargin: margin
        anchors.bottomMargin: margin
    }

}

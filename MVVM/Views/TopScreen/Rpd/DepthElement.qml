import QtQuick 2.0

Item {
    id:startBox
    anchors.fill: parent

    property double size: 0
    property double size_x: 200
    property double size_y: 200
    property int amount: 7

    Rectangle{
        width: 10
        height: 2
        color: "RED"
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        antialiasing : true
    }
    AxisBox{
        id: box1
        anchors.horizontalCenter: parent.horizontalCenter
        numberAxix: 3
        valueNumber: size
    }
    AxisBox{
        id: box2
        anchors.horizontalCenter: parent.horizontalCenter
        numberAxix: 2
        valueNumber: size
    }
    AxisBox{
        id: box3
        anchors.horizontalCenter: parent.horizontalCenter
        numberAxix: 1
        valueNumber: size
    }
    AxisBox{
        id: box4
        anchors.horizontalCenter: parent.horizontalCenter
        numberAxix: 0
        valueNumber: size
    }
    AxisBox{
        id: box5
        anchors.horizontalCenter: parent.horizontalCenter
        numberAxix: -1
        valueNumber: size
    }
    AxisBox{
        id: box6
        anchors.horizontalCenter: parent.horizontalCenter
        numberAxix: -2
        valueNumber: size
    }
    AxisBox{
        id: box7
        anchors.horizontalCenter: parent.horizontalCenter
        numberAxix: -3
        valueNumber: size
    }

}

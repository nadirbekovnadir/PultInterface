import QtQuick 2.0
import QtQuick.Controls 6.2

Item {
    id: baseItem2
    width: 145.5*2
    height: 198
    //property int size: baseItem.height

    Rectangle {
        id: startBackground
        color: "#0F878AA0"
        width: parent.width
        height: parent.height
        Column{
            width: parent.width
            height: parent.height
            Row {
                //anchors.horizontalCenter: parent.horizontalCenter
                //width: 178
                //height: 198
                spacing: 46
                Item {
                    width: 179
                    height: 179
                    Image {
                        fillMode: Image.PreserveAspectFit
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        //smooth : true
                        //anchors.fill: parent
                        source: "r25.svg"
                    }
                    Image {
                        fillMode: Image.PreserveAspectFit
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        //smooth : true
                        //anchors.fill: parent
                        source: "r26.svg"
                    }
                    Image {
                        fillMode: Image.PreserveAspectFit
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        //smooth : true
                        //anchors.fill: parent
                        source: "r27.svg"
                    }
                    Image {
                        fillMode: Image.PreserveAspectFit
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        //smooth : true
                        //anchors.fill: parent
                        source: "r28.svg"
                    }
                    Image {
                        fillMode: Image.PreserveAspectFit
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        //smooth : true
                        //anchors.fill: parent
                        source: "r29.svg"
                    }

                }
                Item {
                    width: 90
                    height: 179
                    Row {
                        width: parent.width
                        height: parent.height
                        Item {
                            id: arrow1_0
                            width: 11
                            height: 11.3
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.right: reg_0.left
                            anchors.rightMargin: 5
                            Image {
                                fillMode: Image.PreserveAspectFit
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                                //smooth : true
                                //anchors.fill: parent
                                source: "r32.svg"
                            }
                        }
                        DepthElement{
                            id: dep_1
                        }
                        Timer{
                            interval: 1
                            running: true
                            repeat: true
                            onTriggered: {
                                dep_1.size += 0.01
                            }
                        }
                        Item {
                            id: reg_0
                            width: 24.86
                            height: 152
                            anchors.verticalCenter: parent.verticalCenter

                            Image {
                                fillMode: Image.PreserveAspectFit
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                                //smooth : true
                                //anchors.fill: parent
                                source: "r31.svg"
                            }
                        }
                        Item {
                            id: reg_1
                            width: 24.86
                            height: 152
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: reg_0.right
                            anchors.leftMargin: 3
                            Image {
                                fillMode: Image.PreserveAspectFit
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                                //smooth : true
                                //anchors.fill: parent
                                source: "r31.svg"
                            }
                        }
                    }
                }
            }
            Item {
                width: 316
                height: 19
                anchors.horizontalCenter: parent.horizontalCenter
                Image {
                    fillMode: Image.PreserveAspectFit
                    x:65
                    //anchors.horizontalCenter: parent.horizontalCenter
                    //width: 321
                    //height: 19
                    //smooth : true
                    //anchors.fill: parent
                    source: "r30.svg"
                }
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:1}
}
##^##*/

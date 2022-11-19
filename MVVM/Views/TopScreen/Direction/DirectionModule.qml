import QtQuick 2.0

Item {
    id: baseItem2
    width: 198
    height: 198
    // property int size: baseItem.height

    Rectangle {
        id: startBackground
        color: "#0F878AA0"
        width: 198
        height: 198

        Image {
            id: centrPointImage
            fillMode: Image.PreserveAspectFit
            anchors.verticalCenter: parent.verticalCenter   // (90, 90)
            anchors.horizontalCenter: parent.horizontalCenter
            //smooth : true
            //anchors.fill: parent
            source: "r24.svg"
        }
        Image {
            id: oldPointImage
            fillMode: Image.PreserveAspectFit
            x:60
            y:60
            //smooth : true
            //anchors.fill: parent
            source: "r22.svg"
        }
        Image {
            id: newPointImage
            fillMode: Image.PreserveAspectFit
            x:60*2
            y:60*2
            //smooth : true
            //anchors.fill: parent
            source: "r23.svg"
        }

        Column {
            id:indicator    // Segmensts:  5 - 18
            spacing: 2.693
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            Image {
                id: segment5
                anchors.horizontalCenter: parent.horizontalCenter
                source: "r5.svg"
            }
            Image {
                id: segment6
                anchors.horizontalCenter: parent.horizontalCenter
                source: "r6.svg"
            }
            Image {
                id: segment7
                anchors.horizontalCenter: parent.horizontalCenter
                source: "r7.svg"
            }
            Image {
                id: segment8
                anchors.horizontalCenter: parent.horizontalCenter
                source: "r8.svg"
            }
            Image {
                id: segment9
                anchors.horizontalCenter: parent.horizontalCenter
                source: "r9.svg"
            }
            Image {
                id: segment10
                anchors.horizontalCenter: parent.horizontalCenter
                source: "r10.svg"
            }
            Image {
                id: segment11
                anchors.horizontalCenter: parent.horizontalCenter
                source: "r11.svg"
            }
            Image {
                id: segment12
                anchors.horizontalCenter: parent.horizontalCenter
                source: "r12.svg"
            }
            Image {
                id: segment13
                anchors.horizontalCenter: parent.horizontalCenter
                source: "r13.svg"
            }
            Image {
                id: segment14
                anchors.horizontalCenter: parent.horizontalCenter
                source: "r14.svg"
            }
            Image {
                id: segment15
                anchors.horizontalCenter: parent.horizontalCenter
                source: "r15.svg"
            }
            Image {
                id: segment16
                //fillMode: Image.PreserveAspectFit
                //anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                //smooth : true
                //anchors.fill: parent
                source: "r16.svg"
            }
            Image {
                id: segment17
                //fillMode: Image.PreserveAspectFit
                //anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                //smooth : true
                //anchors.fill: parent
                source: "r17.svg"
            }
            Image {
                id: segment18
                //fillMode: Image.PreserveAspectFit
                //anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                //smooth : true
                //anchors.fill: parent
                source: "r18.svg"
            }

            Timer {
                interval: 100; running: true; repeat: true
                onTriggered: {
                    //segment5.colorSpace();
                }
            }
        }

        Image {
            id: didgImage
            fillMode: Image.PreserveAspectFit
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            //smooth : true
            //anchors.fill: parent
            source: "r19.svg"
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:1}D{i:2}D{i:3}D{i:5}D{i:4}
}
##^##*/

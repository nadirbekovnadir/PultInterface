import QtQuick
import QtCharts

Item {
    property var context

    Item {
        id: mapArea
        clip: true
        anchors.fill: parent

        property double scaleStep: 0.2
        property double scaleMax: 4.0
        property double scaleMin: 0.2
        property double currScale: 1

        Scale {
            id: canvasScale
            origin.x: 0
            origin.y: 0
            xScale: 1
            yScale: 1
        }

        property string lineColor: "red"

        property int markerSize: 20
        property string markerColor: "blue"
        property string markerTextColor: "red"

        ListModel {
            id: testModel
            ListElement {
                posX: 50
                posY: 50
                posZ: 1
            }
            ListElement {
                posX: 100
                posY: 100
                posZ: 2
            }
            ListElement {
                posX: 150
                posY: 150
                posZ: 3
            }
        }

        MouseArea {
            anchors.fill: parent
            drag.target: canvasContainer
            drag.axis: Drag.XAndYAxis
            onWheel: (e)=> {

                         parent.currScale += e.angleDelta.y / Math.abs(e.angleDelta.y) * parent.scaleStep;
                         if (parent.currScale < parent.scaleMin)
                            parent.currScale = parent.scaleMin;
                         else if (parent.currScale > parent.scaleMax)
                             parent.currScale = parent.scaleMax;

                         //var mouseP = canvasContainer.mapFromGlobal(Qt.point(e.x, e.y));
                         var x = e.x;
                         var y = e.y;

                         //console.log(mouseP.x, e.x);

                         canvasScale.origin.x = x;
                         canvasScale.origin.y = y;

                         canvasScale.xScale = parent.currScale
                         canvasScale.yScale = parent.currScale
                    }
            onClicked:
            {
                testModel.append(createEl())
            }

            function createEl()
            {
                var child = testModel.get(testModel.count - 1)
                console.log(child.posX)
                return {
                    posX: child.posX + 50,
                    posY: child.posY + 150 / testModel.count,
                    posZ: child.posZ + 1
                };
            }
        }

        Item{
            // Не имеет размера, просто позволяет перемещать canvas относительно родителя
            id: canvasContainer
            transform: canvasScale

            Canvas {
                id: canvas
                width: childrenRect.width
                height: childrenRect.height

                //transform: canvasScale

                onPaint: {
                    var ctx = getContext("2d");
                    console.log(children.length);

                    ctx.beginPath();
                    ctx.lineWidth = 3;
                    ctx.strokeStyle = Qt.color(mapArea.lineColor);

                    for (var i = 0; i < children.length; ++i)
                    {
                        var child = children[i];
                        if (child.objectName !== "marker")
                            continue;

                        console.log(child.x, child.y);

                        ctx.lineTo(child.x + child.width / 2, child.y + child.height / 2);
                        ctx.moveTo(child.x + child.width / 2, child.y + child.height / 2);
                    }

                    ctx.closePath();
                    ctx.stroke();
                }

                Repeater {
                    id: repeater
                    model: testModel
                    onModelChanged: {
                        canvas.requestPaint()
                    }

                    Item {
                        id: marker
                        objectName: "marker"
                        x: posX - width / 2
                        y: posY - height / 2

                        property string color: mapArea.markerColor
                        property string textColor: mapArea.markerTextColor
                        width: mapArea.markerSize
                        height: mapArea.markerSize

                        Rectangle {
                            id: shape
                            width: marker.width
                            height: marker.height
                            radius: width*0.5
                            color: Qt.color(marker.color)
                        }

                        Text {
                            x: marker.width / 2 - width / 2
                            y: marker.height / 2 - height / 2
                            text: posZ
                            color: Qt.color(marker.textColor)
                        }
                   }
                }
            }
        }
    }
}

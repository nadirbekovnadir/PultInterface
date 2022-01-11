import QtQuick
import QtCharts

Item {
    id: root
    property var context

    property double scaleFactor: 1.2
    property double scaleMax: 5.0
    property double scaleMin: 1.0
    property double currScale: 1

    property string lineColor: "red"
    property int markerSize: 20
    property string markerColor: "blue"
    property string markerTextColor: "red"

    Scale {
        id: canvasScale
        origin.x: 0
        origin.y: 0
        xScale: 1
        yScale: 1
    }

    Item {
        id: mapArea
        anchors.fill: parent
        clip: true

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
            onWheel: (e) => scaleCanvas(e)
            onClicked: testModel.append(createEl())

            property var topLeft: Qt.point(0, 0)

            function scaleCanvas(e) {

                var scaleFactor = 0
                if (e.angleDelta.y > 0)
                {
                    scaleFactor = root.scaleFactor;
                    if (canvasScale.xScale > root.scaleMax)
                    {
                        return;
                    }
                }
                else
                {
                    scaleFactor = 1 / root.scaleFactor;
                    if (canvasScale.xScale < root.scaleMin)
                    {
                        return;
                    }
                }
                var p = mapToItem(canvas, Qt.point(e.x, e.y))
                //console.log(canvasContainer.x, canvasContainer.y);
                var realX = (p.x - topLeft.x) / canvasScale.xScale;
                var realY = (p.y - topLeft.y) / canvasScale.yScale;

                canvasScale.origin.x = realX;
                canvasScale.origin.y = realY;
                canvasScale.xScale *= scaleFactor;
                canvasScale.yScale *= scaleFactor;

                topLeft.x = (1 - canvasScale.xScale)*realX;
                topLeft.y = (1 - canvasScale.yScale)*realY;
            }

            function createEl() {
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

            Canvas {
                id: canvas
                width: childrenRect.width
                height: childrenRect.height

                transform: canvasScale

                onPaint: canvasPaint()

                function canvasPaint() {
                    var ctx = getContext("2d");
                    console.log(children.length);

                    ctx.beginPath();
                    ctx.lineWidth = 3;
                    ctx.strokeStyle = Qt.color(root.lineColor);

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
                    onModelChanged: canvas.requestPaint()

                    Item {
                        id: marker
                        objectName: "marker"
                        x: posX - width / 2
                        y: posY - height / 2

                        property string color: root.markerColor
                        property string textColor: root.markerTextColor
                        width: root.markerSize
                        height: root.markerSize

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

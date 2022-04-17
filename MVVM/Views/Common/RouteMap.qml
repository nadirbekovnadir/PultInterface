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
    property int maxMarkers: 20

    property double gridStep: 30
    property int gridTextSize: 10

    Scale {
        id: canvasScale
        origin.x: 0
        origin.y: 0
        xScale: 1
        yScale: 1
    }

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

    Canvas {
        id: mapArea
        anchors.fill: parent
        clip: true

        onPaint: mapAreaPaint()

        function mapAreaPaint() {
            var ctx = getContext("2d");

            ctx.clearRect(0, 0, mapArea.width, mapArea.height);

            ctx.beginPath();
            ctx.lineWidth = 1;
            ctx.strokeStyle = Qt.color("lightGray");

            //Динамический контроль масштаба делать лень
            var stepX = (root.gridStep * canvasScale.xScale);
            var stepY = (root.gridStep * canvasScale.yScale);
            var offsetX = canvasContainer.x % stepX;
            var offsetY = canvasContainer.y % stepY;

            for (var x = offsetX; x < mapArea.width; x += stepX)
            {
                ctx.moveTo(x, 0);
                ctx.lineTo(x, mapArea.height);
            }

            for (var y = offsetY; y < mapArea.width; y += stepY)
            {
                ctx.moveTo(0, y);
                ctx.lineTo(mapArea.width, y);
            }
            ctx.closePath();
            ctx.stroke();

            // Text
            ctx.beginPath();

            ctx.lineWidth = 1;
            ctx.font = `${root.gridTextSize}px sans-serif`;
            ctx.strokeStyle = Qt.color("black");

            var realX = 0;
            var realY = 0;

            for (x = offsetX; x < mapArea.width; x += stepX)
            {
                ctx.moveTo(x, 0);
                realX = mapToItem(canvas, x, 0).x;
                ctx.text(Number(realX).toFixed(1), x - root.gridTextSize / 2, mapArea.height - 10);
            }

            for (y = offsetY; y < mapArea.height; y += stepY)
            {
                ctx.moveTo(0, y);
                realY = mapToItem(canvas, 0, y).y;
                ctx.text(Number(realY).toFixed(1), 10, y - root.gridTextSize / 2);
            }

            ctx.closePath();
            ctx.stroke();
        }

        function scaleCanvas(e) {

            var scaleFactor = 0;
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

            var realX = (e.x - canvasContainer.topLeft.x - canvasContainer.x) / canvasScale.xScale;
            var realY = (e.y - canvasContainer.topLeft.y - canvasContainer.y) / canvasScale.yScale;

            canvasScale.origin.x = realX;
            canvasScale.origin.y = realY;
            canvasScale.xScale *= scaleFactor;
            canvasScale.yScale *= scaleFactor;

            canvasContainer.topLeft.x = (1-canvasScale.xScale)*realX;
            canvasContainer.topLeft.y = (1-canvasScale.yScale)*realY;
        }

        function focusOnItem(item)
        {
            var realX = (item.x) * canvasScale.xScale;
            var realY = (item.y) * canvasScale.yScale;
            var p = mapArea.mapFromItem(item, 0, 0);
            console.log(p.x, canvasContainer.topLeft.x, item.x);
            canvasContainer.x = -canvasContainer.topLeft.x - realX + mapArea.width / 2 - item.width / 2;
            canvasContainer.y = -canvasContainer.topLeft.y - realY + mapArea.height / 2 - item.height / 2;
        }

        MouseArea {
            anchors.fill: parent
            drag.target: canvasContainer
            drag.axis: Drag.XAndYAxis
            onWheel: (e) => {
                mapArea.scaleCanvas(e);
                mapArea.requestPaint();
            }
            onClicked: testModel.append(createEl())

            function createEl() {
                var child = testModel.get(testModel.count - 1)

                return {
                    posX: child.posX + 50,
                    posY: child.posY + 150 / testModel.count,
                    posZ: Math.random() * 100
                };
            }
        }

        Item{
            // Не имеет размера, просто позволяет перемещать canvas относительно родителя
            id: canvasContainer
            onXChanged: mapArea.requestPaint()
            onYChanged: mapArea.requestPaint()

            transform: canvasScale
            property var topLeft: Qt.point(0, 0)

            Canvas {
                id: canvas
                width: childrenRect.width
                height: childrenRect.height

                onPaint: canvasPaint()

                property ListModel model: testModel
                property int count: model.count
                onCountChanged: requestPaint()

                function canvasPaint() {
                    var ctx = getContext("2d");

                    ctx.beginPath();
                    ctx.lineWidth = 3;
                    ctx.strokeStyle = Qt.color(root.lineColor);

                    for (var i = 0; i < model.count; ++i)
                    {
                        var item = model.get(i);

                        ctx.lineTo(item.posX, item.posY);
                        ctx.moveTo(item.posX, item.posY);
                    }

                    ctx.closePath();
                    ctx.stroke();
                }

                Repeater {
                    id: repeater
                    model: testModel
                    onItemAdded: (index, item) => {

                        //console.log(item);
                        mapArea.focusOnItem(item);

                        if (count > root.maxMarkers)
                        {
                            //model.remove(0, count - root.maxMarkers);
                            //gc();
                        }
                        gc();
                    }

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
                            text: Number(posZ).toFixed(1)
                            color: Qt.color(marker.textColor)
                        }
                    }
                }
            }
        }
    }
}

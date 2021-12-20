import QtQuick 2.3
import QtMultimedia

Item {
    property var context

    id: root

    VideoOutput {
        id: display
        anchors.fill: parent
    }

    onContextChanged:
    {
        root.context.videoSink = display.videoSink
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:1}
}
##^##*/

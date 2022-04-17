import QtQuick 2.3
import QtMultimedia
import Views.Custom 1.0

Item {
    property var context

    id: root

    ProcessedVideoPlayer {
        id: videoPlayer
        model: root.context.processedVideo
        videoOutput: videoOutput
    }

    VideoOutput {
        id: videoOutput
        anchors.fill: parent
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:1}
}
##^##*/

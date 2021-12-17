import QtQuick 2.3
import QtMultimedia

Item {
//    Rectangle {
//        id: cameraDummy
//        opacity: 0.5
//        color: "#004359"
//        anchors.fill: parent
//    }

    MediaPlayer{
        id: player
        source: videoViewModel
        videoOutput: display
    }

    VideoOutput {
        id: display
        anchors.fill: parent
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:1}
}
##^##*/

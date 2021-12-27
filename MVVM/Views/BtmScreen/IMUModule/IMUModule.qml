import QtQuick 2.0
import QtQuick.Controls 6.2
import QtQuick.Layouts 6.0

Item {
    id: baseItem
    width: 640
    height: 480
    
    property real spacingRatio: 0.03


    Connections {
        target: baseItem
        onClicked: console.log("clicked")
    }

    
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:4;height:480;width:640}D{i:1}
}
##^##*/

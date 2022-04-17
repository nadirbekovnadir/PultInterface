pragma Singleton
import QtQuick 2.0

Item {
    //Screen settings generals
    property int widthRatio: 16
    property int heightRatio: 16
    property real aspectRatio: heightRatio / widthRatio

    //General spacing
    property real spacingFill: 0.03

    //General textbox size
    property real textBoxesRatio: 0.05
}

/*##^##
Designer {
    D{i:0;height:480;width:641}
}
##^##*/

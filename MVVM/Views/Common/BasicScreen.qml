import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 6.0
import QtSensors 6.0
import QtQuick.Templates 6.2
import QtQuick.Controls.Windows 6.0
import QtQuick.Window 2.14

import "../Common"


Window {
    width: 640
    height: 480
    visible: true
    minimumWidth: 640
    minimumHeight: 480

    property real spacingFill: 0.03

    property int widthRatio: 16
    property int heightRatio: 16
    property real aspectRatio: heightRatio / widthRatio

    property int marginsHorizontal: aspectRatio * mainWindow.width * spacingFill
    property int marginsVertical: aspectRatio * mainWindow.height * spacingFill
}

/*##^##
Designer {
    D{i:0;height:480;width:641}
}
##^##*/

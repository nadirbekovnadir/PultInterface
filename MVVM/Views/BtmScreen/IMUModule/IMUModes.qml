import QtQuick 2.0
import QtQuick.Controls 6.2
import QtQuick.Layouts 6.0

Item {
    id: imuModes
    width: 640
    height: 480
    RowLayout {
        id: modesRowLayout
        spacing: height * 0.03
        anchors.fill: parent

        Button {
            id: indoorHeading
            text: qsTr("INDOOR")
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.preferredWidth: imuModes.width - spacing / 2
            Layout.preferredHeight: imuModes.height
        }

        Button {
            id: relativeHeading
            text: qsTr("RELATIVE")
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.preferredWidth: imuModes.width - spacing / 2
            Layout.preferredHeight: imuModes.height
        }

        Button {
            id: absoluteHeading
            text: qsTr("ABSOLUTE")
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.preferredWidth: imuModes.width - spacing / 2
            Layout.preferredHeight: imuModes.height
        }
    }
}

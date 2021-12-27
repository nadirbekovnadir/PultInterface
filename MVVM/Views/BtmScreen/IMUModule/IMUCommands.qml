import QtQuick 2.0
import QtQuick.Controls 6.2
import QtQuick.Layouts 6.0

Item {
    id: imuModes
    width: 640
    height: 480

    ColumnLayout {
        id: modesColumnLayout
        anchors.fill: parent
        spacing: parent.height * 0.03

        RowLayout {
            id: tareResetRowLayout
            spacing: parent.height * 0.03
            Layout.fillWidth: true
            Layout.fillHeight: true

            Button {
                id: reset
                text: qsTr("RESET")
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.preferredWidth: imuModes.width - spacing / 2
                Layout.preferredHeight: imuModes.height
            }

            Button {
                id: tare
                text: qsTr("TARE")
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.preferredWidth: imuModes.width - spacing / 2
                Layout.preferredHeight: imuModes.height
            }
        }

        RowLayout {
            id: filtersRowLayout
            spacing: imuModes.height * 0.03
            Layout.fillWidth: true
            Layout.fillHeight: true

            Button {
                id: imuAlgorithmt
                text: qsTr("IMU KF")
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.preferredWidth: imuModes.width - spacing / 2
                Layout.preferredHeight: imuModes.height
            }

            Button {
                id: customAlgorithm
                text: qsTr("HT KF")
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.preferredWidth: imuModes.width - spacing / 2
                Layout.preferredHeight: imuModes.height
            }
        }
    }
}

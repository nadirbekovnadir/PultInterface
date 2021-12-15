import QtQuick 2.0
import "MVVM/Views" as CustomViews

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    CustomViews.TestComponent {}
}

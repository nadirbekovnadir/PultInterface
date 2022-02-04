import QtQuick 2.0
import "MVVM/Views/TopScreen"
import "MVVM/Views/BtmScreen"

//temp
import "MVVM/Views/Common"

Item{
    TopScreen{
        context: topScreenViewModel
    }
//    BtmScreen{
//        context: botScreenViewModel
//    }

//    Window {
//        id: testWindow
//        width: 840
//        height: 680
//        visible: true

//        RouteMap {
//            width: 480
//            height: 360
//            context: botScreenViewModel.mapViewModel
//        }
//    }
}

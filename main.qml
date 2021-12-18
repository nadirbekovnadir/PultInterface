import QtQuick 2.0
import "MVVM/Views/TopScreen"
import "MVVM/Views/BtmScreen"

Item{
    TopScreen{
        context: topScreenViewModel
    }
    BtmScreen{
        context: botScreenViewModel
    }
}

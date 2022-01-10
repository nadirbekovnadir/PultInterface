#include "BotScreenViewModel.h"

void BotScreenViewModel::onCameraModuleClicked(CameraModuleViewModel *cameraViewModel)
{
    qDebug() << "Type of camera" << cameraViewModel->staticMetaObject.className();

    if (cameraViewModel == _cameraOneViewModel.get())
        qDebug() << "first";

    if (cameraViewModel == _cameraTwoViewModel.get())
            qDebug() << "second";

    _cameraNavigationStore->setMainCamera(cameraViewModel);
}

BotScreenViewModel::BotScreenViewModel(
        shared_ptr<CameraNavigationStore> cameraNavigationStore,
        shared_ptr<CameraModuleViewModel> cameraOneViewModel,
        shared_ptr<CameraModuleViewModel> cameraTwoViewModel,
        shared_ptr<MapViewModel> mapViewModel)
    : _cameraNavigationStore(cameraNavigationStore),
      _cameraOneViewModel(cameraOneViewModel),
      _cameraTwoViewModel(cameraTwoViewModel),
      _mapViewModel(mapViewModel)
{

}

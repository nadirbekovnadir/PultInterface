#include "BotScreenViewModel.h"

void BotScreenViewModel::onCameraModuleClicked(CameraModuleViewModel *cameraViewModel)
{
    qDebug() << "Type of camera" << cameraViewModel->staticMetaObject.className();
    _cameraNavigationStore->setMainCamera(cameraViewModel);
}

BotScreenViewModel::BotScreenViewModel(
        shared_ptr<CameraNavigationStore> cameraNavigationStore,
        shared_ptr<CameraModuleViewModel> cameraOneViewModel,
        shared_ptr<CameraModuleViewModel> cameraTwoViewModel)
    : _cameraNavigationStore(cameraNavigationStore),
      _cameraOneViewModel(cameraOneViewModel),
      _cameraTwoViewModel(cameraTwoViewModel)
{

}

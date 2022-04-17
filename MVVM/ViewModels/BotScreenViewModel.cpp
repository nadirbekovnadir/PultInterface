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
        shared_ptr<IMUModeStore> imuModeStore,
        shared_ptr<CameraModuleViewModel> cameraOneViewModel,
        shared_ptr<CameraModuleViewModel> cameraTwoViewModel,
        shared_ptr<MapViewModel> mapViewModel)
    : _cameraNavigationStore(cameraNavigationStore),
      _imuModeStore(imuModeStore),
      _cameraOneViewModel(cameraOneViewModel),
      _cameraTwoViewModel(cameraTwoViewModel),
      _mapViewModel(mapViewModel)
{

}

void BotScreenViewModel::onIMUModeChanged(QString mode)
{
    qDebug() << mode;

    if (mode == "INDOOR")
    {
        _imuModeStore->setMode(IMUModeStore::INDOOR);
    }
    else if (mode == "ABSOLUTE")
    {
        _imuModeStore->setMode(IMUModeStore::ABSOLUTE);
    }
    else if (mode == "RELATIVE")
    {
        _imuModeStore->setMode(IMUModeStore::RELATIVE);
    }
    else if (mode == "HM KF")
    {
        _imuModeStore->setMode(IMUModeStore::HM_KF);
    }
}

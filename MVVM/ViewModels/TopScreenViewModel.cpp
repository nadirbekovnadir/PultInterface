#include "TopScreenViewModel.h"

TopScreenViewModel::TopScreenViewModel(
    shared_ptr<CameraNavigationStore> cameraNavigationStore,
    shared_ptr<IMUModeStore> imuModeStore)
    : _cameraNavigationStore(cameraNavigationStore),
      _imuModeStore(imuModeStore)
{
    connect(_cameraNavigationStore.get(), &CameraNavigationStore::mainCameraChanged,
            this, &TopScreenViewModel::mainCameraViewModelChanged);

    connect(_imuModeStore.get(), &IMUModeStore::modeChanged,
            this, &TopScreenViewModel::imuModeChanged);
}

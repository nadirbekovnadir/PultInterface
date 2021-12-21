#include "TopScreenViewModel.h"

TopScreenViewModel::TopScreenViewModel(
    shared_ptr<CameraNavigationStore> cameraNavigationStore)
    : _cameraNavigationStore(cameraNavigationStore)
{
    connect(_cameraNavigationStore.get(), &CameraNavigationStore::mainCameraChanged,
            this, &TopScreenViewModel::mainCameraViewModelChanged);
}

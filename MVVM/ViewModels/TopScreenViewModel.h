#pragma once

#include <QObject>

#include "../Stores/CameraNavigationStore.h"
#include "CameraModuleViewModel.h"

using namespace std;

class TopScreenViewModel : public QObject
{
    Q_OBJECT

    Q_PROPERTY(CameraModuleViewModel *mainCameraViewModel
               READ mainCameraViewModel
               NOTIFY mainCameraViewModelChanged)

private:
    shared_ptr<CameraNavigationStore> _cameraNavigationStore;

public:
    CameraModuleViewModel* mainCameraViewModel() const
    {
        return _cameraNavigationStore->mainCamera();
    }

public:
    TopScreenViewModel(
        shared_ptr<CameraNavigationStore> cameraNavigationStore);
    virtual ~TopScreenViewModel() = default;

signals:
    void mainCameraViewModelChanged();
};

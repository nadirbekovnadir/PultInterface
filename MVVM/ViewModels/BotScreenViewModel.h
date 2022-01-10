#pragma once

#include <QObject>

#include "../Stores/CameraNavigationStore.h"
#include "CameraModuleViewModel.h"
#include "MapViewModel.h"

class BotScreenViewModel : public QObject
{
    Q_OBJECT

    Q_PROPERTY(CameraModuleViewModel *cameraOneViewModel
               READ cameraOneViewModel CONSTANT)

    Q_PROPERTY(CameraModuleViewModel *cameraTwoViewModel
               READ cameraTwoViewModel CONSTANT)

    Q_PROPERTY(MapViewModel *mapViewModel
               READ mapViewModel CONSTANT)

public slots:
    Q_INVOKABLE void onCameraModuleClicked(CameraModuleViewModel *cameraViewModel);

public:
    BotScreenViewModel(
        shared_ptr<CameraNavigationStore> cameraNavigationStore,
        shared_ptr<CameraModuleViewModel> cameraOneViewModel,
        shared_ptr<CameraModuleViewModel> cameraTwoViewModel,

        shared_ptr<MapViewModel> mapViewModel);

    virtual ~BotScreenViewModel() = default;

private:
    shared_ptr<CameraNavigationStore> _cameraNavigationStore;
    shared_ptr<CameraModuleViewModel> _cameraOneViewModel;
    shared_ptr<CameraModuleViewModel> _cameraTwoViewModel;
    shared_ptr<MapViewModel> _mapViewModel;

public:
    CameraModuleViewModel* cameraOneViewModel() const
    {
        return _cameraOneViewModel.get();
    }

    CameraModuleViewModel* cameraTwoViewModel() const
    {
        return _cameraTwoViewModel.get();
    }

    MapViewModel* mapViewModel() const
    {
        return _mapViewModel.get();
    }
};

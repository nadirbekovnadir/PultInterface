#pragma once

#include <QObject>

#include "../ViewModels/CameraModuleViewModel.h"

class CameraNavigationStore : public QObject
{
    Q_OBJECT

public:
    CameraNavigationStore(
        shared_ptr<CameraModuleViewModel> mainCamera)
        : _mainCamera(mainCamera) {}
    virtual ~CameraNavigationStore() = default;

public:
    shared_ptr<CameraModuleViewModel> mainCamera() const
    {
        return _mainCamera;
    }

    void setMainCamera(shared_ptr<CameraModuleViewModel> value)
    {
        _mainCamera = value;
        emit mainCameraChanged();
    }

private:
    shared_ptr<CameraModuleViewModel> _mainCamera;

signals:
    void mainCameraChanged();
};

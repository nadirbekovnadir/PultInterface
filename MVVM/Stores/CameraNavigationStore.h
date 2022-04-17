#pragma once

#include <QObject>

#include "../ViewModels/CameraModuleViewModel.h"

class CameraNavigationStore : public QObject
{
    Q_OBJECT

public:
    CameraNavigationStore(
        CameraModuleViewModel *mainCamera)
        : _mainCamera(mainCamera) {}
    virtual ~CameraNavigationStore() = default;

public:
    CameraModuleViewModel *mainCamera() const
    {
        return _mainCamera;
    }

    void setMainCamera(CameraModuleViewModel *value)
    {
        _mainCamera = value;
        emit mainCameraChanged();
    }

private:
    CameraModuleViewModel *_mainCamera;

signals:
    void mainCameraChanged();
};

#pragma once

#include <QObject>

#include "../Stores/CameraNavigationStore.h"
#include "../Stores/IMUModeStore.h"

#include "CameraModuleViewModel.h"

using namespace std;

class TopScreenViewModel : public QObject
{
    Q_OBJECT

    Q_PROPERTY(CameraModuleViewModel *mainCameraViewModel
               READ mainCameraViewModel
               NOTIFY mainCameraViewModelChanged)

    Q_PROPERTY(QString imuMode
               READ imuMode
               NOTIFY imuModeChanged)

private:
    shared_ptr<CameraNavigationStore> _cameraNavigationStore;
    shared_ptr<IMUModeStore> _imuModeStore;

public:
    CameraModuleViewModel* mainCameraViewModel() const
    {
        return _cameraNavigationStore->mainCamera();
    }

    QString imuMode()
    {
        QString res;
        if (_imuModeStore->mode() == IMUModeStore::INDOOR)
        {
            res = "INDOOR";
        }
        else if (_imuModeStore->mode() == IMUModeStore::ABSOLUTE)
        {
            res = "ABSOLUTE";
        }
        else if (_imuModeStore->mode() == IMUModeStore::RELATIVE)
        {
            res = "RELATIVE";
        }
        else if (_imuModeStore->mode() == IMUModeStore::HM_KF)
        {
            res = "HM KF";
        }

        return res;
    }

public:
    TopScreenViewModel(
        shared_ptr<CameraNavigationStore> cameraNavigationStore,
        shared_ptr<IMUModeStore> imuModeStore);
    virtual ~TopScreenViewModel() = default;

signals:
    void mainCameraViewModelChanged();
    void imuModeChanged();
};

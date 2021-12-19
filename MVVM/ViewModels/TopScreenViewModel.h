#pragma once

#include <QObject>

#include "CameraModuleViewModel.h"

using namespace std;

class TopScreenViewModel : public QObject
{
    Q_OBJECT

    Q_PROPERTY(CameraModuleViewModel *cameraModuleViewModel READ cameraModuleViewModel CONSTANT)

private:
    shared_ptr<CameraModuleViewModel> _cameraModuleViewModel;

public:
    CameraModuleViewModel* cameraModuleViewModel() const { return _cameraModuleViewModel.get(); }

public:
    TopScreenViewModel(
        shared_ptr<CameraModuleViewModel> cameraModuleViewModel);
    virtual ~TopScreenViewModel() {}
};

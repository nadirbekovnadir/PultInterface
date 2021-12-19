#pragma once

#include <QObject>
#include <QtQml/qqmlregistration.h>

#include "CameraModuleViewModel.h"

using namespace std;

class TopScreenViewModel : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    QML_UNCREATABLE("!")

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

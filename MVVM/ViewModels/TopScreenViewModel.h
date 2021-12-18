#pragma once

#include <QObject>
#include <QtQml/qqmlregistration.h>

#include "VideoViewModel.h"

using namespace std;

class TopScreenViewModel : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    //QML_UNCREATABLE("!")

    Q_PROPERTY(VideoViewModel *videoViewModel READ videoViewModel CONSTANT)

private:
    shared_ptr<VideoViewModel> _videoViewModel;

public:
    VideoViewModel* videoViewModel() const { return _videoViewModel.get(); }

public:
    TopScreenViewModel(
        shared_ptr<VideoViewModel> videoViewModel);
    virtual ~TopScreenViewModel() {}
};

#include "CameraModuleViewModel.h"
#include <QDebug>

CameraModuleViewModel::CameraModuleViewModel()
{
    //
}


QVideoSink *CameraModuleViewModel::videoSink() const { return _videoSink; }
void CameraModuleViewModel::setVideoSink(QVideoSink *videoSink)
{
    if (videoSink == _videoSink)
        return;

//    qDebug() << "sink changed";

    _videoSink = videoSink;

    emit videoSinkChanged();
}

VideoViewModel *CameraModuleViewModel::videoViewModel()
{
    return &_videoViewModel;
}

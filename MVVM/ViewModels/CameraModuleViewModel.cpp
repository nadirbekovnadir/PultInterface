#include "CameraModuleViewModel.h"
#include <QDebug>

CameraModuleViewModel::CameraModuleViewModel(
    unique_ptr<VideoProcessingHandler> videoProcessingHandler)
{
    _videoProcessingHandler = move(videoProcessingHandler);

    connect(_videoProcessingHandler.get(), &VideoProcessingHandler::dataReady,
            this, &CameraModuleViewModel::dataReadyHandler);

    _videoProcessingHandler->start();
}

CameraModuleViewModel::~CameraModuleViewModel()
{
    _videoProcessingHandler->stop();
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

void CameraModuleViewModel::dataReadyHandler(const ProcessedVideo &processedVideo)
{
    if (_videoSink == nullptr)
        return;

    _videoSink->setVideoFrame(processedVideo.frame);
}

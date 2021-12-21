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

QPixmap CameraModuleViewModel::frame()
{
    return _processedVideo.frame;
}

void CameraModuleViewModel::dataReadyHandler(const ProcessedVideo &processedVideo)
{
    _processedVideo = processedVideo;
    emit frameChanged();
}

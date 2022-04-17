#include "CameraModuleViewModel.h"
#include <QDebug>

#ifdef QT_DEBUG
#include <sstream>
#endif

CameraModuleViewModel::CameraModuleViewModel(
    unique_ptr<VideoProcessingHandler> videoProcessingHandler)
{
    _videoProcessingHandler = move(videoProcessingHandler);

    connect(_videoProcessingHandler.get(), &VideoProcessingHandler::dataReady,
            this, &CameraModuleViewModel::dataReadyHandler);

    _videoProcessingHandler->start();

#ifdef QT_DEBUG
    timer.start();
#endif
}

CameraModuleViewModel::~CameraModuleViewModel()
{
    _videoProcessingHandler->stop();
    qDebug() << "_videoProcessingHandler stopped";
}

ProcessedVideo *CameraModuleViewModel::processedVideo()
{
    return &_processedVideo;
}

void CameraModuleViewModel::dataReadyHandler(const ProcessedVideo &processedVideo)
{
    _processedVideo = processedVideo;
    emit processedVideoChanged();

#ifdef QT_DEBUG
    //qDebug() << "Frame: " << timer.restart() << std::hash<std::thread::id>{}(std::this_thread::get_id());
#endif
}

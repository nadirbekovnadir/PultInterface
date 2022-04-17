#pragma once

#include <QObject>

#include <QVideoSink>

#include "../Services/VideoProcessingHandler.h"
#include "../Models/ProcessedVideo.h"

#ifdef QT_DEBUG
#include <QElapsedTimer>
#endif

using namespace std;

class CameraModuleViewModel : public QObject
{
    Q_OBJECT

    Q_PROPERTY(ProcessedVideo *processedVideo
               READ processedVideo
               NOTIFY processedVideoChanged)

public:
    CameraModuleViewModel(
        unique_ptr<VideoProcessingHandler> videoProcessingHandler);
    virtual ~CameraModuleViewModel();

private:
    unique_ptr<VideoProcessingHandler> _videoProcessingHandler;
    ProcessedVideo _processedVideo;

#ifdef QT_DEBUG
private:
    QElapsedTimer timer;
#endif

public:
    // Так как объект приходит из вююхи
    // не стоит использовать уникальный указатель,
    // чтобы не высвободить память, которая еще используется
    ProcessedVideo *processedVideo();

public slots:
    void dataReadyHandler(const ProcessedVideo &processedVideo);

signals:
    void processedVideoChanged();
};

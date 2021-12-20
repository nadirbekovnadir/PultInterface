#pragma once

#include <QObject>

#include <QVideoSink>
#include <QVideoFrame>

#include "../Services/VideoProcessingHandler.h"
#include "../Models/ProcessedVideo.h"

using namespace std;

class CameraModuleViewModel : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QVideoSink *videoSink
               READ videoSink
               WRITE setVideoSink
               NOTIFY videoSinkChanged)

public:
    CameraModuleViewModel(
        unique_ptr<VideoProcessingHandler> videoProcessingHandler);
    virtual ~CameraModuleViewModel();

private:
    QVideoSink *_videoSink = nullptr;
    unique_ptr<VideoProcessingHandler> _videoProcessingHandler;
    ProcessedVideo _processedVideo;

public:
    // Так как объект приходит из вююхи
    // не стоит использовать уникальный указатель,
    // чтобы не высвободить память, которая еще используется
    QVideoSink *videoSink() const;
    void setVideoSink(QVideoSink *videoSink);

public slots:
    void dataReadyHandler(const ProcessedVideo &processedVideo);

signals:
    void videoSinkChanged();
};

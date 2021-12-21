#pragma once

#include <QObject>

#include <QVideoSink>
#include <QPixmap>

#include "../Services/VideoProcessingHandler.h"
#include "../Models/ProcessedVideo.h"

using namespace std;

class CameraModuleViewModel : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QPixmap frame
               READ frame
               NOTIFY frameChanged)

public:
    CameraModuleViewModel(
        unique_ptr<VideoProcessingHandler> videoProcessingHandler);
    virtual ~CameraModuleViewModel();

private:
    unique_ptr<VideoProcessingHandler> _videoProcessingHandler;
    ProcessedVideo _processedVideo;

public:
    // Так как объект приходит из вююхи
    // не стоит использовать уникальный указатель,
    // чтобы не высвободить память, которая еще используется
    QPixmap frame();

public slots:
    void dataReadyHandler(const ProcessedVideo &processedVideo);

signals:
    void frameChanged();
};

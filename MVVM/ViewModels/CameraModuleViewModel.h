#pragma once

#include <QObject>
#include <QtQml/qqmlregistration.h>

#include <QVideoSink>
#include <QVideoFrame>

#include "VideoViewModel.h"

using namespace std;

class CameraModuleViewModel : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    QML_UNCREATABLE("!")

    Q_PROPERTY(QVideoSink *videoSink
               READ videoSink
               WRITE setVideoSink
               NOTIFY videoSinkChanged)

    Q_PROPERTY(VideoViewModel *videoViewModel READ videoViewModel CONSTANT)

public:
    CameraModuleViewModel();
    virtual ~CameraModuleViewModel() {}

private:
    QVideoSink *_videoSink;
    VideoViewModel _videoViewModel;

public:
    // Так как объект приходит из вююхи
    // не стоит использовать уникальный указатель,
    // чтобы не высвободить память, которая еще используется
    QVideoSink *videoSink() const;
    void setVideoSink(QVideoSink *videoSink);

    VideoViewModel *videoViewModel();

signals:
    void videoSinkChanged();
};

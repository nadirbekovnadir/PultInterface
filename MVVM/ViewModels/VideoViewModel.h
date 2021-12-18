#pragma once

#include <QObject>
#include <QtQml/qqmlregistration.h>

#include <QVideoSink>
#include <QVideoFrame>

using namespace std;

class VideoViewModel : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    QML_UNCREATABLE("!")

    Q_PROPERTY(QVideoSink *videoSink
               READ videoSink
               WRITE setVideoSink
               NOTIFY videoSinkChanged)

public:
    VideoViewModel();
    virtual ~VideoViewModel() {}

private:
    unique_ptr<QVideoSink> _videoSink;

public:
    QVideoSink *videoSink() const;
    void setVideoSink(QVideoSink *videoSink);

signals:
    void videoSinkChanged();
};

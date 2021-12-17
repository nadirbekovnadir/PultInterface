#pragma once

#include <QObject>
#include <QVideoSink>


class VideoViewModel : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QVideoSink *videoSink READ VideoSink CONSTANT)

public:
    VideoViewModel() {}
    virtual ~VideoViewModel() {}

private:
    QVideoSink *_videoSink;

public:
    QVideoSink *VideoSink() const { return _videoSink; }
};

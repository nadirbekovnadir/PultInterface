#include "ProcessedVideoPlayer.h"
#include <QList>

ProcessedVideoPlayer::ProcessedVideoPlayer(QQuickItem *parent)
    : QObject(parent)
{
#ifdef QT_DEBUG
    timer.start();
#endif
}

void ProcessedVideoPlayer::setModel(ProcessedVideo model)
{
    _model = model;

    if (_videoSink != nullptr)
        _videoSink->setVideoFrame(_model.frame);

    emit modelChanged();

#ifdef QT_DEBUG
    qDebug() << timer.restart();
#endif
}

void ProcessedVideoPlayer::setVideoOutput(QObject *videoOutput)
{
    _videoOutput = videoOutput;
    _videoSink = _videoOutput->property("videoSink").value<QVideoSink*>();
    emit videoOutputChanged();
}

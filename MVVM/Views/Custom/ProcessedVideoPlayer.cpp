#include "ProcessedVideoPlayer.h"
#include <QList>

ProcessedVideoPlayer::ProcessedVideoPlayer(QObject *parent)
    : QObject(parent)
{
#ifdef QT_DEBUG
    //timer.start();
#endif
}

void ProcessedVideoPlayer::setModel(ProcessedVideo *model)
{
    _model = model;
    setFrameToSink();
    emit modelChanged();

#ifdef QT_DEBUG
    //qDebug() << timer.restart();
#endif
}

void ProcessedVideoPlayer::setVideoOutput(QObject *videoOutput)
{   
    _videoOutput = videoOutput;
    _videoSink = _videoOutput->property("videoSink").value<QVideoSink*>();
    emit videoOutputChanged();
}

void ProcessedVideoPlayer::setFrameToSink()
{
    if (_videoSink == nullptr)
        return;

    QPainter painter(&_model->frame);

    for(auto& rect : _model->boundBoxes)
        painter.drawRect(rect);

    painter.end();

    QSize size(_model->frame.width(), _model->frame.height());
    auto pixelFormat = QVideoFrameFormat::pixelFormatFromImageFormat(_model->frame.format());
    QVideoFrameFormat format(size, pixelFormat);

    QVideoFrame frame(format);

    frame.map(QVideoFrame::WriteOnly);
    std::memcpy(frame.bits(0), _model->frame.bits(), _model->frame.sizeInBytes());
    frame.unmap();

    _videoSink->setVideoFrame(frame);
}

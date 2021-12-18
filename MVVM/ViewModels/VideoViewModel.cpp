#include "VideoViewModel.h"
#include <QDebug>

VideoViewModel::VideoViewModel()
{
    _videoSink = make_unique<QVideoSink>();
}


QVideoSink *VideoViewModel::videoSink() const { return _videoSink.get(); }
void VideoViewModel::setVideoSink(QVideoSink *videoSink)
{
    if (videoSink == _videoSink.get())
        return;

//    qDebug() << "sink changed";

    _videoSink.reset(videoSink);

//    QVideoFrame frame(QVideoFrameFormat(QSize(640, 480), QVideoFrameFormat::Format_BGRA8888));
//    frame.map(QVideoFrame::WriteOnly);

//    QImage image(frame.bits(0), frame.width(), frame.height(), QVideoFrameFormat::imageFormatFromPixelFormat(frame.pixelFormat()));
//    image.fill(QColor(255, 0, 0));

//    frame.unmap();
//    _videoSink->setVideoFrame(frame);

    emit videoSinkChanged();
}

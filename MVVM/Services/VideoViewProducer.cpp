#include "VideoViewProducer.h"

VideoViewProducer::VideoViewProducer(
    std::shared_ptr<IDataProvider<int>> provider,
    std::shared_ptr<IDataProcessor<int, float>> processor)
    : BaseDataHandler<int, float, VideoViewModel>(provider, processor)
{

}

bool VideoViewProducer::convertProcessedToOutput(const float &data, VideoViewModel &result)
{
    //Пока что тут будет мегакостыль, так как логика остальных частей еще не готова
    QVideoFrame frame(QVideoFrameFormat(QSize(640, 480), QVideoFrameFormat::Format_BGRA8888));
    frame.map(QVideoFrame::WriteOnly);

    QImage image(frame.bits(0), frame.width(), frame.height(), QVideoFrameFormat::imageFormatFromPixelFormat(frame.pixelFormat()));
    image.fill(QColor(255, 0, 0));

    frame.unmap();

    result.setFrame(frame);
    return true;
}

bool VideoViewProducer::convertInputToOutput(const int &data, VideoViewModel &result)
{
    return true;
}

#include "VideoProcessingHandler.h"

VideoProcessingHandler::VideoProcessingHandler(
    std::unique_ptr<IDataProvider<int>> provider,
    std::unique_ptr<IDataProcessor<int, float>> processor,
    bool withProcessing)
    : BaseProcessingHandler<int, float, ProcessedVideo>(move(provider), move(processor), withProcessing)
{
}

bool VideoProcessingHandler::convertProcessedToOutput(const float &data, ProcessedVideo &result)
{
    //Пока что тут будет мегакостыль, так как логика остальных частей еще не готова
    QVideoFrame frame(QVideoFrameFormat(QSize(640, 480), QVideoFrameFormat::Format_BGRA8888));
    frame.map(QVideoFrame::WriteOnly);

    QImage image(frame.bits(0), frame.width(), frame.height(), QVideoFrameFormat::imageFormatFromPixelFormat(frame.pixelFormat()));
    image.fill(QColor(0, 0, int(data) % 255));

    frame.unmap();

    result.frame = frame;
    result.boundBoxes.push_back(QRect(100, 80, 50, 50));
    result.boundBoxes.push_back(QRect(500, 400, 50, 50));

    return true;
}

bool VideoProcessingHandler::convertInputToOutput(const int &data, ProcessedVideo &result)
{
    //Пока что тут будет мегакостыль, так как логика остальных частей еще не готова    
    QVideoFrame frame(QVideoFrameFormat(QSize(640, 480), QVideoFrameFormat::Format_BGRA8888));
    frame.map(QVideoFrame::WriteOnly);

    QImage image(frame.bits(0), frame.width(), frame.height(), QVideoFrameFormat::imageFormatFromPixelFormat(frame.pixelFormat()));
    image.fill(QColor(0, data % 255, 0));

    frame.unmap();

    result.frame = frame;

    return true;
}

void VideoProcessingHandler::resultReadyCallback(const ProcessedVideo &result)
{
    emit dataReady(result);
}

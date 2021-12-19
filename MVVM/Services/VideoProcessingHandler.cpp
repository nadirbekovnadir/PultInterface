#include "VideoProcessingHandler.h"

VideoProcessingHandler::VideoProcessingHandler(
    std::unique_ptr<IDataProvider<int>> provider,
    std::unique_ptr<IDataProcessor<int, float>> processor,
    bool withProcessing)
    : BaseProcessingHandler<int, float, ProcessedVideo>(move(provider), move(processor), withProcessing)
{
    connect(&_watcher, &QFutureWatcher<ProcessedVideo>::resultReadyAt,
            this, &VideoProcessingHandler::resultReadyHandler);

    connect(&_watcher, &QFutureWatcher<ProcessedVideo>::progressValueChanged,
            this, &VideoProcessingHandler::statusChangedHandler);
}

bool VideoProcessingHandler::convertProcessedToOutput(const float &data, ProcessedVideo &result)
{
    //Пока что тут будет мегакостыль, так как логика остальных частей еще не готова
    QVideoFrame frame(QVideoFrameFormat(QSize(640, 480), QVideoFrameFormat::Format_BGRA8888));
    frame.map(QVideoFrame::WriteOnly);

    QImage image(frame.bits(0), frame.width(), frame.height(), QVideoFrameFormat::imageFormatFromPixelFormat(frame.pixelFormat()));
    image.fill(QColor(0, int(data) % 255, 0));

    frame.unmap();

    result.frame = frame;
    result.data = -1;
    result.processedData = data;

    return true;
}

bool VideoProcessingHandler::convertInputToOutput(const int &data, ProcessedVideo &result)
{
    //Пока что тут будет мегакостыль, так как логика остальных частей еще не готова
    QVideoFrame frame(QVideoFrameFormat(QSize(640, 480), QVideoFrameFormat::Format_BGRA8888));
    frame.map(QVideoFrame::WriteOnly);

    QImage image(frame.bits(0), frame.width(), frame.height(), QVideoFrameFormat::imageFormatFromPixelFormat(frame.pixelFormat()));
    image.fill(QColor(0, 0, 10 * data % 255));

    frame.unmap();

    result.frame = frame;
    result.data = data;
    result.processedData = -1;

    return true;
}

void VideoProcessingHandler::resultReadyHandler(int index)
{
    emit dataReady(_watcher.resultAt(index));
}

void VideoProcessingHandler::statusChangedHandler(int value)
{
    emit statusChanged(
        static_cast<BaseProcessingHandler<int, float, ProcessedVideo>::Status>(value));
}

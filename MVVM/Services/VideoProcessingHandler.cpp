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

    QImage frame(640, 480, QImage::Format_RGB32);
    frame.fill(QColor(0, 0, int(data) % 255));

    result.frame = std::move(frame);
    result.boundBoxes.push_back(QRect(100, 80, 50, 50));
    result.boundBoxes.push_back(QRect(500, 400, 50, 50));

    return true;
}

bool VideoProcessingHandler::convertInputToOutput(const int &data, ProcessedVideo &result)
{
    //Пока что тут будет мегакостыль, так как логика остальных частей еще не готова    

    QImage frame(640, 480, QImage::Format_RGB32);
    frame.fill(QColor(0, 10 * data % 255, 0));

    result.frame = std::move(frame);

    return true;

    return true;
}

void VideoProcessingHandler::resultReadyCallback(const ProcessedVideo &result)
{
    emit dataReady(result);
}

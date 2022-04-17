#include "VideoProcessingHandler.h"

VideoProcessingHandler::VideoProcessingHandler(
    std::unique_ptr<IDataProvider<int>> provider,
    std::unique_ptr<IDataProcessor<int, float>> processor,
    bool withProcessing)
    : BaseProcessingHandler<int, float, ProcessedVideo>(move(provider), move(processor), withProcessing)
{
    film1 = new QMovie("C:/Users/Nadir/Documents/Repositories/PultInterface/film1.gif");
    film2 = new QMovie("C:/Users/Nadir/Documents/Repositories/PultInterface/film2.gif");

    film1->start();
    film2->start();
}

bool VideoProcessingHandler::convertProcessedToOutput(const float &data, ProcessedVideo &result)
{
    //Пока что тут будет мегакостыль, так как логика остальных частей еще не готова

    //QImage frame(640, 480, QImage::Format_RGB32);
    //frame.fill(QColor(0, 0, int(data) % 255));

    if (film1->state() != QMovie::Running)
        film1->start();

    QImage frame(std::move(film2->currentImage()));

    result.frame = std::move(frame);
    result.boundBoxes.push_back(QRect(100, 80, 50, 50));
    result.boundBoxes.push_back(QRect(500, 400, 50, 50));

    return true;
}

bool VideoProcessingHandler::convertInputToOutput(const int &data, ProcessedVideo &result)
{
    //Пока что тут будет мегакостыль, так как логика остальных частей еще не готова

    //QImage frame(640, 480, QImage::Format_RGB32);
    //frame.fill(QColor(0, 10 * data % 255, 0));

    if (film2->state() != QMovie::Running)
        film2->start();

    QImage frame(std::move(film1->currentImage()));

    result.frame = std::move(frame);

    return true;
}

void VideoProcessingHandler::resultReadyCallback(const ProcessedVideo &result)
{
    emit dataReady(result);
}

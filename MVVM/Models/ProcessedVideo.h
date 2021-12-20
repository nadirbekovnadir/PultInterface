#pragma once

#include <QObject>
#include <QVideoFrame>

class ProcessedVideo //: public QObject
{
    //Q_OBJECT

public:
//    ProcessedVideo() {};

//    ProcessedVideo(const ProcessedVideo& another)
//    {
//        frame = another.frame;
//        data = another.data;
//        processedData = another.processedData;
//    }

//    ProcessedVideo(ProcessedVideo&& another)
//    {
//        frame = std::move(another.frame);
//        data = std::move(another.data);
//        processedData = std::move(another.processedData);
//    }

//    virtual ~ProcessedVideo() = default;

    QVideoFrame frame;
    int data = -1;
    float processedData = -1;
};

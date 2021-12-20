#pragma once

#include <QObject>
#include <QVideoFrame>

class ProcessedVideo
{
public:
    QVideoFrame frame;
    int data = -1;
    float processedData = -1;
};

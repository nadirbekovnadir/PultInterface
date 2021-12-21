#pragma once

#include <QObject>
#include <QPixmap>

class ProcessedVideo
{
public:
    QPixmap frame;
    int data = -1;
    float processedData = -1;
};

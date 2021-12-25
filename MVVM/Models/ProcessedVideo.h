#pragma once

#include <QObject>
#include <QVideoFrame>

//Да-да, это не структура!
class ProcessedVideo
{
public:
    QVideoFrame frame;
    std::list<QRect> boundBoxes;
};

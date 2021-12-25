#pragma once

#include <QObject>
#include <QPixmap>

//Да-да, это не структура!
class ProcessedVideo
{
public:
    QImage frame;
    std::list<QRect> boundBoxes;
};

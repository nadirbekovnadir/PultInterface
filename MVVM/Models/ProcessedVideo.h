#pragma once

#include <QObject>
#include <QPixmap>

//Да-да, это не структура!
class ProcessedVideo : public QObject
{
    Q_OBJECT

public:
    ProcessedVideo() = default;
    virtual ~ProcessedVideo() = default;

    ProcessedVideo(const ProcessedVideo& other)
    {
        this->frame = other.frame;
        this->boundBoxes = other.boundBoxes;
    };
    ProcessedVideo(ProcessedVideo&& other)
    {
        this->frame = std::move(other.frame);
        this->boundBoxes = std::move(other.boundBoxes);
    };

    ProcessedVideo& operator=(const ProcessedVideo& other)
    {
        this->frame = other.frame;
        this->boundBoxes = other.boundBoxes;

        return *this;
    };

    QImage frame;
    std::list<QRect> boundBoxes;
};

#pragma once

#include <QObject>
#include <QtQml/qqmlregistration.h>

class BotScreenViewModel : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    QML_UNCREATABLE("!")

public:
    BotScreenViewModel() {}
    virtual ~BotScreenViewModel() {}
};

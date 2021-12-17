#pragma once

#include <QObject>
#include <QtQml/qqmlregistration.h>

class TopScreenViewModel : public QObject
{
    Q_OBJECT
    QML_ELEMENT

public:
    TopScreenViewModel() {}
    virtual ~TopScreenViewModel() {}
};

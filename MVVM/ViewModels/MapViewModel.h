#pragma once

#include <QObject>

#include "../Models/Position.h"

class MapViewModel : public QObject
{
    Q_OBJECT

    Q_PROPERTY(Position *position
               READ position
               NOTIFY positionChanged)

public:
    MapViewModel();
    virtual ~MapViewModel();

public:
    Position *position();

private:
    Position _position;

signals:
    void positionChanged();
};

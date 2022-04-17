#pragma once

#include <QObject>

class Position : public QObject
{
    Q_OBJECT

    Q_PROPERTY(float x READ x CONSTANT)
    Q_PROPERTY(float y READ y CONSTANT)
    Q_PROPERTY(float z READ z CONSTANT)

public:
    Position() {}

    Position(float x, float y, float z) {
        _x = x;
        _y = y;
        _z = z;
    }

    Position(const Position& other)
    {
        _x = other.x();
        _y = other.y();
        _z = other.z();
    }

    virtual ~Position() {}

public:
    Position& operator=(const Position& other)
    {
        _x = other.x();
        _y = other.y();
        _z = other.z();

        return *this;
    }

private:
    float _x = 0;
    float _y = 0;
    float _z = 0;

public:
    float x() const { return _x; }
    float y() const{ return _y; }
    float z() const { return _z; }
};

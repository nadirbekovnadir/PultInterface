#pragma once

#include <QObject>
#include <QDebug>

class IMUModeStore : public QObject
{
    Q_OBJECT

public:
    enum Mode
    {
        INDOOR,
        RELATIVE,
        ABSOLUTE,
        HM_KF
    };

public:
    IMUModeStore(
        Mode mode)
        : _mode(mode) {}
    virtual ~IMUModeStore() = default;

public:
    void setMode(Mode mode)
    {
        _mode = mode;
        emit modeChanged();
    }

    Mode mode() { return _mode; }

private:
    Mode _mode;

signals:
    void modeChanged();
};

#pragma once

#include "QObject"
#include <QVideoFrame>
#include <qqmlregistration.h>

class VideoViewModel : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    QML_UNCREATABLE("!")

    Q_PROPERTY(QVideoFrame frame READ frame WRITE setFrame NOTIFY frameChanged)
    Q_PROPERTY(int data READ data WRITE setData NOTIFY dataChanged)
    Q_PROPERTY(float processedData READ processedData WRITE setProcessedData NOTIFY processedDataChanged)

private:
    QVideoFrame _frame;
    int _data = -1;
    float _processedData = -1;

public:
    VideoViewModel() {}
    VideoViewModel(VideoViewModel &&value)
    {
        _frame = std::move(value._frame);

        _data = value._data;
        value._data = -1;

        _processedData = value._processedData;
        value._processedData = -1;
    }

    virtual ~VideoViewModel() = default;

public:
    QVideoFrame frame() { return _frame; }
    void setFrame(const QVideoFrame &frame)
    {
        if (_frame == frame)
            return;

        _frame = frame;
        emit frameChanged();
    }

    int data() { return _data; }
    void setData(const int &data)
    {
        if (_data == data)
            return;

        _data = data;
        emit dataChanged();
    }

    float processedData() { return _processedData; }
    void setProcessedData(const float &processedData)
    {
        if (_processedData == processedData)
            return;

        _processedData = processedData;
        emit processedDataChanged();
    }


signals:
    void frameChanged();
    void dataChanged();
    void processedDataChanged();
};

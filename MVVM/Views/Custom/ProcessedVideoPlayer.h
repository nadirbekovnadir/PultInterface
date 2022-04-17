#pragma once

#include <QtQml/qqmlregistration.h>

#include <MVVM/Models/ProcessedVideo.h>

#include <QPainter>
#include <QImage>
#include <QVideoSink>
#include <QVideoFrame>
#include <QVariant>

#ifdef QT_DEBUG
#include <QElapsedTimer>
#include <QDebug>
#endif

class ProcessedVideoPlayer : public QObject
{
    Q_OBJECT

    Q_PROPERTY(ProcessedVideo *model
               WRITE setModel
               NOTIFY modelChanged)

    Q_PROPERTY(QObject* videoOutput
               WRITE setVideoOutput
               NOTIFY videoOutputChanged)

public:
    ProcessedVideoPlayer(QObject *parent = nullptr);
    virtual ~ProcessedVideoPlayer() = default;

    void setModel(ProcessedVideo* model);
    void setVideoOutput(QObject* videoOutput);

private:
    ProcessedVideo *_model;
    QObject* _videoOutput = nullptr;
    QVideoSink* _videoSink = nullptr;

private:
    void setFrameToSink();

#ifdef QT_DEBUG
private:
    QElapsedTimer timer;
#endif

signals:
    void modelChanged();
    void videoOutputChanged();
};

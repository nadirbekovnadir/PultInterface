#pragma once

#include <QtQml/qqmlregistration.h>

#include <MVVM/Models/ProcessedVideo.h>

#include <QQuickPaintedItem>
#include <QPainter>
#include <QPixmap>
#include <QVideoSink>

#ifdef QT_DEBUG
#include <QElapsedTimer>
#endif

class ProcessedVideoPlayer : public QObject
{
    Q_OBJECT

    Q_PROPERTY(ProcessedVideo model
               WRITE setModel
               NOTIFY modelChanged)

    Q_PROPERTY(QObject* videoOutput
               WRITE setVideoOutput
               NOTIFY videoOutputChanged)

public:
    ProcessedVideoPlayer(QQuickItem *parent = nullptr);
    virtual ~ProcessedVideoPlayer() = default;

    void setModel(ProcessedVideo model);
    void setVideoOutput(QObject* videoOutput);

private:
    ProcessedVideo _model;
    QObject* _videoOutput = nullptr;
    QVideoSink* _videoSink = nullptr;

#ifdef QT_DEBUG
private:
    QElapsedTimer timer;
#endif

signals:
    void modelChanged();
    void videoOutputChanged();
};

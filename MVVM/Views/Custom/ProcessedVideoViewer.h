#pragma once

#include <QtQml/qqmlregistration.h>

#include <MVVM/Models/ProcessedVideo.h>

#include <QQuickPaintedItem>
#include <QPainter>
#include <QPixmap>

#ifdef QT_DEBUG
#include <QElapsedTimer>
#endif

class ProcessedVideoViewer : public QQuickPaintedItem
{
    Q_OBJECT

    Q_PROPERTY(ProcessedVideo model
               WRITE setModel
               NOTIFY modelChanged)

public:
    ProcessedVideoViewer(QQuickItem *parent = nullptr);
    virtual ~ProcessedVideoViewer() = default;

    void setModel(ProcessedVideo model);
    void paint(QPainter *painter) override;

private:
    ProcessedVideo _model;

#ifdef QT_DEBUG
private:
    QElapsedTimer timer;
#endif

signals:
    void modelChanged();
};

#pragma once

#include <QtQml/qqmlregistration.h>

#include <QQuickPaintedItem>
#include <QPainter>
#include <QPixmap>

class FrameViewer : public QQuickPaintedItem
{
    Q_OBJECT

    Q_PROPERTY(QPixmap frame
               WRITE setFrame
               NOTIFY frameChanged)

public:
    FrameViewer(QQuickItem *parent = nullptr);
    virtual ~FrameViewer() = default;

    void setFrame(QPixmap frame);
    void paint(QPainter *painter) override;

private:
    QPixmap _frame;

signals:
    void frameChanged();
};

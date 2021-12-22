#include "ProcessedVideoViewer.h"
#include <QList>

ProcessedVideoViewer::ProcessedVideoViewer(QQuickItem *parent)
    : QQuickPaintedItem(parent)
{
#ifdef QT_DEBUG
    timer.start();
#endif
}

void ProcessedVideoViewer::setModel(ProcessedVideo model)
{
    _model = model;

    update();
    emit modelChanged();
}

void ProcessedVideoViewer::paint(QPainter *painter)
{
    const auto& frame = _model.frame;
    const auto& bBoxes = _model.boundBoxes;

    painter->drawPixmap(0, 0,
                        frame.width(), frame.height(),
                        frame);

    for (auto& box : bBoxes)
        painter->drawRect(box);

#ifdef QT_DEBUG
    //qDebug() << "Draw: " << timer.restart();
#endif
}

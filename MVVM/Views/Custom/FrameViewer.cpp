#include "FrameViewer.h"

FrameViewer::FrameViewer(QQuickItem *parent)
    : QQuickPaintedItem(parent)
{

}

void FrameViewer::setFrame(QPixmap frame)
{
    _frame = frame;

    update();
    emit frameChanged();
}

void FrameViewer::paint(QPainter *painter)
{
    painter->drawPixmap(0, 0, _frame.width(), _frame.height(), _frame);
}

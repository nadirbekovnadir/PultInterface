#include "MapViewModel.h"

MapViewModel::MapViewModel()
{
    _position = Position(1, 2, 10);
//    emit positionChanged();

//    _position = Position(1, 2, 10);
//    emit positionChanged();

//    _position = Position(2, 3, 20);
//    emit positionChanged();
}

MapViewModel::~MapViewModel()
{

}

Position *MapViewModel::position()
{
    return &_position;
}

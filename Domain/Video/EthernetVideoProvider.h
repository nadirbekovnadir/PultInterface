#pragma once

#include "IDataProvider.h"

//Пока это все затычка
class EthernetVideoProvider final : IDataProvider<int>
{
    int testCounter = 0;
public:
    bool tryGet(int &data) override;
};

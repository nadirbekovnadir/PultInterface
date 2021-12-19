#pragma once

#include "IDataProvider.h"

//Пока это все затычка
class EthernetVideoProvider final : IDataProvider<int>
{
    int _testCounter = 0;
    bool _isOpened = false;

public:
    virtual void open();
    virtual void close();
    virtual bool isOpened();

    bool tryGet(int &data) override;
};

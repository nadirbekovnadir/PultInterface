#pragma once

#include "IDataProvider.h"

//Пока это все затычка
class EthernetVideoProvider final : public IDataProvider<int>
{
    int _testCounter = 0;
    bool _isOpened = false;

public:
    virtual void open() override;
    virtual void close() override;
    virtual bool isOpened() override;

    bool tryGet(int &data) override;
};

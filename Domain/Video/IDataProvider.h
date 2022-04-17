#pragma once

#include <functional>

template<class T_DATA>
class IDataProvider
{
public:
    virtual void open() = 0;
    virtual void close() = 0;
    virtual bool isOpened() = 0;

    virtual bool tryGet(T_DATA &data) = 0;
};

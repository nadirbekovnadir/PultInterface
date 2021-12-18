#pragma once

#include <functional>

template<class T_DATA>
class IDataProvider
{
public:
    virtual bool tryGet(T_DATA &data);
};

#pragma once

template<class T_IN, class T_OUT>
class IDataProcessor
{
public:
    virtual bool run(const T_IN &data, T_OUT &result) = 0;
};

#pragma once

template<class T_IN, class T_OUT>
class IDataProcessor
{
    virtual bool run(const T_IN &data, T_OUT &result);
};

#pragma once

#include <QObject>

#include "Domain/Video/IDataProvider.h"
#include "Domain/Video/IDataProcessor.h"

template <class T_DATA, class T_IN, class T_OUT>
class BaseDataHandler
{
public:
    BaseDataHandler(
        std::shared_ptr<IDataProvider<T_DATA>> provider,
        std::shared_ptr<IDataProcessor<T_DATA, T_OUT>> processor);
    virtual ~BaseDataHandler() = default;

public:
    void start();
    void stop();
private:
    void processing();

protected:
    void dataCallback(const T_OUT& data) = 0;
    bool convertToOutput(T_IN *data, T_OUT *result) = 0;

private:
    std::shared_ptr<IDataProvider<T_DATA>> _provider;
    std::shared_ptr<IDataProvider<T_DATA>> _processor;

    bool _isStopped = false;
};

template<class T_DATA, class T_IN, class T_OUT>
BaseDataHandler<T_DATA, T_IN, T_OUT>::BaseDataHandler(
    std::shared_ptr<IDataProvider<T_DATA>> provider,
    std::shared_ptr<IDataProcessor<T_DATA, T_OUT>> processor)
    : _provider(provider), _processor(_processor)
{

}

template<class T_DATA, class T_IN, class T_OUT>
void BaseDataHandler<T_DATA, T_IN, T_OUT>::start()
{
    //Запуск в потоке
    {
        processing();
    }

    _isStopped = false;
}

template<class T_DATA, class T_IN, class T_OUT>
void BaseDataHandler<T_DATA, T_IN, T_OUT>::stop()
{
    //Остановка процесса в потоке
    _isStopped = true;
}

template<class T_DATA, class T_IN, class T_OUT>
void BaseDataHandler<T_DATA, T_IN, T_OUT>::processing()
{
    //Сам процесс обработки
    while(!_isStopped)
    {
        T_DATA data;
        bool isProvider = _provider->tryGet(data);
        if (!isProvider)
            continue;

        T_IN processedData;
        bool isProcessor = _processor->run(data, processedData);
        if (!isProcessor)
            continue;

        T_OUT result;
        bool isConvert = convertToOutput(result);
        if (isConvert)
            continue;

        dataCallback(result);
    }
}














#pragma once

#include <QObject>
#include <QtConcurrent/QtConcurrent>

#include "Domain/Video/IDataProvider.h"
#include "Domain/Video/IDataProcessor.h"

template <class T_DATA, class T_IN, class T_OUT>
class BaseDataHandler
{
public:
    BaseDataHandler(
        std::shared_ptr<IDataProvider<T_DATA>> provider,
        std::shared_ptr<IDataProcessor<T_DATA, T_IN>> processor,
        bool withProcessing = true);
    virtual ~BaseDataHandler() = default;

public:
    void start();
    void stop();

    bool withProcessing() const;
    void setWithProcessing(bool value);

private:
    void processing(QPromise<T_OUT> &promise);

private:
    bool _withProcessing = true;

    std::shared_ptr<IDataProvider<T_DATA>> _provider;
    std::shared_ptr<IDataProcessor<T_DATA, T_IN>> _processor;

protected:
    virtual bool convertProcessedToOutput(const T_IN &data, T_OUT &result) = 0;
    virtual bool convertInputToOutput(const T_DATA &data, T_OUT &result) = 0;
    // Немного костыльное окошко в мир сигналов и слотов
    QFutureWatcher<T_OUT> _watcher;
private:
    QFuture<T_OUT> _future;
};

template<class T_DATA, class T_IN, class T_OUT>
BaseDataHandler<T_DATA, T_IN, T_OUT>::BaseDataHandler(
    std::shared_ptr<IDataProvider<T_DATA>> provider,
    std::shared_ptr<IDataProcessor<T_DATA, T_IN>> processor,
    bool withProcessing)
    : _provider(provider), _processor(_processor),
      _withProcessing(withProcessing)
{

}

template<class T_DATA, class T_IN, class T_OUT>
void BaseDataHandler<T_DATA, T_IN, T_OUT>::start()
{
    _provider.open();
    //Запуск в потоке
    _future = QtConcurrent::run(this, &BaseDataHandler::processing);
    _watcher.setFuture(_future);
}

template<class T_DATA, class T_IN, class T_OUT>
void BaseDataHandler<T_DATA, T_IN, T_OUT>::stop()
{
    //Остановка процесса в потоке
    _future.cancel();
    _provider.close();
}

template<class T_DATA, class T_IN, class T_OUT>
bool BaseDataHandler<T_DATA, T_IN, T_OUT>::withProcessing() const
{
    return _withProcessing;
}

template<class T_DATA, class T_IN, class T_OUT>
void BaseDataHandler<T_DATA, T_IN, T_OUT>::setWithProcessing(bool value)
{
    _withProcessing = value;
}

template<class T_DATA, class T_IN, class T_OUT>
void BaseDataHandler<T_DATA, T_IN, T_OUT>::processing(QPromise<T_OUT> &promise)
{
    promise.setProgressRange(0, 4);
    //Сам процесс обработки
    while(true)
    {   
        promise.setProgressValue(0);
        // Конструкция, которая отвечает за установку паузы
        // и отмену обработки
        promise.suspendIfRequested();
        if (promise.isCanceled())
            break;

        T_DATA data;
        bool isProvider = _provider->tryGet(data);
        if (!isProvider)
            continue;

        promise.setProgressValue(1);

        promise.suspendIfRequested();
        if (promise.isCanceled())
            break;

        T_IN processedData;
        bool isProcessor = _processor->run(data, processedData);
        if (!isProcessor)
            continue;

        promise.setProgressValue(2);

        promise.suspendIfRequested();
        if (promise.isCanceled())
            break;

        T_OUT result;
        bool isConvert = convertProcessedToOutput(processedData, result);
        if (isConvert)
            continue;

        promise.setProgressValue(3);

        promise.suspendIfRequested();
        if (promise.isCanceled())
            break;

        promise.addResult(result);
    }
}














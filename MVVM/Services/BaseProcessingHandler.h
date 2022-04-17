#pragma once

#include <QObject>
#include <QtConcurrent/QtConcurrent>

#include "Domain/Video/IDataProvider.h"
#include "Domain/Video/IDataProcessor.h"

#ifdef QT_DEBUG
    #include <QElapsedTimer>
#endif

//В идеале надо все это реализовывать без Qt

template <class T_DATA, class T_IN, class T_OUT>
class BaseProcessingHandler
{
public:
    BaseProcessingHandler(
        std::unique_ptr<IDataProvider<T_DATA>> provider,
        std::unique_ptr<IDataProcessor<T_DATA, T_IN>> processor,
        bool withProcessing);
    virtual ~BaseProcessingHandler() = default;

public:
    void start();
    void stop();

    bool withProcessing() const;
    void setWithProcessing(bool value);

private:
    void processing(QPromise<T_OUT> &promise);

private:
    bool _withProcessing = true;

    std::unique_ptr<IDataProvider<T_DATA>> _provider;
    std::unique_ptr<IDataProcessor<T_DATA, T_IN>> _processor;

protected:
    virtual bool convertProcessedToOutput(const T_IN &data, T_OUT &result) = 0;
    virtual bool convertInputToOutput(const T_DATA &data, T_OUT &result) = 0;
    virtual void resultReadyCallback(const T_OUT &result) = 0;

private:
    QFutureWatcher<T_OUT> _watcher;
    QFuture<T_OUT> _future;
};

template<class T_DATA, class T_IN, class T_OUT>
BaseProcessingHandler<T_DATA, T_IN, T_OUT>::BaseProcessingHandler(
    std::unique_ptr<IDataProvider<T_DATA>> provider,
    std::unique_ptr<IDataProcessor<T_DATA, T_IN>> processor,
    bool withProcessing)
    : _withProcessing(withProcessing)
{
    _provider = move(provider);
    _processor = move(processor);
}

template<class T_DATA, class T_IN, class T_OUT>
void BaseProcessingHandler<T_DATA, T_IN, T_OUT>::start()
{
    _provider->open();
    //Запуск в потоке
    _future = QtConcurrent::run(&BaseProcessingHandler<T_DATA, T_IN, T_OUT>::processing, this);
    _watcher.setFuture(_future);
}

template<class T_DATA, class T_IN, class T_OUT>
void BaseProcessingHandler<T_DATA, T_IN, T_OUT>::stop()
{
    //Остановка процесса в потоке
    _future.cancel();
    _provider->close();
}

template<class T_DATA, class T_IN, class T_OUT>
bool BaseProcessingHandler<T_DATA, T_IN, T_OUT>::withProcessing() const
{
    return _withProcessing;
}

template<class T_DATA, class T_IN, class T_OUT>
void BaseProcessingHandler<T_DATA, T_IN, T_OUT>::setWithProcessing(bool value)
{
    _withProcessing = value;
}

template<class T_DATA, class T_IN, class T_OUT>
void BaseProcessingHandler<T_DATA, T_IN, T_OUT>::processing(QPromise<T_OUT> &promise)
{
    //Сам процесс обработки
    while(true)
    {
        // Конструкция, которая отвечает за установку паузы
        // и отмену обработки
        promise.suspendIfRequested();
        if (promise.isCanceled())
            break;

        T_DATA data;
        bool isProvider = _provider->tryGet(data);
        if (!isProvider)
            continue;

        T_IN processedData;
        bool isProcessor = _processor->run(data, processedData);
        if (!isProcessor)
            continue;

        T_OUT result;
        bool isConvert;
        if (withProcessing())
            isConvert = convertProcessedToOutput(processedData, result);
        else
            isConvert = convertInputToOutput(data, result);
        if (!isConvert)
            continue;

        //promise.addResult(std::move(result), 0);
        resultReadyCallback(result);

    }
}














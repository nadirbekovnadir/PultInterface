#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "MVVM/ViewModels/MainViewModel.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/PultInterface/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

    MainViewModel *mainViewModel = new MainViewModel(
        new TopScreenViewModel(),
        new BotScreenViewModel()
    );

    auto context = engine.rootContext();
    context->setContextObject(mainViewModel);
    //context->setContextProperty("model", mainViewModel);

    engine.addImportPath("qrc:/qmldir");

    engine.load(url);

    return app.exec();
}

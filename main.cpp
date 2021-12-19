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

    auto cameraModuleViewModel = make_shared<CameraModuleViewModel>();
    auto topScreenViewModel = make_shared<TopScreenViewModel>(cameraModuleViewModel);
    auto botScreenViewModel = make_shared<BotScreenViewModel>();

    MainViewModel *mainViewModel = new MainViewModel(
        topScreenViewModel,
        botScreenViewModel
    );

    auto context = engine.rootContext();
    context->setContextObject(mainViewModel);

    engine.addImportPath("qrc:/qmldir");

    engine.load(url);

    return app.exec();
}

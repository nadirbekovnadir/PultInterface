#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "Domain/Video/EthernetVideoProvider.h"
#include "Domain/Video/ObjectDetectionProcessor.h"

#include "MVVM/Stores/CameraNavigationStore.h"
#include "MVVM/Services/VideoProcessingHandler.h"
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


    auto provider = make_unique<EthernetVideoProvider>();
    auto processor = make_unique<ObjectDetectionProcessor>();

    auto videoProcessingHandler = make_unique<VideoProcessingHandler>(move(provider), move(processor));
    auto cameraModuleViewModel = make_shared<CameraModuleViewModel>(move(videoProcessingHandler));

    auto cameraNavigationStore = make_shared<CameraNavigationStore>(cameraModuleViewModel);

    auto topScreenViewModel = make_shared<TopScreenViewModel>(cameraNavigationStore);
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

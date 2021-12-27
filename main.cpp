#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include <MVVM/Views/Custom/ProcessedVideoPlayer.h>

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

    //Register types
    qmlRegisterType<ProcessedVideoPlayer>("Views.Custom", 1, 0, "ProcessedVideoPlayer");

    //Providers
    auto oneProvider = make_unique<EthernetVideoProvider>();
    auto twoProvider = make_unique<EthernetVideoProvider>();

    //Processors
    auto oneProcessor = make_unique<ObjectDetectionProcessor>();
    auto twoProcessor = make_unique<ObjectDetectionProcessor>();

    //Handlers
    auto oneProcessingHandler = make_unique<VideoProcessingHandler>(
                move(oneProvider), move(oneProcessor), false);

    auto twoProcessingHandler = make_unique<VideoProcessingHandler>(
                move(twoProvider), move(twoProcessor), true);


    //ViewModels
    auto cameraOneViewModel = make_shared<CameraModuleViewModel>(
                move(oneProcessingHandler));

    auto cameraTwoViewModel = make_shared<CameraModuleViewModel>(
                move(twoProcessingHandler));

    //Stores
    auto cameraNavigationStore = make_shared<CameraNavigationStore>(
                cameraOneViewModel.get());

    //ViewModels
    auto topScreenViewModel = make_shared<TopScreenViewModel>(
                cameraNavigationStore);

    auto botScreenViewModel = make_shared<BotScreenViewModel>(
                cameraNavigationStore,
                cameraOneViewModel,
                cameraTwoViewModel);

    auto mainViewModel = make_unique<MainViewModel>(
                topScreenViewModel,
                botScreenViewModel
    );

    //Init
    auto context = engine.rootContext();
    context->setContextObject(mainViewModel.get());

    engine.addImportPath("qrc:/qmldir");

    engine.load(url);

    return app.exec();
}

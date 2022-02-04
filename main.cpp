#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include <MVVM/Views/Custom/ProcessedVideoPlayer.h>

#include "Domain/Video/EthernetVideoProvider.h"
#include "Domain/Video/ObjectDetectionProcessor.h"

#include "MVVM/Stores/CameraNavigationStore.h"
#include "MVVM/Stores/IMUModeStore.h"

#include "MVVM/Services/VideoProcessingHandler.h"
#include "MVVM/ViewModels/MapViewModel.h"
#include "MVVM/ViewModels/MainViewModel.h"
#include <QSurfaceFormat>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QSurfaceFormat format;
    format.setSamples(0);
    QSurfaceFormat::setDefaultFormat(format);

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/PultInterface/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

    //Register types
    qmlRegisterType<ProcessedVideoPlayer>("Views.Custom", 1, 0, "ProcessedVideoPlayer");
    qmlRegisterSingletonType(QUrl("qrc:/PultInterface/MVVM/Views/Common/BasicScreen.qml"), "BasicScreen", 1, 0, "BasicScreen");

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

    auto mapViewModel = make_shared<MapViewModel>();

    //Stores
    auto cameraNavigationStore = make_shared<CameraNavigationStore>(
                cameraOneViewModel.get());

    auto imuModeStore = make_shared<IMUModeStore>(
                IMUModeStore::Mode::INDOOR);

    //ViewModels
    auto topScreenViewModel = make_shared<TopScreenViewModel>(
                cameraNavigationStore,
                imuModeStore);

    auto botScreenViewModel = make_shared<BotScreenViewModel>(
                cameraNavigationStore,
                imuModeStore,
                cameraOneViewModel,
                cameraTwoViewModel,
                mapViewModel);

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

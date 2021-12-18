set(QML
    TopScreen.qml
    CameraModule.qml
    HorizonModule.qml
    CompassModule.qml
    DepthModule.qml
    ForceModule.qml
    TickerModule.qml
)

qt_target_qml_sources(${PROJECT_NAME}
    QML_FILES ${QML}
    NO_CACHEGEN
)

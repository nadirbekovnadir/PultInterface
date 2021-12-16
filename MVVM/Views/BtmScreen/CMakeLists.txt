set(QML
    BtmScreen.qml
    BtmCamerasModule.qml
    DiagnosticsModule.qml
    IMUModule.qml
    SystemCtrlsModule.qml
)

qt_target_qml_sources(${PROJECT_NAME}
    QML_FILES ${QML}
    NO_CACHEGEN
)

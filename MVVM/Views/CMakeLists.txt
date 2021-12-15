set(QML
    TestComponent.qml
)

qt_target_qml_sources(${PROJECT_NAME}
    QML_FILES ${QML}
    NO_CACHEGEN
)

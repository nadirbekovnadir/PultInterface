add_qml(
    BtmScreen.qml
    ChangeWorkStateModule.qml
    DiagnosticsModule.qml
    MapAndSysModule.qml
    SystemCtrlsModule.qml
    VideoRecorderModule.qml
)

add_subdirectory(IMUModule)

propagate_to_parent()

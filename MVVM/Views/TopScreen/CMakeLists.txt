add_qml(
    TopScreen.qml
    HorizonModule.qml
    DepthModule.qml
    ForceModule.qml
    TickerModule.qml
    ClockAndElapsedTimeModule.qml
)

add_subdirectory(Compass)

propagate_to_parent()

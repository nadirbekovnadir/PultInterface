add_qml(
    TopScreen.qml
    TickerModule.qml
    ClockAndElapsedTimeModule.qml
)

add_subdirectory(Compass)
add_subdirectory(Altitude)
add_subdirectory(Force)
add_subdirectory(Depth)

propagate_to_parent()

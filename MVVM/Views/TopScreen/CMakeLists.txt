add_qml(
    TopScreen.qml
    TickerModule.qml
    ClockAndElapsedTimeModule.qml
)

add_subdirectory(Compass)
add_subdirectory(Attitude)
add_subdirectory(Force)
add_subdirectory(Depth)
add_subdirectory(Direction)
add_subdirectory(Rpd)

propagate_to_parent()

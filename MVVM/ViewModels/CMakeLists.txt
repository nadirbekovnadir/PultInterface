#General
add_headers(
    BotScreenViewModel.h
    MainViewModel.h
    TopScreenViewModel.h
    )

add_sources(
    BotScreenViewModel.cpp
    MainViewModel.cpp
    TopScreenViewModel.cpp
    )

#Camera
add_headers(
    CameraModuleViewModel.h
    )

add_sources(
    CameraModuleViewModel.cpp
    )

#Sensors
add_headers(
    )

add_sources(
    )

#Map
add_headers(
    MapViewModel.h
)

add_sources(
    MapViewModel.cpp
)

propagate_to_parent()

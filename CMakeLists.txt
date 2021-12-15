cmake_minimum_required(VERSION 3.16)

project(PultInterface VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.2 COMPONENTS Quick REQUIRED)

set(HEADERS

)

set(SOURCES
    main.cpp
)

set(QML
    main.qml
)

qt_add_executable(${PROJECT_NAME}
    ${HEADERS}
    ${SOURCES}
)

qt_add_qml_module(${PROJECT_NAME}
    URI PultInterface
    VERSION 1.0
    QML_FILES ${QML}
)

add_subdirectory(Domain)
add_subdirectory(MVVM)

target_compile_definitions(${PROJECT_NAME}
    PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)

target_link_libraries(${PROJECT_NAME}
    PRIVATE Qt6::Quick)

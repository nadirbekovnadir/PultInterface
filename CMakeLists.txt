cmake_minimum_required(VERSION 3.16)

project(PultInterface VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.2 COMPONENTS Quick Multimedia Widgets REQUIRED)

macro (propagate_to_parent)
    set (HEADERS ${HEADERS} PARENT_SCOPE)
    set (SOURCES ${SOURCES} PARENT_SCOPE)
    set (QML ${QML} PARENT_SCOPE)
    set (SVG ${SVG} PARENT_SCOPE)
endmacro()

macro (add_headers)
    file (RELATIVE_PATH _relPath "${PROJECT_SOURCE_DIR}" "${CMAKE_CURRENT_SOURCE_DIR}")
    foreach (_src ${ARGN})
        if (_relPath)
            list (APPEND HEADERS "${_relPath}/${_src}")
        else()
            list (APPEND HEADERS "${_src}")
        endif()
    endforeach()
endmacro()

macro (add_sources)
    file (RELATIVE_PATH _relPath "${PROJECT_SOURCE_DIR}" "${CMAKE_CURRENT_SOURCE_DIR}")
    foreach (_src ${ARGN})
        if (_relPath)
            list (APPEND SOURCES "${_relPath}/${_src}")
        else()
            list (APPEND SOURCES "${_src}")
        endif()
    endforeach()
endmacro()

macro (add_qml)
    file (RELATIVE_PATH _relPath "${PROJECT_SOURCE_DIR}" "${CMAKE_CURRENT_SOURCE_DIR}")
    foreach (_src ${ARGN})
        if (_relPath)
            list (APPEND QML "${_relPath}/${_src}")
        else()
            list (APPEND QML "${_src}")
        endif()
    endforeach()
endmacro()


macro (add_svg)
    file (RELATIVE_PATH _relPath "${PROJECT_SOURCE_DIR}" "${CMAKE_CURRENT_SOURCE_DIR}")
    foreach (_src ${ARGN})
        if (_relPath)
            list (APPEND PNG "${_relPath}/${_src}")
        else()
            list (APPEND PNG "${_src}")
        endif()
    endforeach()
endmacro()

add_subdirectory(Domain)
add_subdirectory(MVVM)

add_headers(

)

add_sources(
    main.cpp
)

add_qml(
    main.qml
)

qt_add_executable(${PROJECT_NAME}
    ${HEADERS}
    ${SOURCES}
)

message(STATUS ${QML})

qt_add_qml_module(${PROJECT_NAME}
    URI PultInterface
    VERSION 1.0
    QML_FILES ${QML}
    RESOURCES ${SVG}
    DESIGNER_SUPPORTED
)

target_compile_definitions(${PROJECT_NAME}
    PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)

target_link_libraries(${PROJECT_NAME}
    PRIVATE Qt6::Quick Qt6::Multimedia Qt6::Widgets)

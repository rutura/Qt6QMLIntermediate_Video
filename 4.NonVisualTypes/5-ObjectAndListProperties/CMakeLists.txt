cmake_minimum_required(VERSION 3.16)

project(5-ObjectAndListProperties VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.2 COMPONENTS Quick REQUIRED)

qt_add_executable(app5-ObjectAndListProperties
    main.cpp player.h player.cpp footballteam.h footballteam.cpp
)

qt_add_qml_module(app5-ObjectAndListProperties
    URI 5-ObjectAndListProperties
    VERSION 1.0
    QML_FILES main.qml 
)

set_target_properties(app5-ObjectAndListProperties PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_compile_definitions(app5-ObjectAndListProperties
    PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)
target_link_libraries(app5-ObjectAndListProperties
    PRIVATE Qt6::Quick)

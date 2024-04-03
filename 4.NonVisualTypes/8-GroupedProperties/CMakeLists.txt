cmake_minimum_required(VERSION 3.16)

project(8-GroupedProperties VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.2 COMPONENTS Quick REQUIRED)

qt_add_executable(appGroupedProperties
    main.cpp
)

qt_add_qml_module(appGroupedProperties
    URI GroupedProperties
    VERSION 1.0
    QML_FILES main.qml
    SOURCES player.h player.cpp playerdetails.h playerdetails.cpp footballteam.h footballteam.cpp
                striker.h striker.cpp defender.h defender.cpp
)

set_target_properties(appGroupedProperties PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_compile_definitions(appGroupedProperties
    PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)
target_link_libraries(appGroupedProperties
    PRIVATE Qt6::Quick)

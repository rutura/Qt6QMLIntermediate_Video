cmake_minimum_required(VERSION 3.16)

project(10-PropertyValueSources VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)

qt_standard_project_setup()

qt_add_executable(appPropertyValueSources
    main.cpp
)

qt_add_qml_module(appPropertyValueSources
    URI PropertyValueSources
    VERSION 1.0
    QML_FILES Main.qml
    SOURCES randomnumber.h randomnumber.cpp
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appPropertyValueSources PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.app10-PropertyValueSources
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appPropertyValueSources
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appPropertyValueSources
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

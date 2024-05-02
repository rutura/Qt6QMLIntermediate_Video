cmake_minimum_required(VERSION 3.16)

project(9-InstantiableModule VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)

qt_standard_project_setup()

qt_add_executable(appInstantiableModule
    main.cpp
)

qt_add_qml_module(appInstantiableModule
    URI InstantiableModule
    VERSION 1.0
    QML_FILES Main.qml
)

add_subdirectory(movies)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appInstantiableModule PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.app9-InstantiableModule
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appInstantiableModule
    PRIVATE Qt6::Quick moviesLibplugin
)

include(GNUInstallDirs)
install(TARGETS appInstantiableModule
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

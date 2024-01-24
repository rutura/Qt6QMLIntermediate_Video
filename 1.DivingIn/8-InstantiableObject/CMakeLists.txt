cmake_minimum_required(VERSION 3.16)

project(8-InstantiableObject VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)

qt_standard_project_setup()

add_subdirectory(module)

qt_add_executable(app8-InstantiableObject
    main.cpp
)

qt_add_qml_module(app8-InstantiableObject
    URI 8-InstantiableObject
    VERSION 1.0
    QML_FILES Main.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(app8-InstantiableObject PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.app8-InstantiableObject
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(app8-InstantiableObject
    PRIVATE Qt6::Quick myModuleLibplugin
)

include(GNUInstallDirs)
install(TARGETS app8-InstantiableObject
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

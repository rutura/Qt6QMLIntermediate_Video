/*
        . Registering a C++ type for instantiation on the C++ side.
        . Flow:
            . Create the class and make it inherit from QObject
            . Use the Q_ELEMENT macro
            . Use QML_NAMED_ELEMENT:
                . This allows specifying a name for the type on the QML side.

            . Use the qmlRegisterType function.
                . The .h and .cpp files could either be part of the module, or  just be set up in the add_executable() command.
                    Show all these options.
            . Add the class sources to the qml module as shown in the CMakeLists.txt file
            . Instantiate the type on the QML side as shown in the main.qml file.

        . ATTENTION:
            . I had some trouble getting this to work and I boiled it down to the naming that
                the QML engine didn't like. This is the approach I will take going forward:
                    . Keep the names in the project command numbered:
                        . Something like project(8-InstantiableObject VERSION 0.1 LANGUAGES CXX)

                    . Name the target without the number:
                        . Something like qt_add_executable(appInstantiableObject  main.cpp)

                    . Name the URI without the number as well:
                        . Something like :     URI InstantiableObject


  */
import QtQuick
import QtQuick.Controls
import com.blikoon.movie

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("8-InstantableObject")


    Movie{
        id: movieId
        title: "Titanic"
        mainCharacter: "Leonardo D"
    }

    Button {
        text: "Invoke created object"
        onClicked: {
            movieId.title = "Fast and Furious"
            movieId.mainCharacter = "Vin Diesel"

            console.log("New " + movieId.title +" , " + movieId.mainCharacter);
        }
    }
}

/*

        . Exploring communication between C++ and QML using ContextProperties :

        . Setup :
            . Create a CppWorker class
            . Inherit QObject
            . Use the Q_OBJECT macro
                 . decorate methods with Q_INVOKABLE : They become callable from QML
                 . or just make them public slots : They become callable from QML
            . Include QQmlContext in main.cpp
            . Expose the class as a context property :
                . engine.rootContext()->setContextProperty("BWorker",&worker);

            . The context property is available not only in the main.qml file but through
                out all your QML code. It's hosted by the qml engine that runs your qml code.
                So we can use our C++ code in :
                    . main.qml : show this
                    . Other.qml : Show this.


  */

import QtQuick
import QtQuick.Window
import QtQuick.Controls

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Call C++ from QML")

    Column {
            spacing: 10
            Button{
                text : "Call C++ Method"
                onClicked: {
                    BWorker.regularMethod()
                    BWorker.cppSlot()
                }
            }
            Rectangle {
                width: textToShowId.implicitWidth + 20
                height: 50
                color: "beige"
                Text{
                    id : textToShowId
                    text : BWorker.regularMethodWithReturn("John", 25)
                }
            }

        }

    /*
    Other{

    }
    */


}

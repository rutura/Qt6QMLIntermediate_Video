/*

        . Using qmlRegisterType to register C++ types into the QML system

                . The type becomes usable in QML like so :
                        Counter{
                            id : mCounter
                        }

                 . Properties decoarated with the Q_PROPERTY macro become accessible
                    through QML :
                        .             Text {
                                        id: mText
                                        text: mCounter.count // <<<<<==== We are accessing the count in QML
                                        anchors.centerIn: parent
                                        font.pointSize: 40
                                        color: "white"
                                    }

        . Use the Qt5 course as a reference and improvise.

  */




import QtQuick
import QtQuick.Controls
//import com.blikoon.counter 1.0
import com.blikoon.counter

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Register Non Visual Type")

    Counter{
        id : mCounter
    }

    Column{
        anchors.centerIn: parent
        spacing: 10

        Rectangle{
            width: 200
            height: 200
            radius: 20
            color: (mCounter.count >= 0) ? "green": "red"

            Text {
                id: mText
                text: mCounter.count
                anchors.centerIn: parent
                font.pointSize: 40
                color: "white"
            }
        }

        Button{
            width: 200
            text : "Start"
            onClicked: {
                mCounter.start()
            }
        }
        Button{
            width: 200
            text : "Stop"
            onClicked: {
                mCounter.stop()
            }
        }

        Button{
            width: 200
            text : "Up"
            onClicked: {
                mCounter.up = true;
            }
        }

        Button{
            width: 200
            text : "Down"
            onClicked: {
                mCounter.up = false;
            }
        }
    }
}

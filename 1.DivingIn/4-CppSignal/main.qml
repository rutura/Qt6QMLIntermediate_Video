/*
        . Using the Connections element to handle signals comming
                from exposed context properties from the C++ side.

        . Start with callQML to make things a bit simpler
        . Then use the timer to let the thing take off
            on its own.



  */


import QtQuick
import QtQuick.Controls

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("C++ Signal Handled in QML")

    Connections{
        //CppSignal sender is an object created and exposed from the C++ side of things
        target: CppSignalSender
        function onCallQml (parameter) {
            console.log("This is QML : callQml signal cought")
            mText.text = parameter;
        }

        function onCppTimer(value) {
            mRectText.text = value;
        }
    }

    Column{
        Rectangle{
            width: 200
            height: 200
            color: "red"
            radius: 10

            Text{
                id : mRectText
                text : "0"
                anchors.centerIn: parent
                color: "white"
                font.pointSize: 30
            }
        }

        Button{
            text : "Call C++ Method"
            onClicked: {
                CppSignalSender.cppSlot()
            }

        }

        Text {
            id: mText
            text: qsTr("Default")
        }
    }
}

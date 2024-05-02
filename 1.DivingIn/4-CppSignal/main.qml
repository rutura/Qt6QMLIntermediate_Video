import QtQuick
import QtQuick.Controls

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Cpp Signal")

    Connections{
        target: CppSignalSender
        function onCallQml(parameter){
            console.log("This is QML: callQml signal cought.")
        }
        function onCppTimer(value){
             mRectText.text = value
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

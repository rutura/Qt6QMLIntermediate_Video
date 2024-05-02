import QtQuick
import QtQuick.Controls
import guide.learnqt.Singletons

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Singletons")

    Button{
        id: buttonId
        text: "Click"
        onClicked: function(){
           MySingleton.doSomething();
        }
    }
}

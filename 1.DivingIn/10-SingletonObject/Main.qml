/*
    . Registring singletons. Can either use:
        . QML_SINGLETON
        . qmlRegisterSingletonInstance

  */
import QtQuick
import QtQuick.Controls
import com.blikoon.Singletons

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Singletons")


    Button{
        id: buttonId
        text: "Click"
        onClicked: function(){
           MySingleTon.callDog();
        }
    }


}

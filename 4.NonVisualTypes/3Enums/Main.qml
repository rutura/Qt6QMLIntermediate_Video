import QtQuick
import guide.learnqt.errorlevel

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Enums")

    /*
    ErrorLevel{

    }
    */


    Component.onCompleted: function(){
        console.log(ErrorLevel.MESSAGE);
    }
}

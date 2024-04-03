/*
        . Exploring  qmlRegisterUncreatableType
            . Taking advantage of that to show how to work with enums.

            . Show Q_GADGET : A lightweight version of Q_OBJECT
                . Show that Q_OBJECT works
                . I have  the
                    "Invalid QML element name "ErrorLevel";
                        value type names should begin with a lowercase letter"
                   error thatI haven't figured out the reason for yet.

        . Show what happens if one tries to create an uncreatable type
            . The error you set is

  */

import QtQuick
import com.blikoon.errorlevel 1.0

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Expose C++ Enums demo")

    //Showing what happens when one tries to create an uncreatable type.
    /*

    ErrorLevel{
    }
    */

       Component.onCompleted: {
           console.log(ErrorLevel.MESSAGE);
       }
}

/*
        . Exploring Context objects
        . They allow you to expose properties in one go
        . The properties are wrapped in a class and each one
            is modeled as a QPROPERTY.
        . You expose the wrapper object and all nested properties
            are available in QML

        . Flow :
            . use context properties to expose last name and firstname
            . Make it work in qml
            . Change to use context objects
            . Set up a timer to show how changes on the C++ side are automatically
                propagated to the QML side
        . Compare context properties to context object :
            . with contextobject , all properties are managed under one object
            . Because we're using the QPROPERTY machinery, changes propagate automatically
            . You'll find what suits you better as  you use these things in projects.

        . Steal ideas from your video course for QT5 if necessary.

  */

import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("ContextObject demo")

    Rectangle {
           id : mRect1
           width: mText1.implicitWidth + 20
           height: mText1.implicitHeight + 20
           color: "beige"
           border.color: "yellowgreen"

           Text {
               id: mText1
               anchors.centerIn: parent
               text: lastname
               font.pointSize: 20
           }
       }

       Rectangle {
           id : mRect2
           anchors.left: mRect1.right
           anchors.leftMargin: 5
           width: mText2.implicitWidth + 20
           height: mText2.implicitHeight + 20
           color: "beige"
           border.color: "yellowgreen"

           Text {
               id: mText2
               anchors.centerIn: parent
               text: firstname
               font.pointSize: 20
           }
       }
}

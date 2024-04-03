/*
        . A counter version that uses enums to control wheter
            we count up or down.

        .  Show two versions of this:
            . Once using the qmlRegisterType* functions in the main.cpp file
            . Another using the QML_* macros.


  */

import QtQuick
import QtQuick.Controls
//import com.blikoon.counter
import CounterEnumVersion

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

                   mCounter.counting = Counting.UP
               }
           }

           Button{
               width: 200
               text : "Down"
               onClicked: {

                   mCounter.counting = Counting.DOWN
               }
           }
       }
}

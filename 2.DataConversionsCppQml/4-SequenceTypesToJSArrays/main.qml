/*
        . Exploring the exchange of sequence data
        . There are many types on the C++ side
            . QVector
            . QList
            .....
         . Most of them map to simple JS arrays on the QML side.

         . We  :
            . Send sequence data to C++ from QML :
                Button{
                    id : mButton1
                    text : "Send to C++"
                    onClicked: {
                        var arr = ['Apple', 'Banana','Avocado','Pear','Orange'];
                        CppClass.qmlArrayToCpp(arr)
                    }
                }

            . Receive sequence data on the C++ side from C++ :

                Button{
                    id : mButton2
                    anchors.top: mButton1.bottom
                    text : "Read from C++"
                    onClicked: {
                        var arr = CppClass.retrieveStrings();
                        print("The length is : "+ arr.length)

                        arr.forEach(function(element){
                            console.log(element)
                        })
                    }
                }



  */

import QtQuick
import QtQuick.Controls
import SequenceTypesToJSArrays

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Sequence Demo")

    CppClass {
        id: cppClassId
    }

    Button{
        id : mButton1
        text : "Send to C++"
        onClicked: {
            var arr = ['Apple', 'Banana','Avocado','Pear','Orange'];
            cppClassId.qmlArrayToCpp(arr)
        }
    }

    Button{
        id : mButton2
        anchors.top: mButton1.bottom
        text : "Read from C++"
        onClicked: {
            var arr = cppClassId.retrieveStrings();
            print("The length is : "+ arr.length)

            arr.forEach(function(element){
                console.log(element)
            })
        }
    }
}

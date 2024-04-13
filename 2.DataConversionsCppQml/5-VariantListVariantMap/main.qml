/*
    . Exploring the use of QVariantList and QVariantMap to pass sequence data
        back and forth between C++ and QML

            . QVariantList (C++) <=> array (QML)
            . QVariantMap (C++) <=> object (QML)

    . We
            . pass data from qml to c++
                 void CppClass::passFromQmlToCpp(QVariantList list/, QVariantMap map )
            . getVariantListFromCpp();
            . getVariantMapFromCpp()
            . Invoke a js method by passing in sequence data :
                . CppClass::triggerJSCall()

    . Use the qt 5 course and improvise.

    . ATTENTION:
        . Here, for some reason, when I use QML_ELEMENT to expose the thing, it doesn't work when we call
            the JS function from C++. I am going to just avoid that and only  use context properties and
            fucus on sending variantlist and variantmap data back and forth.


  */

import QtQuick
import QtQuick.Controls

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("QVariantList and QVariant Map")

    function arrayObjectFunc(array, object){
        console.log("---Printing array---")
        array.forEach(function(element){
            console.log("Array item :" + element)
        })

        console.log("---Printing object---")
        for ( var mKey in object){
            console.log("Object[" +mKey+"] :"+ object[mKey])
        }

    }

    Button{
        id : button1
        text : "Pass data to Cpp"
        onClicked: {
            var arr = ['Africa','Asia',"Europe","North America","South America","Oceania","Antarctica"]
            var obj = {
                firstName:"John",
                lastName:"Doe",
                location:"Earth"
            }

            CppClass.passFromQmlToCpp(arr,obj);
        }

    }

    Button{
        id : button2
        anchors.top : button1.bottom
        text : "GetVariantListFromCpp"
        onClicked: {
            var data = CppClass.getVariantListFromCpp() //returns array
            data.forEach(function(element){
                console.log("Array item :" + element)
            })

        }
    }

    Button{
        id : button3
        anchors.top : button2.bottom
        text : "GetVariantMapFromCpp"
        onClicked: {
            var data = CppClass.getVariantMapFromCpp() //returns object
            for ( var mKey in data){
                console.log("Object[" +mKey+"] :"+ data[mKey])
            }
        }
    }

    Button {
        id : button4
        text : "TriggerJSCall"
        anchors.top: button3.bottom
        onClicked: {
            CppClass.triggerJSCall();
        }
    }


}

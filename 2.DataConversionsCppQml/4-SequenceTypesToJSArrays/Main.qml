import QtQuick
import QtQuick.Controls
import SequenceTypesToJSArrays


Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Sequence types to JS arrays")

    CppClass{
        id: cppClassId
    }
    Button{
        id: button1Id
        text: "Send to C++"
        onClicked: function(){
            var arr = ['Apple', 'Banana','Avocado','Pear','Orange'];
            cppClassId.qmlArrayToCpp(arr)

        }
    }

    Button{
        id: button2Id
        text: "Read form C++"
        anchors.top: button1Id.bottom
        onClicked: function(){
            var arr = cppClassId.retrieveStrings()
            print("The length of the array is: " + arr.length)

            arr.forEach(function(element){
                console.log(element)
            })
        }
    }
}

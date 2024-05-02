import QtQuick
import QtQuick.Controls
import VariantListVariantMap

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("VariantList and VariantMap")

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
        id : button1Id
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
        id : button2Id
        anchors.top : button1Id.bottom
        text : "GetVariantListFromCpp"
        onClicked: {
            var data = CppClass.getVariantListFromCpp() //returns array
            data.forEach(function(element){
                console.log("Array item :" + element)
            })

        }
    }

    Button{
        id : button3Id
        anchors.top : button2Id.bottom
        text : "GetVariantMapFromCpp"
        onClicked: {
            var data = CppClass.getVariantMapFromCpp() //returns object
            for ( var mKey in data){
                console.log("Object[" +mKey+"] :"+ data[mKey])
            }
        }
    }

    Button {
        id : button4Id
        text : "TriggerJSCall"
        anchors.top: button3Id.bottom
        onClicked: {
            CppClass.triggerJSCall();
        }
    }
}

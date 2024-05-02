import QtQuick
import QtQuick.Controls
import TimeAndDateTime

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Time and DateTime")

    property string mValue: "Clicked %1 times, double is %2"
    property int clickCount: 0

    CppClass{
        id: cppClassId
        //Receiving data from C++
        onSendDateTime:  (datetimeparam) =>
        {
            console.log("Received datetime :"+ datetimeparam);
            //Extract info
            console.log("Year :" + datetimeparam.getFullYear())
            console.log("...",datetimeparam.toGMTString())
        }

        onSendTime: (timeparam)=>{
            console.log("Received time :"+ timeparam);

        }
    }


    Button{
        id: buttonId
        text: "Click me"

       onClicked: function(){
           //Receive data from C++
          // cppClassId.cppSlot()

           //Send data to C++
           var date = new Date()
           cppClassId.timeSlot(date);
           cppClassId.dateTimeSlot(date)

           //String fromatting
           clickCount++
           buttonId.text = mValue.arg(clickCount).arg(clickCount*2)
       }
    }


}

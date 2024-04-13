/*

        . Exploring the exchange of data between C++ and QML
            . In the context of
                . date
                . datetime

        . We also show string formatting in QML an addition to regular JS
            . property string mValue: "Clicked %1 times, double is %2"

  */

import QtQuick
import QtQuick.Controls
import TimeAndDateTime 1.0

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("String,Date and Time")

    property string mValue: "Clicked %1 times, double is %2"
    property int clickCount: 0

    CppClass {
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
        id : mButton
        text : "Click Me"
        onClicked: {
            //Receiving data from C++
            cppClassId.cppSlot()


            //Sending data to C++
            /*
            var date = new Date()
            cppClassId.timeSlot(date);
            cppClassId.dateTimeSlot(date)
            */

            //String formatting
            /*
            clickCount++
            mButton.text = mValue.arg(clickCount).arg(clickCount*2)
            */

        }
    }
}

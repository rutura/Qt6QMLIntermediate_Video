---
marp: true
theme: default
class: invert
paginate : true
size: 16:9
footer: 'Slides by [Daniel Gakwaya](https://rutura.github.io/daniel.gakwaya/) at [LearnQtGuide](https://www.learnqt.guide/)'
---
![bg](images/slide_background.png)
# Notes to self
        . Exploring the exchange of data between C++ and QML
            . In the context of
                . date
                . datetime

        . We also show string formatting in QML an addition to regular JS
            . property string mValue: "Clicked %1 times, double is %2"

       
---
![bg](images/slide_background.png)
# QML and C++ : Exchanging Date and DateTime Info
![](images/1.png)

---
![bg](images/slide_background.png)
# The C++ Side
```c++
//Sending to QML
void CppClass::cppSlot()
{
    //emit sendDateTime(QDateTime::currentDateTime());
    emit sendTime(QTime::currentTime());

}

//Receiving from QML
void CppClass::timeSlot(QTime time)
{
    qDebug() << "Time from QML is :" << time;
}
void CppClass::dateTimeSlot(QDateTime datetime)
{
    qDebug() << "DateTime from QML is :" << datetime ;
}
```

---
![bg](images/slide_background.png)
# The QML Side : Receiving
```qml
    Connections{
        target: CppClass
        //Receiving data from C++
        function onSendDateTime (datetimeparam)
        {
            console.log("Received datetime :"+ datetimeparam);
            //Extract info
            console.log("Year :" + datetimeparam.getFullYear())
            console.log("...",datetimeparam.toGMTString())
        }

        function onSendTime(timeparam){
            console.log("Received time :"+ timeparam);

        }
    }
```
---
![bg](images/slide_background.png)
# The QML Side : Sending
```qml
     Button{
        id : mButton
        text : "Click Me"
        onClicked: {
            //Sending data to C++
            var date = new Date()
            //CppClass.timeSlot(date);
            //CppClass.dateTimeSlot(date)

            //String formatting
            clickCount++
            mButton.text = mValue.arg(clickCount).arg(clickCount*2)

        }
    }
```








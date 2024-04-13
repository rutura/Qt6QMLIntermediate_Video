/*

    . Exploring the building of attached properties for your C++ types :
            . You have to provide :
                . An attached class
                . An attaching class

            . An attached class provides the bulk of the features. In our example
                we want to provide timing capabilities. The attached class,
                TimerAttached explses the [interval, running] properties :
                        Q_PROPERTY(int interval READ interval WRITE setInterval NOTIFY intervalChanged)
                        Q_PROPERTY(bool running READ running WRITE setRunning NOTIFY runningChanged)


            . The attached class provides the timing infrastructure using QTimer. Notice that
                we start and stop the timer when the running propery is set. It also emits
                the timerout signal at given intervals.

            . The attaching class has two requirements :

                . Providing a
                        static TimerAttached *qmlAttachedProperties(QObject * object);
                   method that returns an instance of the attached class,

                . Putting in the
                        QML_DECLARE_TYPEINFO(Timer,QML_HAS_ATTACHED_PROPERTIES)
                   macro, as seen in our Timer "attaching" class.

            . Once we have these class, we have to register them through the QML engine.
                Notice that the attached class isn't meant to be used externally so
                we expose it as uncreatable.

            . With the proper plumbing in place we can use our Timer attached property like so :

                       Person {
                           name : "Johnson"
                           age : 33

                           Timer.running : false
                           Timer.interval : 2000
                           Timer.onTimerOut : {
                               console.log("Timer out for person")
                           }
                       }

                       Rectangle {
                           id : mRect
                           width: 200
                           height: 200
                           color: "yellowgreen"

                           Timer.running : true
                           Timer.interval : 500
                           Timer.onTimerOut : {
                               console.log("Timer out for rect")
                           }
                       }

            . Play with the running and interval properties and show the console.log
                messages to really drive the point home.

            . Use the QT5 course as a reference and improvise.




  */


import QtQuick
//import Timing
//import People
import AttachedProperties

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Attached Properties Demo")

       Person {
           name : "Johnson"
           age : 33

           Timer.running : false
           Timer.interval : 2000
           Timer.onTimerOut : {
               console.log("Timer out for person")
           }
       }

       Rectangle {
           id : mRect
           width: 200
           height: 200
           color: "yellowgreen"

           Timer.running : true
           Timer.interval : 1000
           Timer.onTimerOut : {
               console.log("Timer out for rect")
           }
       }
}

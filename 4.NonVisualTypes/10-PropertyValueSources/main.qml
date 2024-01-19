/*
        . Exploring property value sources :
            . The C++ behind the syntax like :
                 NumberAnimation on x { to: 50; duration: 1000 }

            . NumberAnimation is a property value source because the values
               that go into x come from it.

            . We will be building a random number class, that will act as a property
                value source for other types.

            . The flow :
                    . You create a custom class
                    . The class will need to inherit QQmlPropertyValueSource
                            class RandomNumber : public QObject,public QQmlPropertyValueSource
                    . The class needs to provide the macro
                                Q_INTERFACES(QQmlPropertyValueSource)
                    . The class needs to provide a setTarget method :
                            virtual void setTarget(const QQmlProperty & prop);

                    . The class needs to provide an updateProperty slot :
                        void updateProperty();

                    . QQmlProperty has a bunch of methods you can use to forward
                        and pull data to/from the property wrapped around.

                    . And what we wrap around is what our Random number bounds to
                        on the QML side, for example, we may be bounding to the
                        radius or width of a rectangle.

                    . In updateProperty, we write to the property and what we write
                        is our generated random number.

                    . With the plumbing in place, the rest is :

                        . exposing to qml :
                            .     qmlRegisterType<RandomNumber>("RandomUtil",1,0,"RandomNumber");

                        . using the types in QML :
                                Rectangle{
                                    id : mRect
                                    RandomNumber on width {
                                        maxValue: 700
                                    }
                                    height: 300
                                    color: "dodgerblue"
                                    RandomNumber on radius {
                                        maxValue: 300
                                    }
                                }

                   . Use the explanations in the Qt 5 course and improvise.

  */

import QtQuick
import RandomUtil


Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Property Value Sources Demo")

        Rectangle{
            id : mRect
            RandomNumber on width {
                maxValue: 700
            }
            height: 300
            color: "dodgerblue"
            RandomNumber on radius {
                maxValue: 300
            }
        }
}

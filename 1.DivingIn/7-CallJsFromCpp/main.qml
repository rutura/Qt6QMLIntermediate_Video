/*
        . Calling a js method from C++

        . The syntax :
            QMetaObject::invokeMethod(qmlRootObject,"qmlJSFunction",
                                      Q_RETURN_ARG(QVariant,returnedValue),
                                      Q_ARG(QVariant,cppParameter));

        .qmlRootObject is the element containing the function that you want to call,
            in this casse, the root element
        . ATTENTION : In this case, we're just interested in functions living in
            the root element, we'll see about others later on in the course.

        . We pick up the correct root object in main.cpp :
                if (engine.rootObjects().isEmpty()){
                   return -1;
                }else{
                    //--!!!!!!!Should make sure this is SET !!!!!!!!!!!!!!--
                    jsCaller.setQmlRootObject(rootObjcts[0]);
                }

  */

import QtQuick
import QtQuick.Controls

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Call QML From C++")

    function qmlJSFunction(param){
        console.log(" QML Talking, C++ called me with parameter : "+ param + "returning back something")
        return "This is QML, over to you C++. Thanks for the Call."
    }

    Button {
        id : mButton
        text : "Call QML function from C++"
        onClicked: {
            QmlJsCaller.cppMethod("QML Calling... ")
        }
    }
}

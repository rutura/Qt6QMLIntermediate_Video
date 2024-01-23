import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("9-RegistrableValueTypes")

    Component.onCompleted: {
        console.log("Person value: " + Person.isIll);
    }
}

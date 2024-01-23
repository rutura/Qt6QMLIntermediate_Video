import QtQuick
import myModule 1.0

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("9-RegistrableValueTypes")

    Component.onCompleted: {
        console.log("Person value: " + person.isIll);
    }
}

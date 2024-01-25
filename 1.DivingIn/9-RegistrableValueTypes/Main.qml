import QtQuick
import RegistrableValueTypes 1.0

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("9-RegistrableValueTypes")

    property var givenPerson: PersonModule.providePerson() // this is how your get a Value type since it is not a QObject
                                                           // You can also get from signals of Object types

    Component.onCompleted: {
        console.log("Provided person lastName: " + givenPerson.lastName + ", firstName: " + givenPerson.firstName);
        console.log("Updating person");
        givenPerson.lastName = "Gakwaya";
        givenPerson.firstName = "Daniel";
        console.log("Using person in c++");
        PersonModule.usePerson(givenPerson);
    }
}

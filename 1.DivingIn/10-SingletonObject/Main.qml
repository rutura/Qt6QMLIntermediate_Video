import QtQuick
import myModule 1.0

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    // CommsManager {
    //     id: commsManagerId1
    //  open: false
    // }

    // CommsManager {
    //     id: commsManagerId2
    //     open: false
    // }


    Component.onCompleted: {
        console.log("(C++)Is Comms Open : " + CommsManager.open)
        CommsManager.open = true;
        console.log("(C++) Is Comms Open after change: " + CommsManager.open);

    }
}

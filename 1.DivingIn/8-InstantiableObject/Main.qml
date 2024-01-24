import QtQuick
import QtQuick.Controls
import myModule 1.0

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("8-InstantableObject")

    Message {
        id: messageId
        author: "Amelie"
        creationDate: new Date()

        onAuthorChanged: newAuthor => {
            console.log("New author: " + newAuthor);
        }
        onCreationDateChanged: newDateTime => {
            console.log("New Datetime: " + newDateTime);
        }
    }
    Button {
        text: "Invoke created object"
        onClicked: {
            messageId.author = "newAmelie";
            messageId.creationDate = new Date(8.64e15);

            // console.log("New " + messageId.author +" , " + messageId.creationDate);
        }
    }
}

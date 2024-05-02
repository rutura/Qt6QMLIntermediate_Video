import QtQuick
import QtQuick.Controls

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("QProperty Mappings")

    Column {
            spacing: 20

            Text {
                id : titleId
                width: 500
                text : Movie === null ? "" : Movie.title
                //text : Movie.title
                font.pointSize: 20
                anchors.horizontalCenter: parent.horizontalCenter
            }


            Text {
                id : mainCharId
                width: 500
                text : Movie === null ? "" : Movie.mainCharacter
                //text : Movie.mainCharacter
                font.pointSize: 20
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Row {
                anchors.horizontalCenter: parent.horizontalCenter

                TextField{
                    id : titleTextFieldId
                    width: 300


                }
                Button {
                    width: 200
                    id : button1
                    text : "Change Title"
                    onClicked: {
                        Movie.title = titleTextFieldId.text
                    }
                }
            }

            Row {
                anchors.horizontalCenter: parent.horizontalCenter

                TextField{
                    id :mainCharTextFieldId
                    width: 300


                }
                Button {
                    width: 200
                    id : button2
                    text : "Change main character"
                    onClicked: {
                        Movie.mainCharacter = mainCharTextFieldId.text
                    }
                }
            }
    }



}

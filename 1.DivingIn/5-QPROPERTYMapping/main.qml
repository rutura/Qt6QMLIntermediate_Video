/*
    . Exploring how to use the QPROPERTY mechanism to propagate data back and
        forth between C++ and QML
            . You set up the QPROPERTY macros :
                Q_PROPERTY(QString mainCharacter READ mainCharacter WRITE setMainCharacter NOTIFY mainCharacterChanged)
                Q_PROPERTY(QString title READ title WRITE setTitle NOTIFY titleChanged)

            . You set up the necessary members, setters, getters and signals :
                    . See movie.h

            . You expose the movie class as a context property

            . And use it in QML

     . Problem :
            . errors when the app dies :
                .       TypeError: Cannot read property 'mainCharacter' of null
                        TypeError: Cannot read property 'title' of null

            . This suggests that our QML may be reading from an already dead movie object
                in the sequence of events when the app dies off.

            . One could mess with the qml engine and possibly solve this, but I opt to
                just check to see if we have a lively movie object before reading from
                    it in our code (I had to google around to put the js for this together ;-) :

                         text : Movie === null ? "" : Movie.mainCharacter
                        //text : Movie.mainCharacter


            . Show that if you don't emit the changed signals, the data won't update, because
                consumer objects rely on them to fetch the new data.



  */

import QtQuick
import QtQuick.Controls

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Q_PROPERTY Mappings")

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

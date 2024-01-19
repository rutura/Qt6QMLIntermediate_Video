/*

        . Exploring object and list properties
            . Taking reference from the example :
                https://doc.qt.io/qt-6/qtqml-referenceexamples-properties-example.html
            . The difference from the Qt 5 course is that they changed the
                parameter types form functions taking a size from int to qsizetype

                    . In Qt 6 they take qsizetype :
                        .     static qsizetype playerCount(QQmlListProperty<Player>*);
                                static Player* player(QQmlListProperty<Player>*, qsizetype);

                    . While they took int in Qt 5 :
                        .    static int playerCount(QQmlListProperty<Player>*);
                                static Player* player(QQmlListProperty<Player>*, int);

            . The rest is the same as in Qt 5

            . Take explanations from the docs :
                https://doc.qt.io/qt-6/qtqml-cppintegration-exposecppattributes.html#properties-with-object-types

            . This explanation must not be left out :
                Properties with Object-List Types
                    Properties containing lists of QObject-derived types can also be exposed to QML.
                    For this purpose, however, one should use QQmlListProperty rather than QList<T>
                    as the property type. This is because QList is not a QObject-derived type,
                    and so cannot provide the necessary QML property characteristics through
                    the Qt meta object system, such as signal notifications when a list is modified.

            . Combine it with the Qt 5 course material
  */

import QtQuick
import com.blikoon.Football 1.0

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

       FootBallTeam {
           id : team1
           title: "Rayon Sports"
           coatch: "Coatch Name"
           captain: Player{
               name: "Captain"
               position: "Middle Field"
               playing: true
           }

           players: [

               Player{
                   name: "Player1"
                   position: "Middle Field"
                   playing: true
               },
               Player{
                   name: "Player2"
                   position: "Middle Field"
                   playing: true
               },
               Player{
                   name: "Player3"
                   position: "Middle Field"
                   playing: true
               },
               Player{
                   name : "Daniel"
                   position: "None"
                   playing: false
               }



           ]
       }

       ListView {
           anchors.fill: parent
           model : team1.players
           delegate: Rectangle{
               width: parent.width
               height: 50
               border.width: 1
               border.color: "yellowgreen"
               color: "beige"

               Text {
                   anchors.centerIn: parent
                   text : name
                   font.pointSize: 20
               }
           }
       }


       Component.onCompleted: {
           console.log("We have :" + team1.players.length + " players in the team "+ team1.title)
       }
}

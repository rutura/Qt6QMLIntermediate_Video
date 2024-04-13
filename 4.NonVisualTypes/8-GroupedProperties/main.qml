/*
        . Exploring grouped properties :
            . We want to allow the syntax like this :
                        Striker{
                                    name: "Captain"
                                    position: "Middle Field"
                                    playing: true
                                    details {height : 178 ; weight : 76 ; speed : 76} <<<=====
                                }

                   for the player details. Other variations are :

                            details  {
                                height : 333
                                weight : 76
                                speed : 76
                            }

                   and :


                            details.height : 222
                            details.weight : 67
                            details.speed : 77


           . This is the same thing you see on elements like Font and others.

           . To set this up :
                . You create a class that wraps around your "grouped" properties,
                    in this case, height, weight, speed. The wrapper class is
                    PlayerDetails.

                 . The "grouped" properties are decorated with the Q_PROPERTY macro.
                     We also generate the necessary methods, setters, getters, signals.

                     . Once we have the class, we add an object of it as a property of the
                            player class  :
                                class Player : public QObject
                                {
                                    Q_OBJECT
                                    Q_PROPERTY(PlayerDetails * details READ details  NOTIFY detailsChanged)
                                    .....

                                };

                  . Set up the necessary methods for READ and NOTIFY
                 . And expose the PlayerDetails class to QML :
                        qmlRegisterUncreatableType<PlayerDetails>("com.blikoon.Football", 1,0, "PlayerDetails",
                                                       "Can not create PlayerDetails in QML.Not allowed.");


               . Once we have this plumbing in place, we can use our grouped properties syntax.

          . Use the Qt 5 course where necessary and improvise.


  */


import QtQuick
//import com.blikoon.Football 1.0
import  GroupedProperties


Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    FootBallTeam {
        id : team1
        title: "Rayon Sports"
        coatch: "Coatch Name"
        captain: Striker{
            name: "Captain"
            position: "Middle Field"
            playing: true
            details {height : 178 ; weight : 76 ; speed : 76}
        }

        players: [

            Defender{
                name: "Player1"
                position: "Middle Field"
                playing: true
                details  {
                    height : 333
                    weight : 76
                    speed : 76
                }
            },
            Striker{
                name: "Player2"
                position: "Middle Field"
                playing: true

                details.height : 222
                details.weight : 67
                details.speed : 77
            },
            Defender{
                name: "Player3"
                position: "Middle Field"
                playing: true
            },
            Striker{
                name : "Daniel"
                position: "None"
                playing: false
            }
        ]
    }

    FootBallTeam {
        id : team2
        title: "APR"
        coatch: "Coatch Name"
        captain: Striker{
            name: "Captain"
            position: "Middle Field"
            playing: true
        }

        Defender{
            name: "Player4"
            position: "Middle Field"
            playing: true
        }
        Striker{
            name: "Player5"
            position: "Middle Field"
            playing: true
        }
        Defender{
            name: "Player6"
            position: "Middle Field"
            playing: true
        }
        Striker{
            name : "Daniel2"
            position: "None"
            playing: false
        }
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
        console.log(team1.players[0].details.height)
        //console.log("We have :" + team2.players.length + " players in the team "+ team2.title)
    }
}

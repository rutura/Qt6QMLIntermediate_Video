/*

        . Exploring default properties :
            . All you have to do is to add the macro :
                    Q_CLASSINFO("DefaultProperty","players")
                 to your class with list properties

            . You can then set up your team like so :

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


               . The qml engine will take the players and store them
                        in the players property.

                . The Q_CLASSINFO("DefaultProperty","players") macro is basically telling
                    the qml engine to take any element that's not explicitly assigned to
                    property and treat it as it is for the players property.

              . Use explanations from the Qt 5 course and improvise.

  */


import QtQuick
//import com.blikoon.Football 1.0
import DefaultProperties


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
        }

        players: [

            Defender{
                name: "Player1"
                position: "Middle Field"
                playing: true
            },
            Striker{
                name: "Player2"
                position: "Middle Field"
                playing: true
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
        console.log("We have :" + team2.players.length + " players in the team "+ team2.title)
    }
}

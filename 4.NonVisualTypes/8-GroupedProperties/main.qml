import QtQuick
import GroupedProperties

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Grouped Properties")

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

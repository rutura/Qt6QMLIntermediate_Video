import QtQuick
import ObjectAndListProperties

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Object List Properties")

    FootBallTeam{
        id: team1Id
        title: "Rayon Sports"
        coatch: "Raul Shung"
        captain: Player{
            name: "Captain"
            position: "Middle Field"
            playing: true
        }


        players: [
            Player{
                name: "Player1"
                position: "Striker"
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
        model : team1Id.players
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

    Component.onCompleted: function(){
        console.log("We have " + team1Id.players.length + " players in team " + team1Id.title)
    }
}

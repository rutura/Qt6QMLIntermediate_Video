/*

        . Exploring how to work with object and list properties
            when inheritance hierarchies are involved.

        . Pull from the Qt 5 Course and improvise.

        . ATTENTION : Don't make the project name too long otherwise
            Qt creator is going to fail to build the thing for some
            unknown reason.

  */


import QtQuick
//import com.blikoon.Football 1.0
import InheritedTypes


Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Working with inherited types")

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

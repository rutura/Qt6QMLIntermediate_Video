---
marp: true
theme: default
class: invert
paginate : true
size: 16:9
footer: 'Slides by [Daniel Gakwaya](https://rutura.github.io/daniel.gakwaya/) at [LearnQtGuide](https://www.learnqt.guide/)'
---
![bg](images/slide_background.png)
# Notes to self
        . Exploring how to work with object and list properties
            when inheritance hierarchies are involved.

        . Pull from the Qt 5 Course and improvise.

        . ATTENTION : Don't make the project name too long otherwise
            Qt creator is going to fail to build the thing for some
            unknown reason.     
---
![bg](images/slide_background.png)
# Inherited types
![](images/1.png)

---
![bg](images/slide_background.png)
* Player
    * Defender
    * Striker

---
![bg](images/slide_background.png)
```qml
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
            }
        ]
    }
```














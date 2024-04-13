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
---
![bg](images/slide_background.png)
# Grouped Properties
![](images/1.png)

---
![bg](images/slide_background.png)
```qml
        Striker{
            name: "Captain"
            position: "Middle Field"
            playing: true
            details {height : 178 ; weight : 76 ; speed : 76}
        }
```

---
![bg](images/slide_background.png)
```qml
            Defender{
                name: "Player1"
                position: "Middle Field"
                playing: true
                details  {
                    height : 333
                    weight : 76
                    speed : 76
                }
            }
```

---
![bg](images/slide_background.png)
```qml
            Striker{
                name: "Player2"
                position: "Middle Field"
                playing: true

                details.height : 222
                details.weight : 67
                details.speed : 77
            }
```

---
![bg](images/slide_background.png)
The same thing you see on elements like Font

---
![bg](images/slide_background.png)

```c++
class PlayerDetails : public QObject
{
    Q_OBJECT
public:
    explicit PlayerDetails(QObject *parent = nullptr);

    Q_PROPERTY(qreal height READ height WRITE setHeight NOTIFY heightChanged)
    Q_PROPERTY(qreal weight READ weight WRITE setWeight NOTIFY weightChanged)
    Q_PROPERTY(qreal speed READ speed WRITE setSpeed NOTIFY speedChanged)

    qreal height() const;
    qreal weight() const;
    qreal speed() const;
    void setHeight(qreal height);
    void setWeight(qreal weight);
    void setSpeed(qreal speed);
signals:
    void heightChanged(qreal height);
    void weightChanged(qreal weight);
    void speedChanged(qreal speed);
private:
    qreal m_height;
    qreal m_weight;
    qreal m_speed;
};
```

---
![bg](images/slide_background.png)
```c++
class Player : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
    Q_PROPERTY(bool playing READ playing WRITE setPlaying NOTIFY playingChanged)
    Q_PROPERTY(QString position READ position WRITE setPosition NOTIFY positionChanged)
    Q_PROPERTY(PlayerDetails * details READ details  NOTIFY detailsChanged)
public:
    explicit Player(QObject *parent = nullptr);
    /*...*/
    PlayerDetails * details() ;
signals:
    void detailsChanged();

private :
    PlayerDetails m_details;
};
```

---
![bg](images/slide_background.png)
```c++
PlayerDetails *Player::details()
{
    return &m_details;
}
```

---
![bg](images/slide_background.png)
# Use Default Properties in QML
```qml
        Striker{
            name: "Captain"
            position: "Middle Field"
            playing: true
            details {height : 178 ; weight : 76 ; speed : 76}
        }
```




















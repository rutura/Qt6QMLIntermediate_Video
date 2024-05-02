#ifndef MOVIE_H
#define MOVIE_H

#include <QObject>
//#include <qqml.h>
#include <QtQml>

class Movie : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString mainCharacter READ mainCharacter WRITE setMainCharacter NOTIFY mainCharacterChanged)
    Q_PROPERTY(QString title READ title WRITE setTitle NOTIFY titleChanged)
    //QML_ELEMENT
    //QML_NAMED_ELEMENT(Movie_v2)


public:
    explicit Movie(QObject *parent = nullptr);

    QString mainCharacter() const;
    void setMainCharacter(QString mainCharacter);

    QString title() const;
    void setTitle(QString title);

signals:

    void mainCharacterChanged(QString mainCharacter);

    void titleChanged(QString title);

private:
    QString m_title;
    QString m_mainCharacter;
};

#endif // MOVIE_H

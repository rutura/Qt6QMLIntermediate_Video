#ifndef STRIKER_H
#define STRIKER_H

#include <QObject>
#include <QtQml>
#include "player.h"

class Striker : public Player
{
    Q_OBJECT
    QML_ELEMENT
public:
    explicit Striker(QObject *parent = nullptr);

    void play();

    void strike();

signals:

public slots:
};

#endif // STRIKER_H

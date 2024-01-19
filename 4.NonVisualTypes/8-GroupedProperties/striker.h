#ifndef STRIKER_H
#define STRIKER_H

#include <QObject>
#include "player.h"

class Striker : public Player
{
    Q_OBJECT
public:
    explicit Striker(QObject *parent = nullptr);

    void play();

    void strike();

signals:

public slots:
};

#endif // STRIKER_H

#ifndef DEFENDER_H
#define DEFENDER_H

#include <QObject>
#include "player.h"

class Defender : public Player
{
    Q_OBJECT
public:
    explicit Defender(QObject *parent = nullptr);

    void play();

    void defend();

signals:

public slots:
};

#endif // DEFENDER_H

#ifndef DEFENDER_H
#define DEFENDER_H

#include <QObject>
#include <QtQml>
#include "player.h"

class Defender : public Player
{
    Q_OBJECT
    QML_ELEMENT
public:
    explicit Defender(QObject *parent = nullptr);

    void play();

    void defend();

signals:

public slots:
};

#endif // DEFENDER_H

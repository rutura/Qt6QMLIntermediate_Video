#include <QDebug>
#include "defender.h"

Defender::Defender(QObject *parent) : Player(parent)
{

}

void Defender::play()
{
    qDebug() << name() << " is playing";
}

void Defender::defend()
{
    qDebug() << name() << " is defending";
}

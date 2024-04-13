#ifndef TIMER_H
#define TIMER_H

#include <QObject>
#include <QtQml>
#include <qqml.h>
#include "timerattached.h"

//The attaching class: what we reference in QML files.
class Timer : public QObject
{
    Q_OBJECT
    QML_ELEMENT
public:
    explicit Timer(QObject *parent = nullptr);

    static TimerAttached *qmlAttachedProperties(QObject * object);

signals:

public slots:
};
QML_DECLARE_TYPEINFO(Timer,QML_HAS_ATTACHED_PROPERTIES)

#endif // TIMER_H

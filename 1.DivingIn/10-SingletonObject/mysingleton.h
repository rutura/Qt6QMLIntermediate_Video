#ifndef MYSINGLETON_H
#define MYSINGLETON_H

#include <QObject>
#include <QtQml>
#include <QDebug>

class MySingleton : public QObject
{
    Q_OBJECT
    /*
    QML_SINGLETON
    QML_ELEMENT
    */
public:
    explicit MySingleton(QObject *parent = nullptr);

    //Invokable methods
    Q_INVOKABLE void doSomething() const{
        qDebug() << "Doing something...";
    }

signals:
};

#endif // MYSINGLETON_H

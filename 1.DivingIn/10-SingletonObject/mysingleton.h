#ifndef MYSINGLETON_H
#define MYSINGLETON_H

#include <QObject>
#include <QtQml>
#include <QDebug>

class MySingleTon : public QObject
{
    Q_OBJECT
    //QML_SINGLETON
    //QML_ELEMENT
public:
    explicit MySingleTon(QObject *parent = nullptr);

    //Invokable methods and other fields
    Q_INVOKABLE void callDog()const{
        qDebug() <<  "Calling dog";
    }

signals:
};

#endif // MYSINGLETON_H

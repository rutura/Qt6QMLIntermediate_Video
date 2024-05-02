#include "qmljscaller.h"
#include <QVariant>
#include <QDebug>

QmlJSCaller::QmlJSCaller(QObject *parent)
    : QObject{parent}
{}

void QmlJSCaller::cppMethod(QString parameter)
{
    qDebug() << "This is C++ talking, calling QML Javascript function";
    callJSMethod(parameter);
}

void QmlJSCaller::setQmlRoostObject(QObject *value)
{
    qmlRootObject = value;
}

void QmlJSCaller::callJSMethod(QString param)
{
    QVariant returnedValue;
    QVariant cppParameter = QVariant::fromValue(param);

    QMetaObject::invokeMethod(qmlRootObject,"qmlJSFunction",
                              Q_RETURN_ARG(QVariant,returnedValue),
                              Q_ARG(QVariant,cppParameter));

    qDebug() << "C++ talking, done calling QML Javascript, the return value is :"
             << returnedValue.toString();
}

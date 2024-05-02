#ifndef QMLJSCALLER_H
#define QMLJSCALLER_H

#include <QObject>

class QmlJSCaller : public QObject
{
    Q_OBJECT
public:
    explicit QmlJSCaller(QObject *parent = nullptr);

    Q_INVOKABLE void cppMethod(QString parameter);

    void setQmlRoostObject(QObject * value);

signals:
private:
    void callJSMethod(QString param);
    QObject * qmlRootObject;
};

#endif // QMLJSCALLER_H

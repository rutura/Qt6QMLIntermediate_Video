#ifndef CPPCLASS_H
#define CPPCLASS_H

#include <QObject>
#include <QVariantList>
#include <QVariantMap>
#include <QVariantList>
#include <QtQml/qqmlregistration.h>

class CppClass : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    QML_SINGLETON
public:
    explicit CppClass(QObject *parent = nullptr);

    Q_INVOKABLE void passFromQmlToCpp(QVariantList list, QVariantMap map);
    Q_INVOKABLE QVariantList getVariantListFromCpp();
    Q_INVOKABLE QVariantMap getVariantMapFromCpp();

    void setQmlRootObject(QObject *value);

signals:

public slots:
    void triggerJSCall();

private:
    QObject * qmlRootObject;
};

#endif // CPPCLASS_H

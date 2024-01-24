#ifndef CPPCLASS_H
#define CPPCLASS_H

#include <QObject>
#include <QVector>
#include <QtQml/qqmlregistration.h>

class CppClass : public QObject
{
    Q_OBJECT
    QML_ELEMENT
public:
    explicit CppClass(QObject *parent = nullptr);


    Q_INVOKABLE void qmlArrayToCpp(QVector<QString> vector);

    Q_INVOKABLE QVector<QString> retrieveStrings();

signals:

public slots:

private :
    QVector<QString> mVector;
};

#endif // CPPCLASS_H

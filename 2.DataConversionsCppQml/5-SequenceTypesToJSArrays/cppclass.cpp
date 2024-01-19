#include <QDebug>
#include "cppclass.h"

CppClass::CppClass(QObject *parent) : QObject(parent)
{
    mVector.append("One");
    mVector.append("Two");
    mVector.append("Three");
    mVector.append("Four");
}

void CppClass::qmlArrayToCpp(QVector<QString> vector)
{
    foreach (QString string, vector) {
        qDebug() << string;
    }

}

QVector<QString> CppClass::retrieveStrings()
{
    return mVector;
}

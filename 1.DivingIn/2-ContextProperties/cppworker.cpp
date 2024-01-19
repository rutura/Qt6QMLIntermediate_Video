#include <QDebug>
#include "cppworker.h"

CppWorker::CppWorker(QObject *parent) : QObject(parent)
{

}

void CppWorker::regularMethod()
{
    qDebug() << "This is C++ talking, regularMethod called.";
}

QString CppWorker::regularMethodWithReturn(QString name, int age)
{
    return QString(name + ":"+ QString::number(age) + " years old");
}

void CppWorker::cppSlot()
{
    qDebug() << "This is C++ talking, cppSlot called.";
}

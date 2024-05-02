#ifndef CPPWORKER_H
#define CPPWORKER_H

#include <QObject>

class CppWorker : public QObject
{
    Q_OBJECT
public:
    explicit CppWorker(QObject *parent = nullptr);

    //Q_INVOKABLE
    Q_INVOKABLE void regularMethod();
    Q_INVOKABLE QString regularMethodWithReturn(QString name, int age);

public slots:
    void cppSlot();
};

#endif // CPPWORKER_H

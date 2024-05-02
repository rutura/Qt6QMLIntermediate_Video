#ifndef COUNTER_H
#define COUNTER_H

#include <QObject>
#include <QTimer>
#include <QtQml>
#include "counting.h"

class Counter : public QObject
{
    Q_OBJECT
    QML_ELEMENT

    Q_PROPERTY(int count READ count WRITE setCount NOTIFY countChanged)
    //Q_PROPERTY(bool up READ up WRITE setUp NOTIFY upChanged)
    Q_PROPERTY(Counting::CountDirection  counting READ counting WRITE setCounting NOTIFY countingChanged)
public:
    explicit Counter(QObject *parent = nullptr);

    int count() const;
    void setCount(int count);
    Counting::CountDirection counting() const;
    void setCounting(Counting::CountDirection counting);

    //Helper methods
    Q_INVOKABLE void start();
    Q_INVOKABLE void stop();

signals:
    void countChanged(int count);
    void upChanged(bool up);
    void countingChanged(Counting::CountDirection counting);

private :
    int m_count;
    QTimer * m_timer;
    Counting::CountDirection m_counting;
};

#endif // COUNTER_H

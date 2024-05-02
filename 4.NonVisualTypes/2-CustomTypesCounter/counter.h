#ifndef COUNTER_H
#define COUNTER_H

#include <QObject>
#include <QTimer>
#include <QtQml>

class Counter : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    Q_PROPERTY(int count READ count WRITE setCount NOTIFY countChanged)
    Q_PROPERTY(bool up READ up WRITE setUp NOTIFY upChanged)
public:
    explicit Counter(QObject *parent = nullptr);

    int count() const;
    void setCount(int newCount);

    bool up() const;
    void setUp(bool newUp);

    //Helper methods
    Q_INVOKABLE void start();
    Q_INVOKABLE void stop();

signals:
    void countChanged(int count);
    void upChanged(bool up);

private:
    int m_count;
    bool m_up;
    QTimer* m_timer;
};

#endif // COUNTER_H

#ifndef COUNTING_H
#define COUNTING_H

#include <QObject>
#include <QtQml>

class Counting : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    QML_UNCREATABLE("Can't do this")
public:
    enum CountDirection {
        UP,
        DOWN
    };

    Q_ENUM(CountDirection)

signals:

public slots:
private:
    explicit Counting(QObject *parent = nullptr);
};

#endif // COUNTING_H

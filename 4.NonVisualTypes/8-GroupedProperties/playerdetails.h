#ifndef PLAYERDETAILS_H
#define PLAYERDETAILS_H

#include <QObject>

class PlayerDetails : public QObject
{
    Q_OBJECT
public:
    explicit PlayerDetails(QObject *parent = nullptr);

    Q_PROPERTY(qreal height READ height WRITE setHeight NOTIFY heightChanged)
    Q_PROPERTY(qreal weight READ weight WRITE setWeight NOTIFY weightChanged)
    Q_PROPERTY(qreal speed READ speed WRITE setSpeed NOTIFY speedChanged)

    qreal height() const;
    qreal weight() const;
    qreal speed() const;
    void setHeight(qreal height);
    void setWeight(qreal weight);
    void setSpeed(qreal speed);

signals:

    void heightChanged(qreal height);

    void weightChanged(qreal weight);

    void speedChanged(qreal speed);


private:
    qreal m_height;

    qreal m_weight;

    qreal m_speed;
};

#endif // PLAYERDETAILS_H

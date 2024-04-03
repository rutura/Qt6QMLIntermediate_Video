#include "playerdetails.h"

PlayerDetails::PlayerDetails(QObject *parent) : QObject(parent)
{

}

qreal PlayerDetails::height() const
{
    return m_height;
}

qreal PlayerDetails::weight() const
{
    return m_weight;
}

qreal PlayerDetails::speed() const
{
    return m_speed;
}

void PlayerDetails::setHeight(qreal height)
{
    qWarning("Floating point comparison needs context sanity check");
    if (qFuzzyCompare(m_height, height))
        return;

    m_height = height;
    emit heightChanged(m_height);
}

void PlayerDetails::setWeight(qreal weight)
{
    qWarning("Floating point comparison needs context sanity check");
    if (qFuzzyCompare(m_weight, weight))
        return;

    m_weight = weight;
    emit weightChanged(m_weight);
}

void PlayerDetails::setSpeed(qreal speed)
{
    qWarning("Floating point comparison needs context sanity check");
    if (qFuzzyCompare(m_speed, speed))
        return;

    m_speed = speed;
    emit speedChanged(m_speed);
}

#include "randomnumber.h"
#include <QRandomGenerator>

RandomNumber::RandomNumber(QObject *parent) : QObject(parent),
    m_maxValue(100),
    m_timer(new QTimer(this))
{
    connect(m_timer,SIGNAL(timeout()),this,SLOT(updateProperty()));
    m_timer->start(500);
}

void RandomNumber::setTarget(const QQmlProperty &prop)
{
    m_targetProperty = prop;
}

int RandomNumber::maxValue() const
{
    return m_maxValue;
}

void RandomNumber::setMaxValue(int maxValue)
{
    if (m_maxValue == maxValue)
        return;

    m_maxValue = maxValue;
    emit maxValueChanged(m_maxValue);
}

void RandomNumber::updateProperty()
{
    m_targetProperty.write(QRandomGenerator::global()->bounded(m_maxValue));
}

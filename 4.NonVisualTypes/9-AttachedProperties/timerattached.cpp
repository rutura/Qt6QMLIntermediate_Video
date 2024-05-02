#include <QDebug>
#include "timerattached.h"

TimerAttached::TimerAttached(QObject *parent) : QObject(parent),
    m_timer(new QTimer(this)),
    m_interval(2000),
    m_running(false)
{
    qDebug() << "Creating the timer attached object";
    connect(m_timer,&QTimer::timeout,[=](){
        qDebug() << "Timeout for interval :" << m_interval;
        emit timerOut();

    });
}

int TimerAttached::interval() const
{
    return m_interval;
}

bool TimerAttached::running() const
{
    return m_running;
}

void TimerAttached::setInterval(int interval)
{
    if (m_interval == interval)
        return;

    m_interval = interval;
    emit intervalChanged(m_interval);
}

void TimerAttached::setRunning(bool running)
{
    if (m_running == running)
        return;

    m_running = running;
    if (!m_running){
        m_timer->stop();
    }else{
        m_timer->start(m_interval);
    }
    emit runningChanged(m_running);
}

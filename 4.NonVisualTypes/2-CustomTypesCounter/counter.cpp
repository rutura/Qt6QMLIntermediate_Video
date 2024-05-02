#include "counter.h"

Counter::Counter(QObject *parent)
    : QObject{parent},
    m_count(0),
    m_up(true),
    m_timer(new QTimer(this))
{
    qDebug() << "Created counter instance";
    m_timer->setInterval(1000);
    connect(m_timer,&QTimer::timeout, [=](){
        if(m_up){
            ++m_count;
        }else{
            --m_count;
        }
        emit countChanged(m_count);
    });
}

int Counter::count() const
{
    return m_count;
}

void Counter::setCount(int newCount)
{
    if (m_count == newCount)
        return;
    m_count = newCount;
    emit countChanged(m_count);
}

bool Counter::up() const
{
    return m_up;
}

void Counter::setUp(bool newUp)
{
    if (m_up == newUp)
        return;
    m_up = newUp;
    emit upChanged(m_up);
}

void Counter::start()
{
    m_timer->start();
}

void Counter::stop()
{
    m_timer->stop();
}

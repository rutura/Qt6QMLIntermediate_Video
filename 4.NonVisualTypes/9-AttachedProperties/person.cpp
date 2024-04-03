#include "person.h"

Person::Person(QObject *parent) : QObject(parent)
{

}

QString Person::name() const
{
    return m_name;
}

int Person::age() const
{
    return m_age;
}

void Person::setName(QString name)
{
    if (m_name == name)
        return;

    m_name = name;
    emit nameChanged(m_name);
}

void Person::setAge(int age)
{
    if (m_age == age)
        return;

    m_age = age;
    emit ageChanged(m_age);
}

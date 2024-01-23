#include "person.h"



QString Person::firstName() const
{
  return mFirstName;
}

QString Person::lastName() const
{
  return mLastName;
}

void Person::setFirstName(const QString &newFirstName)
{
  mFirstName = newFirstName;
}

void Person::setLastName(const QString &newLastName)
{
  mLastName = newLastName;
}

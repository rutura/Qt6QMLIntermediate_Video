#ifndef PERSON_H
#define PERSON_H

#include <QObject>
#include <QQmlEngine>
#include <QtQml/qqmlregistration.h>

class Person
{
  Q_GADGET
  Q_PROPERTY(QString firstName READ firstName WRITE setFirstName)
  Q_PROPERTY(QString lastName READ lastName WRITE setLastName)
  QML_VALUE_TYPE(person)
public:
  Person() = default;
  ~Person() = default;
  QString firstName() const;
  QString lastName() const;

  void setFirstName(const QString& newFirstName);
  void setLastName(const QString& newLastName);
private:
  QString mFirstName{"Amilie"};
  QString mLastName{"John"};
};
#endif// PERSON_H

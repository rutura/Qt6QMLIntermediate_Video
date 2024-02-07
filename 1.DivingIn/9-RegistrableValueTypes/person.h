#ifndef PERSON_H
#define PERSON_H

#include <QObject>
#include <QQmlEngine>
#include <QtQml/qqmlregistration.h>

// Person value type should not have signals
// For further rules on Value types: https://doc.qt.io/qt-6/qtqml-cppintegration-definetypes.html
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

Q_DECLARE_METATYPE(Person)

/*
 * Note-
 Since Person is not of QObject, it not an object type hence cannot be accessed directly from QML
- To access it in qml, you can use signals or slots from Object types such as this PersonModule
 */
class PersonModule : public QObject
{
  Q_OBJECT
  QML_ELEMENT
  QML_SINGLETON
public:
  explicit PersonModule(QObject *parent = nullptr): QObject{ parent } {}
public slots:
  Person providePerson(){
    return Person();
  }
  void usePerson(const Person& person){
    // TODO - Overload operator<< in class Person
    qDebug() << "{ " << person.firstName() << ", " << person.lastName() << "}";
  }
};


#endif// PERSON_H

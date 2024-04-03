#ifndef PERSON_H
#define PERSON_H

#include <QObject>
#include <QtQml>

class Person : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    Q_PROPERTY(QString  name READ name WRITE setName NOTIFY nameChanged)
    Q_PROPERTY(int age READ age WRITE setAge NOTIFY ageChanged)

public:
    explicit Person(QObject *parent = nullptr);

    QString name() const;
    int age() const;
    void setName(QString name);
    void setAge(int age);

signals:

    void nameChanged(QString name);
    void ageChanged(int age);

private :
    QString m_name;

    int m_age;
};

#endif // PERSON_H

#ifndef RANDOMNUMBER_H
#define RANDOMNUMBER_H

#include <QObject>
#include <QQmlPropertyValueSource>
#include <QQmlProperty>
#include <QTimer>
#include <qqml.h>

class RandomNumber : public QObject,public QQmlPropertyValueSource
{
    Q_OBJECT
    QML_ELEMENT
    Q_PROPERTY(int  maxValue READ maxValue WRITE setMaxValue NOTIFY maxValueChanged)
    Q_INTERFACES(QQmlPropertyValueSource)
public:
    explicit RandomNumber(QObject *parent = nullptr);
    virtual void setTarget(const QQmlProperty & prop);
    int maxValue() const;
    void setMaxValue(int maxValue);

signals:
    void maxValueChanged(int maxValue);

private slots :
    void updateProperty();

private:
    QQmlProperty m_targetProperty;
    int m_maxValue;
    QTimer * m_timer;
};

#endif // RANDOMNUMBER_H

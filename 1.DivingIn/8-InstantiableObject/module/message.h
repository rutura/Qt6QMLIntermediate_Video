#ifndef MESSAGE_H
#define MESSAGE_H

#include <QObject>
#include <QQmlEngine>
#include <QtQml/qqmlregistration.h>

class Message : public QObject
{
  Q_OBJECT
  Q_PROPERTY(QString author READ author WRITE setAuthor NOTIFY authorChanged)
  Q_PROPERTY(QDateTime creationDate READ creationDate WRITE setCreationDate NOTIFY creationDateChanged)
  QML_ELEMENT
  // QML_UNCREATABLE("Type is rendered uncreatable with QML_UNCREATABLE") // render this type uncreatable with this line
public:
  explicit Message(QObject *parent = nullptr);
  QString author() const;
  void setAuthor(QString newAuthor);
  void setCreationDate(QDateTime newDatetime);
  QDateTime creationDate() const;
signals:
  void authorChanged(QString newAuthor);
  void creationDateChanged(QDateTime newDateTime);
private:

  QString mAuthor{};
  QDateTime mCreationDate{};
};

#endif// MESSAGE_H

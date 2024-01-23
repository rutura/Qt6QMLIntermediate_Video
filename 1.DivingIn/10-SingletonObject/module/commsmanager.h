#ifndef COMMSMANAGER_H
#define COMMSMANAGER_H

#include <QObject>
#include <QQmlEngine>

class CommsManager : public QObject
{
  Q_OBJECT
  QML_ELEMENT
  Q_PROPERTY(bool open READ open WRITE setOpen NOTIFY openChanged FINAL)
  QML_SINGLETON //this macro renders this object uncreatable in qml to avoid creating instances in multiple QML enginees
public:
  explicit CommsManager(QObject *parent = nullptr);

  bool open() const;
  void setOpen(const bool& openState);
signals:
  void openChanged();

private:
  bool mIsOpen{false};
};

#endif// COMMSMANAGER_H

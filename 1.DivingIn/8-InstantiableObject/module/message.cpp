#include "message.h"

Message::Message(QObject *parent) : QObject{ parent } {}

QString Message::author() const
{
  return mAuthor;
}

void Message::setAuthor(QString newAuthor)
{
  // if(mAuthor == newAuthor)
  //   return;
  mAuthor = newAuthor;
  emit authorChanged(mAuthor);
}

void Message::setCreationDate(QDateTime newDatetime)
{
  // if(mCreationDate == newDatetime)
  //   return;
  mCreationDate = newDatetime;
  emit creationDateChanged(mCreationDate);
}

QDateTime Message::creationDate() const
{
  return mCreationDate;
}

#include "commsmanager.h"

CommsManager::CommsManager(QObject *parent) : QObject{ parent } {}

bool CommsManager::open() const
{
  return mIsOpen;
}

void CommsManager::setOpen(const bool &openState)
{
  if(mIsOpen == openState)return;

  mIsOpen = openState;
  emit openChanged();
}

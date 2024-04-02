#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "mysingleton.h"


int main(int argc, char *argv[])
{
  QGuiApplication app(argc, argv);

  QQmlApplicationEngine engine;

  MySingleTon * singleton = new MySingleTon(&app);
  qmlRegisterSingletonInstance("com.blikoon.Singletons", 1, 0, "MySingleTon", singleton);

  const QUrl url(u"qrc:/SingletonObject/Main.qml"_qs);
  QObject::connect(
    &engine,
    &QQmlApplicationEngine::objectCreationFailed,
    &app,
    []() { QCoreApplication::exit(-1); },
    Qt::QueuedConnection);
  engine.load(url);

  return app.exec();
}

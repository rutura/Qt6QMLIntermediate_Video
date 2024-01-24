#include "cppworker.h"
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>


int main(int argc, char *argv[])
{
  QGuiApplication app(argc, argv);

  CppWorker worker;

  QQmlApplicationEngine engine;

  engine.rootContext()->setContextProperty("BWorker", &worker);

  const QUrl url(u"qrc:/2-ContextProperties/main.qml"_qs);
  QObject::connect(
    &engine,
    &QQmlApplicationEngine::objectCreated,
    &app,
    [url](QObject *obj, const QUrl &objUrl) {
      if (!obj && url == objUrl) QCoreApplication::exit(-1);
    },
    Qt::QueuedConnection);
  engine.load(url);

  return app.exec();
}

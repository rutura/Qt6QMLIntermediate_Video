#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "mysingleton.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    MySingleton* singleton = new MySingleton(&app);
    qmlRegisterSingletonInstance("guide.learnqt.Singletons",1,0,"MySingleton",singleton);

    QQmlApplicationEngine engine;
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

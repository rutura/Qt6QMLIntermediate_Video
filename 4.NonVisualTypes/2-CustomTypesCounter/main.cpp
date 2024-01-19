#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "counter.h"


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    qmlRegisterType<Counter>("com.blikoon.counter",1,0,"Counter");

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/2-CustomTypesCounter/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}

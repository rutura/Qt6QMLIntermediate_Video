#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "counting.h"
#include "counter.h"


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    qmlRegisterType<Counter>("com.blikoon.counter",1,0,"Counter");
    qmlRegisterUncreatableType<Counting>("com.blikoon.counter",1,0,"Counting",
                                         "Can not instantiate Counting from QML.Not Allowed.");

    const QUrl url(u"qrc:/4-CounterEnumVersion/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}

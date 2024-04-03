#include <QGuiApplication>
#include <QQmlApplicationEngine>
//#include "timerattached.h"
//#include "timer.h"
//#include "person.h"


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    //qmlRegisterUncreatableType<TimerAttached>("com.blikoon.Football", 1,0, "TimerAttached",
    //                               "Can not create TimerAttached in QML.Not allowed.");
    //qmlRegisterType<Timer>("Timing",1,0,"Timer");
    //qmlRegisterType<Person>("People", 1,0, "Person");

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/AttachedProperties/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}

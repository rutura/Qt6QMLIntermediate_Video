#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "errorlevel.h"


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    qmlRegisterUncreatableType<ErrorLevel>("com.blikoon.errorlevel",1,0,"ErrorLevel",
                                              "Can not create ErrorLevel type in QML. Not allowed.");

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/Enums/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}

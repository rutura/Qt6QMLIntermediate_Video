#include <QGuiApplication>
#include <QQmlContext>
#include <QQmlApplicationEngine>
#include "cppsignalsender.h"


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;


    CppSignalSender sender;


    engine.rootContext()->setContextProperty("CppSignalSender",&sender);

    const QUrl url(u"qrc:/4-CppSignal/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "cppsignalsender.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    CppSignalSender sender;
    engine.rootContext()->setContextProperty("CppSignalSender",&sender);

    const QUrl url(u"qrc:/CppSignal/Main.qml"_qs);
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}

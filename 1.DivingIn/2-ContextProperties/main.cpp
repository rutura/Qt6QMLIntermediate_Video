#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "cppworker.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    //Create the object on the C++ side
    CppWorker cppworker;

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("BWorker",&cppworker);
    const QUrl url(u"qrc:/ContextProperties/Main.qml"_qs);
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "qmljscaller.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    QmlJSCaller caller;
    engine.rootContext()->setContextProperty("QmlJsCaller",&caller);
    const QUrl url(u"qrc:/CallJsFromCpp/Main.qml"_qs);
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    auto rootObjects = engine.rootObjects();

    if(engine.rootObjects().isEmpty()){
        return -1 ;
    }else{
        caller.setQmlRoostObject(rootObjects[0]);
    }

    return app.exec();
}

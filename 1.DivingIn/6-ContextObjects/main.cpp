#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "propertywrapper.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;


    /*
    QString lastName = "Doe";
    QString firstName = "John";

    engine.rootContext()->setContextProperty("lastname",QVariant::fromValue(lastName));
    engine.rootContext()->setContextProperty("firstname",QVariant::fromValue(firstName));
    */

    PropertyWrapper wrapper;
    wrapper.setLastname("Doe");
    wrapper.setFirstname("John");
    engine.rootContext()->setContextObject(&wrapper);

    const QUrl url(u"qrc:/ContextObjects/Main.qml"_qs);
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}

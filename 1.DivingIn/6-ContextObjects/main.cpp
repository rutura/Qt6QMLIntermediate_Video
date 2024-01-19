#include <QGuiApplication>
#include <QQmlContext>
#include <QQmlApplicationEngine>
#include "propertywrapper.h"


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    /*
    QString lastName = "Doe";
    QString firstName = "John";
    */

    PropertyWrapper propWrapper;
    propWrapper.setLastname("Doe");
    propWrapper.setFirstname("John");


    /*
    engine.rootContext()->setContextProperty("mLastname",QVariant::fromValue(lastName));
    engine.rootContext()->setContextProperty("mFirstname",QVariant::fromValue(firstName));
    */
    engine.rootContext()->setContextObject(&propWrapper);


    const QUrl url(u"qrc:/6-ContextObjects/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}

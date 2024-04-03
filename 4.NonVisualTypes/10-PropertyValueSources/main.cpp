#include <QGuiApplication>
#include <QQmlApplicationEngine>
//#include "randomnumber.h"


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    //qmlRegisterType<RandomNumber>("RandomUtil",1,0,"RandomNumber");

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/PropertyValueSources/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}

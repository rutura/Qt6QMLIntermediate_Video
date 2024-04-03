#include <QGuiApplication>
#include <QQmlContext>
#include <QQmlApplicationEngine>
//#include "player.h"
//#include "footballteam.h"


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    //Register Types
    //qmlRegisterType<Player>("com.blikoon.Football", 1,0, "Player");
   // qmlRegisterType<FootBallTeam>("com.blikoon.Football", 1,0, "FootBallTeam");

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/ObjectAndListProperties/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}

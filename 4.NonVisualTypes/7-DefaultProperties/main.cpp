#include <QGuiApplication>
#include <QQmlApplicationEngine>
//#include "player.h"
//#include "striker.h"
//#include "defender.h"
//#include "footballteam.h"


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    //Register Types
    //qmlRegisterUncreatableType<Player>("com.blikoon.Football", 1,0, "Player",
    //                                   "Can not create Player in QML.Not allowed.");

    //qmlRegisterType<Striker>("com.blikoon.Football", 1,0, "Striker");
    //qmlRegisterType<Defender>("com.blikoon.Football", 1,0, "Defender");
    //qmlRegisterType<FootBallTeam>("com.blikoon.Football", 1,0, "FootBallTeam");

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/DefaultProperties/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}

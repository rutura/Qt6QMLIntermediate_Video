#include <QGuiApplication>
#include <QQmlContext>
#include <QQmlApplicationEngine>
#include "movie.h"


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    Movie movie;
    movie.setTitle("Titanic");
    movie.setMainCharacter("Leonardo D");

    engine.rootContext()->setContextProperty("Movie",&movie);

    const QUrl url(u"qrc:/5-QPROPERTYMapping/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);



    return app.exec();
}

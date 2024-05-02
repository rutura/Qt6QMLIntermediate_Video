#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "movie.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    Movie movie;
    movie.setTitle("Titanic");
    movie.setMainCharacter("Leonardo D");

    engine.rootContext()->setContextProperty("Movie",&movie);

    const QUrl url(u"qrc:/QPROPERTYMapping/Main.qml"_qs);
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}

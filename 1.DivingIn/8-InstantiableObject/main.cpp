#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "movie.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    qmlRegisterType<Movie>("guide.learnqt.movie",1,0,"Movie");

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/InstantiableObject/Main.qml"_qs);
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}

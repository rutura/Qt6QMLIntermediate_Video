#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "errorlevel.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    qmlRegisterUncreatableType<ErrorLevel>("guide.learnqt.errorlevel",1,0,"ErrorLevel",
                                           "Can not create ErrorLevel type in QML. Not allowed.");

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/Enums/Main.qml"_qs);
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}

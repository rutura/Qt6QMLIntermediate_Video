#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "cppclass.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    CppClass cppclass;
    engine.rootContext()->setContextProperty("CppClass",&cppclass);
    const QUrl url(u"qrc:/VariantListVariantMap/Main.qml"_qs);
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    if(engine.rootObjects().isEmpty()){
        return -1;
    }else{
        cppclass.setQmlRootObject(engine.rootObjects().first());
    }

    return app.exec();
}

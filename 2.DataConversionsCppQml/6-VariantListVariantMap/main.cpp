#include <QGuiApplication>
#include <QQmlContext>
#include <QQmlApplicationEngine>
#include "cppclass.h"


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    CppClass cppClass;
    engine.rootContext()->setContextProperty("CppClass",&cppClass);

    const QUrl url(u"qrc:/6-VariantListVariantMap/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    if (engine.rootObjects().isEmpty()){
         return -1;
    }else{
        cppClass.setQmlRootObject(engine.rootObjects().first());
    }

    return app.exec();
}

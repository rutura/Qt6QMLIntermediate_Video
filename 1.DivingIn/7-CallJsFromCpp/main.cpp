#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "qmljscaller.h"


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    QmlJSCaller jsCaller;

    engine.rootContext()->setContextProperty("QmlJsCaller",&jsCaller);

    const QUrl url(u"qrc:/7-CallJsFromCpp/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    auto rootObjcts = engine.rootObjects();

    if (engine.rootObjects().isEmpty()){
       return -1;
    }else{
        //--!!!!!!!Should make sure this is SET !!!!!!!!!!!!!!--
        jsCaller.setQmlRootObject(rootObjcts[0]);
    }

    return app.exec();
}

#include <QNetworkRequest>
#include <QQmlContext>
#include <QJsonDocument>
#include <QJsonArray>
#include <QJsonObject>
#include <QRestReply>
#include <QDebug>
#include "appwrapper.h"

AppWrapper::AppWrapper(QObject* parent) : QObject(parent),
    m_rest_access_manager(std::make_unique<QRestAccessManager>(&net_manager)),
    m_factory(std::make_unique<QNetworkRequestFactory>())
{
    //Setting the base url here makes it a bit more explicit. But you can also set it up in the constructor of the factory.
    m_factory->setBaseUrl(QUrl("https://jsonplaceholder.typicode.com"));
}

AppWrapper::~AppWrapper()
{
}

void AppWrapper::fetchPosts()
{
    //Set up a GET request
    m_rest_access_manager->get(m_factory->createRequest("/posts"),this, [this](QRestReply &reply) {
        if(reply.isSuccess()){
            //Turn the data into a json document
             auto doc = reply.readJson();

            //Turn document into json array: Have to read the value from an std::optional object returned from doc.
             QJsonArray array = doc.value().array();

            for ( int i = 0; i < array.size(); i++)
            {
                QJsonObject object = array.at(i).toObject();
                QVariantMap map = object.toVariantMap();
                QString title = map["title"].toString();
                mPosts.append(title);
            }

            if(array.size() !=0){
                resetModel();
            }
        }
    });
}

void AppWrapper::removeLast()
{
    if ( !mPosts.isEmpty()){
        mPosts.removeLast();
        resetModel();
    }
}

bool AppWrapper::initialize(QGuiApplication * app)
{
    mEngine.rootContext()->setContextProperty("Wrapper",this);
    resetModel();

    const QUrl url(u"qrc:/RestFactory/Main.qml"_qs);

    QObject::connect(&mEngine, &QQmlApplicationEngine::objectCreated,
                     app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    mEngine.load(url);
    if (mEngine.rootObjects().isEmpty()){
        return false;
    }else{
        return true;
    }
}

void AppWrapper::resetModel()
{
    mEngine.rootContext()->setContextProperty("myModel",QVariant::fromValue(mPosts));
}

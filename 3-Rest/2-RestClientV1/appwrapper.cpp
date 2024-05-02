#include <QNetworkRequest>
#include <QQmlContext>
#include <QJsonDocument>
#include <QJsonArray>
#include <QJsonObject>
#include <QDebug>
#include "appwrapper.h"



AppWrapper::AppWrapper(QObject* parent) : QObject(parent),
    mNetManager(std::make_unique<QNetworkAccessManager>()) // Use make_unique
{
}

AppWrapper::~AppWrapper()
{
}

void AppWrapper::fetchPosts()
{
    //Initialize our API data
    const QUrl API_ENDPOINT("https://jsonplaceholder.typicode.com/posts");

    QNetworkRequest request;
    request.setUrl(API_ENDPOINT);

    mNetReply = mNetManager->get(request);
    connect(mNetReply,&QIODevice::readyRead,this,&AppWrapper::dataReadyRead);
    connect(mNetReply,&QNetworkReply::finished,this,&AppWrapper::dataReadFinished);
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

    const QUrl url(u"qrc:/RestClientV1/Main.qml"_qs);
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

void AppWrapper::dataReadyRead()
{
    mDataBuffer.append(mNetReply->readAll());
}

void AppWrapper::dataReadFinished()
{
    //Parse the JSON
    if( mNetReply->error())
         {
             qDebug() << "Error : " << mNetReply->errorString();
         }else
         {
            //qDebug() << "Data fetch finished : " << QString(*mDataBuffer);

            //Turn the data into a json document
            QJsonDocument doc = QJsonDocument::fromJson(mDataBuffer);

            /*
            //What if you get an object from the server
            QJsonDocument objectDoc = QJsonDocument::fromJson(*mDataBuffer);
            QJsonObject obObject = objectDoc.toVariant().toJsonObject();
            */

            //Turn document into json array
            QJsonArray array = doc.array();
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
            //Clear the buffer
            mDataBuffer.clear();
         }
}

void AppWrapper::resetModel()
{
    mEngine.rootContext()->setContextProperty("myModel",QVariant::fromValue(mPosts));
}

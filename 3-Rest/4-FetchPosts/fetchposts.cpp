#include <QJsonArray>
#include <QRestReply>
#include <QJsonDocument>
#include <QJsonObject>
#include "fetchposts.h"

FetchPosts::FetchPosts(QObject *parent)
    : QObject{parent},
    m_factory(std::make_unique<QNetworkRequestFactory>()),
    m_rest_manager(std::make_unique<QRestAccessManager>(&net_manager))
{
    m_factory->setBaseUrl(QUrl("https://jsonplaceholder.typicode.com"));

}

void FetchPosts::fetchPosts()
{
    //Set up a GET request
    m_rest_manager->get(m_factory->createRequest("/posts"),this, [this](QRestReply &reply) {
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
                m_posts.append(title);
            }

            if(array.size() !=0){
                emit postsChanged();
            }
        }
    });
}

void FetchPosts::removeLast()
{
    if ( !m_posts.isEmpty()){
        m_posts.removeLast();
        emit postsChanged();
    }
}

QStringList FetchPosts::posts() const
{
    return m_posts;
}

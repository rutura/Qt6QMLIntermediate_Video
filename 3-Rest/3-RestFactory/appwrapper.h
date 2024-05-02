#ifndef APPWRAPPER_H
#define APPWRAPPER_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>
#include <QQmlApplicationEngine>
#include <QGuiApplication>
#include <memory>
#include <qnetworkrequestfactory.h>
#include <qrestaccessmanager.h>


class AppWrapper : public QObject
{
    Q_OBJECT
public:
    explicit AppWrapper(QObject *parent = nullptr);
    ~AppWrapper();
    Q_INVOKABLE void fetchPosts();
    Q_INVOKABLE void removeLast();
    bool initialize( QGuiApplication * app);

private:
    void resetModel () ;
    QNetworkAccessManager net_manager;
    std::unique_ptr<QNetworkRequestFactory> m_factory;
    std::unique_ptr<QRestAccessManager> m_rest_access_manager;
    QStringList mPosts;
    QQmlApplicationEngine mEngine;
};

#endif // APPWRAPPER_H

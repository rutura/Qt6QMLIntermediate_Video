#ifndef APPWRAPPER_H
#define APPWRAPPER_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>
#include <QQmlApplicationEngine>
#include <QGuiApplication>
#include <memory>


class AppWrapper : public QObject
{
    Q_OBJECT
public:
    explicit AppWrapper(QObject *parent = nullptr);
    ~AppWrapper();

    Q_INVOKABLE void fetchPosts();

    Q_INVOKABLE void removeLast();

    bool initialize( QGuiApplication * app);

private slots:
    void dataReadyRead();
    void dataReadFinished();

private:

    void resetModel () ;

    //QNetworkAccessManager * mNetManager;
    std::unique_ptr<QNetworkAccessManager> mNetManager; // Use unique_ptr for ownership

    QNetworkReply* mNetReply; // No need for a raw pointer
    QByteArray mDataBuffer;

    //QNetworkReply * mNetReply;
    //QByteArray * mDataBuffer;
    QStringList mPosts;
    QQmlApplicationEngine mEngine;
};

#endif // APPWRAPPER_H

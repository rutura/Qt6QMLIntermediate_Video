#ifndef FETCHPOSTS_H
#define FETCHPOSTS_H

#include <QObject>
#include <QQmlEngine>
#include <QNetworkRequestFactory>
#include <qrestaccessmanager.h>
#include <memory>

class FetchPosts : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QStringList posts READ posts NOTIFY postsChanged FINAL)
    QML_ELEMENT
public:
    explicit FetchPosts(QObject *parent = nullptr);

    QStringList posts() const;

public slots:
    void fetchPosts();
    void removeLast();

signals:
    void postsChanged();

private:
    QNetworkAccessManager net_manager;
    std::unique_ptr<QNetworkRequestFactory> m_factory;
    std::unique_ptr<QRestAccessManager> m_rest_manager;
    QStringList m_posts;
};

#endif // FETCHPOSTS_H

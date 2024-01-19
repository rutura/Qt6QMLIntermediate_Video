#ifndef CPPCLASS_H
#define CPPCLASS_H

#include <QObject>
#include <QUrl>
#include <QColor>
#include <QFont>
#include <QDate>
#include <QPoint>
#include <QPointF>
#include <QSize>
#include <QSizeF>
#include <QRect>
#include <QRectF>

class CppClass : public QObject
{
    Q_OBJECT
public:
    explicit CppClass(QObject *parent = nullptr);

signals:
    void sendInt(int param);
    void sendDouble(double doubleParam);
    void sendBoolRealFloat(bool boolparam, qreal realparam, float floatparam );

    void sendStringUrl(QString stringparam, QUrl urlparam);
    void sendColorFont(QColor colorparam,QFont fontparam);
    void sendDate( QDate dateparam);
    void sendPoint( QPoint pointparam, QPointF pointfparam);
    void sendSize( QSize sizeparam , QSizeF sizefparam);
    void sendRect( QRect rectparam, QRectF rectfparam);


public slots:
    void cppSlot();

    void receivePoint(QPoint point);
    void receiveRect(QRectF rect);


};

#endif // CPPCLASS_H

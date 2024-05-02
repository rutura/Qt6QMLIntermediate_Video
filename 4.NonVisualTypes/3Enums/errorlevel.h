#ifndef ERRORLEVEL_H
#define ERRORLEVEL_H

#include <QObject>


// class ErrorLevel : public QObject
class ErrorLevel
{
    //Q_OBJECT
    Q_GADGET
public:
    //explicit ErrorLevel(QObject *parent = nullptr);
    explicit ErrorLevel();

     enum ErrorValue{
        INFORAMATION,
        WARNING,
        DEBUG,
        MESSAGE
    };

    Q_ENUM(ErrorValue)

//signals:
};

#endif // ERRORLEVEL_H

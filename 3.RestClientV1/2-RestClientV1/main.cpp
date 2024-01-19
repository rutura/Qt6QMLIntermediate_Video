#include <QGuiApplication>
#include "appwrapper.h"


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    AppWrapper wrapper;

       if ( !wrapper.initialize(&app))
           return -1;
    return app.exec();
}

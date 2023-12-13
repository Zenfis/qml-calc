#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "CalcLogic.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    qmlRegisterType<CalcLogic>( "CalcLogic", 1, 0, "CalcLogic" );

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/qml_calc/Main.qml"_qs);
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}

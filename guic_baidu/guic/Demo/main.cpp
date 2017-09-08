#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "activitymanager.h"
#include "activityLauncher.h"
//#include "activityKeyboard.h"
//#include "activityButton.h"

#include <QQuickItem>
#include <QQmlApplicationEngine>
#include <QQmlEngine>
#include <QQuickView>
#include <QQmlContext>
#include <QDebug>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    //qmlRegisterType<VirtualKeyboard>("IVISuiteAL.GUI", 1, 0, "VK");

    QQuickView window;
    window.setHeight(720);
    window.setWidth(1280);

    window.setMinimumHeight(720);
    window.setMinimumWidth(1280);

    window.setMaximumHeight(720);
    window.setMaximumWidth(1280);

    window.setObjectName("MainWindow");
    window.show();


//    ActivityManager::instance()->setHeader(new ActivityLauncher);
    ActivityManager::instance()->setLauncher(new ActivityLauncher);
//    ActivityManager::instance()->setLauncher(new ActivityButton);
//    ActivityManager::instance()->setKeyboard(new ActivityKeyboard);
    ActivityManager::instance()->setState(ActivityManager::eState_Launcher);
    ActivityManager::instance()->startActivityForLauncher();
    //ActivityManager::instance()->startActivity<ActivityLauncher>();

    return app.exec();
}

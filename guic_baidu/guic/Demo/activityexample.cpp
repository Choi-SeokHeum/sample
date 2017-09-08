#include "activityexample.h"
#include "activityLauncher.h"
#include "activitymanager.h"

ActivityExample::ActivityExample(Activity *parent)
    :Activity(QUrl("qrc:/FocusButton.qml"),parent)
{
    qDebug()<<"aaaaaa";
    setObjectName("ActivityExample");
}

ActivityExample::~ActivityExample()
{

}

void ActivityExample::onCreated()
{
    Activity::onCreated();

    QQuickItem* mBackButton = this->findChild<QQuickItem*>("textBtn");
    connect(mBackButton,SIGNAL(clicked()),this,SLOT(backButton()));
}

void ActivityExample::onStarted()
{
    Activity::onStarted();
}

void ActivityExample::onResumed()
{
    Activity::onResumed();
}

void ActivityExample::onPaused()
{
    Activity::onPaused();
}

void ActivityExample::backButton()
{
    qDebug() << Q_FUNC_INFO;
    ActivityManager::instance()->startActivity<ActivityLauncher>("ActivityLauncher", "", ActivityManager::eFlagActivity_Clear_All);
}

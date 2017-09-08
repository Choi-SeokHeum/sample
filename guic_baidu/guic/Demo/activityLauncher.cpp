#include "activitymanager.h"
#include "activityLauncher.h"
#include "activitylist.h"
#include "guicdefine.h"
#include "activityexample.h"


ActivityLauncher::ActivityLauncher(Activity *parent)
    : Activity(QUrl("qrc:/LayoutLauncher.qml"), parent)
{
    setObjectName("ActivityLauncher");
}

ActivityLauncher::~ActivityLauncher()
{

}

void ActivityLauncher::onCreated()
{
    Activity::onCreated();

    QQuickItem* mLauncher = this->findChild<QQuickItem*>("LayoutLauncher");

    if (mLauncher != Q_NULLPTR)
    {
        connect(mLauncher, SIGNAL(clicked(int)), this, SLOT(onClicked(int)), Qt::UniqueConnection);
    }
}

void ActivityLauncher::onStarted()
{
    Activity::onStarted();
}

void ActivityLauncher::onResumed()
{
    setEnabled(true);
    setOpacity(1);
}

void ActivityLauncher::onPaused()
{
    setEnabled(false);
    setOpacity(0);

    QQuickItem* mLauncher = this->findChild<QQuickItem*>("LayoutLauncher");

    if (mLauncher != Q_NULLPTR)
    {
        disconnect(mLauncher, SIGNAL(clicked(int)), this, SLOT(onClicked(int)));
    }
}

void ActivityLauncher::onClicked(int index)
{
    qDebug() << Q_FUNC_INFO;
    qDebug() << index;

    switch (index) {
    case GUICDefine::ACTIVITY_LIST:
        ActivityManager::instance()->startActivity<ActivityList>("ActivityList", "", ActivityManager::eFlagActivity_Clear_All);
        break;
    case GUICDefine::ACTIVITY_FOCUSBUTTON:
        qDebug()<<"zzzzzzzzzzz";
        ActivityManager::instance()->startActivity<ActivityExample>("ActivityExample","",ActivityManager::eFlagActivity_Clear_All);
    default:
        break;
    }
//    ActivityManager::instance()->
    //            startActivity<ActivityVKTest>("ActivityVKTest", "intent");
}

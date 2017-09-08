#include "activitymanager.h"
#include "activity.h"
#include <QQuickView>
#include <QGuiApplication>
#include <QQuickItem>
#include <QParallelAnimationGroup>
#include <QPropertyAnimation>

static QSharedPointer<ActivityManager> activityManagerSingleton;

static int g_duration = 150;
//static int g_animatioinCount = 0;

const QSharedPointer<ActivityManager> ActivityManager::instance(QObject *parent)
{
    if (!activityManagerSingleton)
    {
        activityManagerSingleton = QSharedPointer<ActivityManager>(new ActivityManager(parent));
        activityManagerSingleton->createLayers();
    }
    return activityManagerSingleton.constCast<ActivityManager>();
}

ActivityManager::~ActivityManager()
{

}

void ActivityManager::setState(eState state)
{
    m_state = state;
}


void ActivityManager::startActivityForSplash()
{
    m_state = eState_Splash;

    if (m_splash)
    {
        if (m_splash->m_lifeCycle == Activity::eLifeCycle_onCreated)
            m_splash->onStarted();

        m_splash->onResumed();

        m_splash->setVisible(true);
    }

    if (m_launcher)
    {
        if (m_launcher->m_lifeCycle != Activity::eLifeCycle_onStoped)
            m_launcher->onStoped();

        m_launcher->setVisible(false);
    }

    if (m_keyboard)
    {
        if (m_keyboard->m_lifeCycle != Activity::eLifeCycle_onStoped)
            m_keyboard->onStoped();

        m_keyboard->setVisible(false);
    }

    if (m_header)
    {
        if (m_header->m_lifeCycle != Activity::eLifeCycle_onStoped)
            m_header->onStoped();

        m_header->setVisible(false);
    }

    if (m_footer)
    {
        if (m_footer->m_lifeCycle != Activity::eLifeCycle_onStoped)
            m_footer->onStoped();

        m_footer->setVisible(false);
    }

    if (m_toast)
    {
        if (m_toast->m_lifeCycle != Activity::eLifeCycle_onStoped)
            m_toast->onStoped();

        m_toast->setVisible(false);
    }

    clearAllPopup();

    if (m_notification)
    {
        if (m_notification->m_lifeCycle != Activity::eLifeCycle_onStoped)
            m_notification->onStoped();

        m_notification->setVisible(false);
    }

    if (m_disclaimer)
    {
        if (m_disclaimer->m_lifeCycle != Activity::eLifeCycle_onStoped)
            m_disclaimer->onStoped();

        m_disclaimer->setVisible(false);
    }

    clearAllApplication();
}

void ActivityManager::startActivityForDisclaimer()
{
    m_state = eState_Disclaimer;

    if (m_splash)
    {
        if (m_splash->m_lifeCycle != Activity::eLifeCycle_onStoped)
            m_splash->onStoped();

        m_splash->setVisible(false);
    }

    if (m_launcher)
    {
        if (m_launcher->m_lifeCycle != Activity::eLifeCycle_onStoped)
            m_launcher->onStoped();

        m_launcher->setVisible(false);
    }

    if (m_keyboard)
    {
        if (m_keyboard->m_lifeCycle != Activity::eLifeCycle_onStoped)
            m_keyboard->onStoped();

        m_keyboard->setVisible(false);
    }

    if (m_header)
    {
        if (m_header->m_lifeCycle != Activity::eLifeCycle_onStoped)
            m_header->onStoped();

        m_header->setVisible(false);
    }

    if (m_footer)
    {
        if (m_footer->m_lifeCycle != Activity::eLifeCycle_onStoped)
            m_footer->onStoped();

        m_footer->setVisible(false);
    }

    if (m_toast)
    {
        if (m_toast->m_lifeCycle != Activity::eLifeCycle_onStoped)
            m_toast->onStoped();

        m_toast->setVisible(false);
    }

    clearAllPopup();

    if (m_notification)
    {
        if (m_notification->m_lifeCycle == Activity::eLifeCycle_onCreated)
            m_notification->onStarted();

        m_notification->onResumed();

        m_notification->setVisible(true);
    }

    if (m_disclaimer)
    {
        if (m_disclaimer->m_lifeCycle == Activity::eLifeCycle_onCreated)
            m_disclaimer->onStarted();

        m_disclaimer->onResumed();

        m_disclaimer->setVisible(true);
    }

    clearAllApplication();
}

void ActivityManager::startActivityForLauncher()
{
    if ( m_state == eState_Launcher || m_state == eState_Application )
    {
        m_state = eState_Launcher;

        if (m_splash)
        {
            if (m_splash->m_lifeCycle != Activity::eLifeCycle_onStoped)
                m_splash->onStoped();

            m_splash->setVisible(false);
        }

        if (m_launcher)
        {
            if (m_launcher->m_lifeCycle == Activity::eLifeCycle_onCreated)
                m_launcher->onStarted();

            m_launcher->onResumed();

            m_launcher->setVisible(true);
        }

        if (m_keyboard)
        {
            if (m_keyboard->m_lifeCycle == Activity::eLifeCycle_onCreated)
                m_keyboard->onStarted();

            m_keyboard->onResumed();

            m_keyboard->setVisible(true);
        }

        if (m_header)
        {
            if (m_header->m_lifeCycle == Activity::eLifeCycle_onCreated)
                m_header->onStarted();

            m_header->onResumed();

            m_header->setVisible(true);
        }

        if (m_footer)
        {
            if (m_footer->m_lifeCycle == Activity::eLifeCycle_onCreated)
                m_footer->onStarted();

            m_footer->onResumed();

            m_footer->setVisible(true);
        }

        if (m_toast)
        {
            if (m_toast->m_lifeCycle == Activity::eLifeCycle_onCreated)
                m_toast->onStarted();

            m_toast->onResumed();

            m_toast->setVisible(true);
        }

        clearAllPopup();

        if (m_notification)
        {
            if (m_notification->m_lifeCycle == Activity::eLifeCycle_onCreated)
                m_notification->onStarted();

            m_notification->onResumed();

            m_notification->setVisible(true);
        }

        if (m_disclaimer)
        {
            if (m_disclaimer->m_lifeCycle != Activity::eLifeCycle_onStoped)
            {
                m_disclaimer->onStoped();
                doHideAnimationForAppend(m_disclaimer);
            }
            //m_disclaimer->setVisible(false);
        }

        clearAllApplication();

    }
    else
    {
        qDebug() << "error..";
    }
}

void ActivityManager::startActivityForScreenSaver()
{
    if (m_screenSaver)
    {
        if (m_screenSaver->m_lifeCycle == Activity::eLifeCycle_onCreated)
            m_screenSaver->onStarted();

        m_screenSaver->onResumed();
        m_screenSaver->setVisible(true);

        doShowAnimationForAppend(m_screenSaver);
    }
    else
    {
        qDebug() << "error..";
    }
}

void ActivityManager::finishActivityForScreenSaver()
{
    if (m_screenSaver)
    {
        if (m_screenSaver->m_lifeCycle != Activity::eLifeCycle_onStoped)
            m_screenSaver->onStoped();

        doHideAnimationForAppend(m_screenSaver);
    }
    else
    {
        qDebug() << "error..";
    }
}

void ActivityManager::finishActivityForPopup(QString activityName)
{
    Activity* item = Q_NULLPTR;

    item = findActivity(activityName);

    if (item)
    {
        m_popupActivityList.removeAll(item);
        item->onStoped();
        item->onDestoryed();
        item->deleteLater();

        if (m_popupActivityList.count())
        {
            m_popupActivityList.last()->onResumed();
            doShowAnimationForAppend(m_popupActivityList.last());
        }
        else
        {
            if (m_appActivityList.count())
                setState(eState_Application);
            else
                setState(eState_Launcher);
        }
    }
    else
    {
        qDebug() << Q_FUNC_INFO << "error...";
        return;
    }

    qDebug() << Q_FUNC_INFO << m_popupActivityList;
}

void ActivityManager::finishActivity(QString requester, QVariant data)
{
    finishActivityTransition(requester, data);
}

void ActivityManager::setEnableAnimation(bool enable)
{
    m_enableAnimation = enable;

    if (enable)
        g_duration = 300;
    else
        g_duration = 0;
}

Activity *ActivityManager::launcher()
{
    return m_launcher;
}

void ActivityManager::setLauncher(Activity *activity)
{
    if (!activity)
        return;

    m_launcher = activity;
    m_launcher->onCreated();

    m_launcher->setParent(m_layerLauncher);
    m_launcher->setParentItem(m_layerLauncher);
}

Activity *ActivityManager::notification()
{
    return m_notification;
}

void ActivityManager::setNotification(Activity *activity)
{
    if (!activity)
        return;

    m_notification = activity;
    m_notification->onCreated();

    m_notification->setParent(m_layerNotification);
    m_notification->setParentItem(m_layerNotification);
}

Activity *ActivityManager::toast()
{
    return m_toast;
}

void ActivityManager::setToast(Activity *activity)
{
    if (!activity)
        return;

    m_toast = activity;
    m_toast->onCreated();

    m_toast->setParent(m_layerToast);
    m_toast->setParentItem(m_layerToast);
}

Activity *ActivityManager::header()
{
    return m_header;
}

void ActivityManager::setHeader(Activity *activity)
{
    if (!activity)
        return;

    m_header = activity;
    m_header->onCreated();

    m_header->setParent(m_layerHeader);
    m_header->setParentItem(m_layerHeader);
}

Activity *ActivityManager::footer()
{
    return m_footer;
}

void ActivityManager::setFooter(Activity *activity)
{
    if (!activity)
        return;

    m_footer = activity;
    m_footer->onCreated();

    m_footer->setParent(m_layerFooter);
    m_footer->setParentItem(m_layerFooter);
}

Activity *ActivityManager::splash()
{
    return m_splash;
}

void ActivityManager::setSplash(Activity *activity)
{
    if (!activity)
        return;

    m_splash = activity;
    m_splash->onCreated();

    m_splash->setParent(m_layerSplash);
    m_splash->setParentItem(m_layerSplash);
}

Activity *ActivityManager::keyboard()
{
    return m_keyboard;
}

void ActivityManager::setKeyboard(Activity *activity)
{
    if (!activity)
        return;

    m_keyboard = activity;
    m_keyboard->onCreated();

    m_keyboard->setParent(m_layerLauncher);
    m_keyboard->setParentItem(m_layerLauncher);
}

Activity *ActivityManager::disclaimer()
{
    return m_disclaimer;
}

void ActivityManager::setDisclaimer(Activity *activity)
{
    if (!activity)
        return;

    m_disclaimer = activity;
    m_disclaimer->onCreated();
    m_disclaimer->setParent(m_layerDisclaimer);
    m_disclaimer->setParentItem(m_layerDisclaimer);
}

Activity *ActivityManager::screenSaver()
{
    return m_screenSaver;
}

void ActivityManager::setScreenSaver(Activity *activity)
{
    if (!activity)
        return;

    m_screenSaver = activity;
    m_screenSaver->onCreated();
    m_screenSaver->setParent(m_layerScreenSaver);
    m_screenSaver->setParentItem(m_layerScreenSaver);
}

Activity *ActivityManager::findActivity(QString activityName)
{
    Activity *activity = Q_NULLPTR;

    foreach (Activity* item, m_appActivityList)
    {
        if(item->objectName() == activityName)
        {
            activity = item;
            break;
        }
    }

    if (!activity)
    {
        foreach (Activity* item, m_popupActivityList)
        {
            if(item->objectName() == activityName)
            {
                activity = item;
                break;
            }
        }
    }

    return activity;
}

const QList<Activity *> ActivityManager::applicationActivityList() const
{
    return m_appActivityList;
}

//void ActivityManager::onGeometryUpdated()
//{
//    QWindowList windowlist = qApp->allWindows();

//    if (windowlist.count())
//    {
//        QQuickWindow* window = qobject_cast<QQuickWindow*>(windowlist.at(0));

//        if (window)
//        {
//            QSize size = window->size();

//            m_splash->onResized(size);
//            m_disclaimer->onResized(size);
//            m_launcher->onResized(size);

//            foreach (Activity* item, m_appActivityList)
//            {
//                item->onResized(size);
//            }

//            foreach (Activity* item, m_popupActivityList)
//            {
//                item->onResized(size);
//            }
//        }

//        window->update();
//    }
//}

//void ActivityManager::onAnimationFinished()
//{
//    g_animatioinCount--;
//    qDebug() << Q_FUNC_INFO << g_animatioinCount;
//}

ActivityManager::ActivityManager(QObject *parent)
    : QObject(parent)
    , m_enableAnimation(true)
    , m_state(eState_Splash)
    , m_layerLauncher(Q_NULLPTR)
    , m_layerApplication(Q_NULLPTR)
    , m_layerKeyboard(Q_NULLPTR)
    , m_layerToast(Q_NULLPTR)
    , m_layerPopup(Q_NULLPTR)
    , m_layerHeader(Q_NULLPTR)
    , m_layerFooter(Q_NULLPTR)
    , m_layerNotification(Q_NULLPTR)
    , m_layerSplash(Q_NULLPTR)
    , m_layerDisclaimer(Q_NULLPTR)
    , m_layerScreenSaver(Q_NULLPTR)
    , m_launcher(Q_NULLPTR)
    , m_keyboard(Q_NULLPTR)
    , m_notification(Q_NULLPTR)
    , m_popup(Q_NULLPTR)
    , m_toast(Q_NULLPTR)
    , m_header(Q_NULLPTR)
    , m_footer(Q_NULLPTR)
    , m_splash(Q_NULLPTR)
    , m_disclaimer(Q_NULLPTR)
    , m_screenSaver(Q_NULLPTR)
    , m_appActivityList()
    , m_popupActivityList()
{
    setEnableAnimation(true);

//    QWindowList windowlist = qApp->allWindows();

//    if (windowlist.count())
//    {
//        QWindow* window = qobject_cast<QWindow*>(windowlist.at(0));

//        if (window)
//        {
//            connect(window, SIGNAL(widthChanged(int)), this, SLOT(onGeometryUpdated()));
//            connect(window, SIGNAL(heightChanged(int)), this, SLOT(onGeometryUpdated()));
//        }
//    }
}

bool ActivityManager::checkActivity(QString activityID)
{
    QWindowList windowlist = qApp->allWindows();
    QQuickItem* item = Q_NULLPTR;

    if (windowlist.count())
    {
        QQuickView* view = qobject_cast<QQuickView*>(windowlist.at(0));
        item = view->contentItem()->findChild<QQuickItem*>(activityID);
    }

    if (item)
        return true;
    else
        return false;
}

void ActivityManager::createLayers()
{
    QWindowList windowlist = qApp->allWindows();

    if (windowlist.count())
    {
        QQuickView* view = qobject_cast<QQuickView*>(windowlist.at(0));
        QQuickItem* contentItem = view->contentItem();

        if (contentItem)
        {
            contentItem->setWidth(view->width());
            contentItem->setHeight(view->height());

            createLayer(contentItem, &m_layerLauncher, "LayerLauncher", eLayerZOrder_Launcher);
            createLayer(contentItem, &m_layerApplication, "LayerApplication", eLayerZOrder_Application);
            createLayer(contentItem, &m_layerKeyboard, "LayerKeyboard", eLayerZOrder_Keyboard);
            createLayer(contentItem, &m_layerToast, "LayerToast", eLayerZOrder_Toast);
            createLayer(contentItem, &m_layerHeader, "LayerHeader", eLayerZOrder_Header);
            createLayer(contentItem, &m_layerFooter, "LayerFooter", eLayerZOrder_Footer);
            createLayer(contentItem, &m_layerPopup, "LayerPopup", eLayerZOrder_Popup);
            createLayer(contentItem, &m_layerNotification, "LayerNotification", eLayerZOrder_Notification);
            createLayer(contentItem, &m_layerDisclaimer, "LayerDisclaimer", eLayerZOrder_Disclaimer);
            createLayer(contentItem, &m_layerSplash, "LayerSplash", eLayerZOrder_Splash);
            createLayer(contentItem, &m_layerScreenSaver, "LayerScreenSaver", eLayerZOrder_ScreenSaver);

            qDebug() << contentItem->children();

        }
        else
        {
            qDebug() << "error...";
            return;
        }
    }
}

bool ActivityManager::createLayer(QQuickItem *rootItem, QQuickItem **targetLayer, QString layerName, eLayerZOrder z)
{
    if (!rootItem)
    {
        qWarning() << "rootItem is NULL";
        return false;
    }

    QQuickItem* item = new QQuickItem;

    if (!item)
    {
        qWarning() << "targetLayer is NULL";
        return false;
    }

    item->setObjectName(layerName);
    item->setWidth(rootItem->width());
    item->setHeight(rootItem->height());
    item->setZ((qreal)z);

    item->setParent(rootItem);
    item->setParentItem(rootItem);

    *targetLayer = item;

    return true;
}

Activity *ActivityManager::findActivityOnAll(QString activityName)
{
    Activity* item = Q_NULLPTR;
    QWindowList windowlist = qApp->allWindows();

    if (windowlist.count())
    {
        QQuickView* view = qobject_cast<QQuickView*>(windowlist.at(0));
        QQuickItem* contentItem = view->contentItem();

        if (contentItem)
        {
            item = contentItem->findChild<Activity*>(activityName);
        }
    }

    return item;
}

void ActivityManager::clearAllApplication()
{
    foreach (Activity* item, m_appActivityList)
    {
        if (item->m_lifeCycle != Activity::eLifeCycle_onStoped)
        {
            item->onStoped();
            doHideAnimationForAppend(item);
        }
    }
    m_appActivityList.clear();
}

void ActivityManager::updatePopup(QString activityName)
{
    Activity* item = Q_NULLPTR;


    item = findActivityOnAll(activityName);

    if (item)
    {
        setState(eState_Popup);

        item->setParent(m_layerPopup);
        item->setParentItem(m_layerPopup);

        foreach (Activity* from, m_popupActivityList)
        {
            if (from->m_lifeCycle != Activity::eLifeCycle_onPaused)
            {
                from->onPaused();
                doHideAnimationForAppend(from);
            }
        }

        m_popupActivityList.push_back(item);
        item->onStarted();
        item->onResumed();

        doShowAnimationForAppend(item);
    }
    else
    {
        qDebug() << Q_FUNC_INFO << "error...";
        return;
    }

    qDebug() << Q_FUNC_INFO << m_popupActivityList;
}

void ActivityManager::clearAllPopup()
{
    qDebug() << Q_FUNC_INFO;

    foreach (Activity* item, m_popupActivityList)
    {
        if (item->m_lifeCycle != Activity::eLifeCycle_onStoped)
        {
            item->onStoped();
            item->onDestoryed();
            delete item;
        }
    }

    m_popupActivityList.clear();
}


void ActivityManager::startActivityTransition(QString to, QVariant data, eFlagActivity flag)
{
    qDebug() << Q_FUNC_INFO;

    Activity* fromItem = Q_NULLPTR;
    Activity* toItem = Q_NULLPTR;

    if (m_appActivityList.count() == 0)
    {
        fromItem = m_launcher;
    }
    else if (m_appActivityList.count() > 0)
    {
        fromItem = m_appActivityList.last();
    }

    QWindowList windowlist = qApp->allWindows();

    if (windowlist.count())
    {
        QQuickView* view = qobject_cast<QQuickView*>(windowlist.at(0));
        qDebug() << view->contentItem()->children();
        toItem = view->contentItem()->findChild<Activity*>(to);
    }

    if (!toItem)
    {
        qDebug() << "error (!toItem)";
        return;
    }

    toItem->setIntent(data);

    switch (flag) {
    case eFlagActivity_Append:
        startActivityTransitionOnAppend(fromItem, toItem);
        break;

    case eFlagActivity_Clear_Top:
        startActivityTransitionOnClearTop(fromItem, toItem);
        break;

    case eFlagActivity_Clear_All:
        startActivityTransitionOnClearAll(fromItem, toItem);
        break;

    default:
        break;
    }

    qDebug() << m_appActivityList;
}

void ActivityManager::startActivityTransitionOnAppend(Activity *fromItem, Activity *toItem)
{
    if (fromItem)
    {
        if (fromItem->m_lifeCycle != Activity::eLifeCycle_onPaused)
            fromItem->onPaused();
    }
    else
    {
        qDebug() << "error (!fromItem)";
    }

    if (toItem)
    {
        m_appActivityList.push_back(toItem);

        toItem->setParent(m_layerApplication);
        toItem->setParentItem(m_layerApplication);

        qDebug() << m_layerApplication->z();


        if (toItem->m_lifeCycle == Activity::eLifeCycle_onCreated)
            toItem->onStarted();

        toItem->onResumed();
        toItem->setVisible(true);

        doShowAnimationForAppend(toItem);
    }
    else
    {
        qDebug() << "error (!toItem)";
    }
}

void ActivityManager::startActivityTransitionOnClearTop(Activity *fromItem, Activity *toItem)
{
    m_appActivityList.removeAll(fromItem);

    if (fromItem)
    {
        if (fromItem->m_lifeCycle != Activity::eLifeCycle_onStoped)
            fromItem->onStoped();

        doHideAnimationForClear(fromItem);
    }
    else
    {
         qDebug() << "error (!fromItem)";
    }

    if (toItem)
    {
        m_appActivityList.push_back(toItem);

        toItem->setParent(m_layerApplication);
        toItem->setParentItem(m_layerApplication);

        if (toItem->m_lifeCycle == Activity::eLifeCycle_onCreated)
            toItem->onStarted();

        toItem->onResumed();
        toItem->setVisible(true);

        doShowAnimationForClear(toItem);
    }
    else
    {
         qDebug() << "error (!toItem)";
    }
}

void ActivityManager::startActivityTransitionOnClearAll(Activity *fromItem, Activity *toItem)
{
    foreach (Activity* item, m_appActivityList)
    {
        if (item->m_lifeCycle != Activity::eLifeCycle_onStoped)
            item->onStoped();
    }

    m_appActivityList.clear();

    if (fromItem)
    {
        doHideAnimationForClear(fromItem);
    }
    else
    {
        qDebug() << "error (!fromItem)";
    }

    if (toItem)
    {
        m_appActivityList.push_back(toItem);

        toItem->setParent(m_layerApplication);
        toItem->setParentItem(m_layerApplication);

        if (toItem->m_lifeCycle == Activity::eLifeCycle_onCreated)
            toItem->onStarted();

        toItem->onResumed();
        toItem->setVisible(true);

        doShowAnimationForClear(toItem);
    }
    else
    {
        qDebug() << "error (!toItem)";
    }
}

void ActivityManager::finishActivityTransition(QString requester, QVariant data)
{
    qDebug() << requester;

    if (m_appActivityList.count() == 0)
    {
        qDebug() << "m_activityList.count() == 0";
        return;
    }

    Activity* fromItem = m_appActivityList.last();
    Activity* toItem = Q_NULLPTR;

    if (requester.isEmpty())
    {
        qDebug() << "requester is null...";
        return;
    }

    if (requester != m_appActivityList.last()->objectName())
    {
        qDebug() << "requester is not match..";
        return;
    }

    if (m_appActivityList.count() == 1)
    {
        toItem = m_launcher;
    }

    else if (m_appActivityList.count() > 1)
    {
        toItem = m_appActivityList.at(m_appActivityList.count()-2);
    }

    if (!toItem)
    {
        qDebug() << "error (!toItem)";
        return;
    }

    if (toItem)
    {
        toItem->setIntent(data);

        if (toItem->m_lifeCycle == Activity::eLifeCycle_onCreated)
            toItem->onStarted();

        toItem->onResumed();
        toItem->setX(0);
        toItem->setOpacity(1);
        toItem->setScale(1);
        toItem->setVisible(true);
    }

    if (fromItem)
    {
        if (fromItem->m_lifeCycle != Activity::eLifeCycle_onStoped)
            fromItem->onStoped();

        m_appActivityList.removeAll(fromItem);
        doHideAnimationForAppend(fromItem);
    }

    qDebug() << m_appActivityList;
}

void ActivityManager::doShowAnimationForAppend(Activity *activity)
{
    if (!activity)
    {
        qDebug() << "error activity is null...";
        return;
    }

    activity->setVisible(true);
    activity->setX(0);

    QParallelAnimationGroup* animationGroup = new QParallelAnimationGroup;

    QPropertyAnimation* animation1  = new QPropertyAnimation(activity, "scale");
    animation1->setDuration(g_duration);
    animation1->setStartValue(0.75);
    animation1->setEndValue(1);
    animation1->setEasingCurve(QEasingCurve::OutQuad);

    QPropertyAnimation* animation2  = new QPropertyAnimation(activity, "opacity");
    animation2->setDuration(g_duration);
    animation2->setStartValue(0);
    animation2->setEndValue(1);
    animation2->setEasingCurve(QEasingCurve::OutQuad);

    animationGroup->addAnimation(animation1);
    animationGroup->addAnimation(animation2);
    animationGroup->start(QAbstractAnimation::DeleteWhenStopped);
}

void ActivityManager::doHideAnimationForAppend(Activity *activity)
{
    if (!activity)
    {
        qDebug() << "error activity is null...";
        return;
    }

    activity->setVisible(true);
    activity->setX(0);

    QParallelAnimationGroup* animationGroup = new QParallelAnimationGroup;

    QPropertyAnimation* animation1  = new QPropertyAnimation(activity, "scale");
    animation1->setDuration(g_duration);
    animation1->setStartValue(1);
    animation1->setEndValue(0.75);
    animation1->setEasingCurve(QEasingCurve::OutQuad);

    QPropertyAnimation* animation2  = new QPropertyAnimation(activity, "opacity");
    animation2->setDuration(g_duration);
    animation2->setStartValue(1);
    animation2->setEndValue(0);
    animation2->setEasingCurve(QEasingCurve::OutQuad);

    animationGroup->addAnimation(animation1);
    animationGroup->addAnimation(animation2);
    animationGroup->start(QAbstractAnimation::DeleteWhenStopped);

    connect (animationGroup, &QParallelAnimationGroup::finished, [activity] () {
        qDebug()<< "animation is finished.." << activity->objectName() << "visible false..";
        activity->setVisible(false);
        });
}

void ActivityManager::doShowAnimationForClear(Activity *activity)
{
    if (!activity)
    {
        qDebug() << "error activity is null...";
        return;
    }

    activity->setVisible(true);
    activity->setScale(1);
    activity->setOpacity(1);

    QParallelAnimationGroup* animationGroup = new QParallelAnimationGroup;

    QPropertyAnimation* animation1  = new QPropertyAnimation(activity, "x");
    animation1->setDuration(g_duration);
    animation1->setStartValue(activity->width());
    animation1->setEndValue(0);
    animation1->setEasingCurve(QEasingCurve::OutQuad);

    animationGroup->addAnimation(animation1);
    animationGroup->start(QAbstractAnimation::DeleteWhenStopped);
}

void ActivityManager::doHideAnimationForClear(Activity *activity)
{
    if (!activity)
    {
        qDebug() << "error activity is null...";
        return;
    }

    activity->setVisible(true);
    activity->setScale(1);
    activity->setOpacity(1);

    QParallelAnimationGroup* animationGroup = new QParallelAnimationGroup;

    QPropertyAnimation* animation1  = new QPropertyAnimation(activity, "x");
    animation1->setDuration(g_duration);
    animation1->setStartValue(0);
    animation1->setEndValue(-activity->width());
    animation1->setEasingCurve(QEasingCurve::OutQuad);

    animationGroup->addAnimation(animation1);
    animationGroup->start(QAbstractAnimation::DeleteWhenStopped);

    connect (animationGroup, &QParallelAnimationGroup::finished, [activity] () {
        qDebug()<< "animation is finished.." << activity->objectName() << "visible false..";
        activity->setVisible(false);
        });
}

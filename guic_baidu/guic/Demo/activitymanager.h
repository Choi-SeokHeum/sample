#ifndef ACITIVITYMANANGER_H
#define ACITIVITYMANANGER_H

#include <QObject>
#include <QSharedPointer>
#include <QDebug>

class Activity;
class QPropertyAnimation;
class QParallelAnimationGroup;
class QSequentialAnimationGroup;
class QQuickItem;

class ActivityManager : public QObject
{
    Q_OBJECT

public:
    enum eState {
        eState_Splash = 0,
        eState_Disclaimer = 1,
        eState_Popup = 2,
        eState_Application = 3,
        eState_Launcher = 4,
        eState_ScreenSaver = 4,
    };

    enum eLayerZOrder{
        eLayerZOrder_Launcher = 0,
        eLayerZOrder_Application = 10,
        eLayerZOrder_Keyboard = 20,
        eLayerZOrder_Toast = 30,
        eLayerZOrder_Header = 40,
        eLayerZOrder_Footer = 40,
        eLayerZOrder_Popup = 50,
        eLayerZOrder_Disclaimer = 60,
        eLayerZOrder_ScreenSaver = 70,
        eLayerZOrder_Notification = 80,
        eLayerZOrder_Splash = 90,
    };

    enum eFlagActivity {
        eFlagActivity_Append = 0,
        eFlagActivity_Clear_Top = 1,
        eFlagActivity_Clear_All = 2,
    };

public:
    static const QSharedPointer<ActivityManager> instance(QObject *parent = 0);
    ~ActivityManager();

public:
    void setState(eState state);

    void startActivityForSplash();
    void startActivityForDisclaimer();
    void startActivityForLauncher();

    void startActivityForScreenSaver();
    void finishActivityForScreenSaver();

    template <class T>
    void startActivityForPopup(QString activityName, QVariant data = QVariant())
    {
        T* a = new T;
        a->setObjectName(activityName);
        a->setIntent(data);
        a->onCreated();

        updatePopup(activityName);
    }

    void finishActivityForPopup(QString activityName);


    template <class T>
    void startActivity(QString to, QVariant data = QVariant(), eFlagActivity flag = eFlagActivity_Append)
    {
        if (!checkActivity(to))
        {
            T* a = new T;
            a->createOnAsyncMode();
            a->onCreated();
        }

        startActivityTransition(to, data, flag);
    }

    void finishActivity(QString requester, QVariant data = QVariant());

    void setEnableAnimation(bool enable);

    Activity* launcher();
    void setLauncher(Activity* activity);

    Activity* notification();
    void setNotification(Activity* activity);

    Activity* toast();
    void setToast(Activity* activity);

    Activity* header();
    void setHeader(Activity* activity);

    Activity* footer();
    void setFooter(Activity* activity);

    Activity* splash();
    void setSplash(Activity* activity);

    Activity* keyboard();
    void setKeyboard(Activity* activity);

    Activity* disclaimer();
    void setDisclaimer(Activity* activity);

    Activity *screenSaver();
    void setScreenSaver(Activity* activity);

    Activity* findActivity(QString activityName);

    const QList<Activity*> applicationActivityList() const;

private:
    bool m_enableAnimation;

    eState m_state;

    QQuickItem* m_layerLauncher;
    QQuickItem* m_layerApplication;
    QQuickItem* m_layerKeyboard;
    QQuickItem* m_layerToast;
    QQuickItem* m_layerPopup;
    QQuickItem* m_layerHeader;
    QQuickItem* m_layerFooter;
    QQuickItem* m_layerNotification;
    QQuickItem* m_layerSplash;
    QQuickItem* m_layerDisclaimer;
    QQuickItem* m_layerScreenSaver;

    Activity* m_launcher;
    Activity* m_keyboard;
    Activity* m_notification;
    Activity* m_popup;
    Activity* m_toast;
    Activity* m_header;
    Activity* m_footer;
    Activity* m_splash;
    Activity* m_disclaimer;
    Activity* m_screenSaver;

    QList<Activity*> m_appActivityList;
    QList<Activity*> m_popupActivityList;

private slots:
//    void onGeometryUpdated();
//    void onAnimationFinished();

private:
    explicit ActivityManager(QObject *parent = 0);

    bool checkActivity(QString activityID);

    void createLayers();
    bool createLayer(QQuickItem* rootItem, QQuickItem** targetLayer, QString layerName, eLayerZOrder z);

    Activity* findActivityOnAll(QString activityName);

    void clearAllApplication();

    void updatePopup(QString activityName);
    void clearAllPopup();

    void startActivityTransition(QString to, QVariant data = QVariant(), eFlagActivity flag = eFlagActivity_Append);
    void startActivityTransitionOnAppend(Activity* fromItem, Activity* toItem);
    void startActivityTransitionOnClearTop(Activity* fromItem, Activity* toItem);
    void startActivityTransitionOnClearAll(Activity* fromItem, Activity* toItem);
    void finishActivityTransition(QString requester, QVariant data = QVariant());

    void doShowAnimationForAppend(Activity* activity);
    void doHideAnimationForAppend(Activity* activity);

    void doShowAnimationForClear(Activity* activity);
    void doHideAnimationForClear(Activity* activity);

};

#endif // ACITIVITYMANANGER_H

#ifndef WINDOW_H
#define WINDOW_H

#include <QQuickItem>
//#include <QQmlApplicationEngine>
#include <QVariant>

class ActivityManager;

class Activity : public QQuickItem
{
    Q_OBJECT

public:
    enum eLifeCycle {
        eLifeCycle_onInit = 0,
        eLifeCycle_onCreated = 1,
        eLifeCycle_onStarted = 2,
        eLifeCycle_onResumed = 3,
        eLifeCycle_onPaused = 4,
        eLifeCycle_onStoped = 5,
        eLifeCycle_onDestoryed = 6
    };

public:
    explicit Activity(QUrl source, QQuickItem *parent = 0);
    virtual~Activity();

protected:
    void createOnAsyncMode();

    virtual void onCreated();
    virtual void onStarted();
    virtual void onResumed();
    virtual void onPaused();
    virtual void onStoped();
    virtual void onDestoryed();

    virtual void onResized(QSize& size);

    void setIntent(QVariant data);

protected:
    virtual void timerEvent(QTimerEvent* ev);
    QVariant intent();


private:
    eLifeCycle m_lifeCycle;
    QUrl m_source;
    QQuickItem* m_qml;
    int m_timer;
    QVariant m_intent;

private:
    friend class ActivityManager;
};

#endif // WINDOW_H

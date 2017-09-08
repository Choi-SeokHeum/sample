#include "activity.h"
//#include <QEvent>
#include <QDebug>
#include <QQmlComponent>
#include <QQmlEngine>
#include <QQuickView>
#include <QQmlContext>
#include <QGuiApplication>
#include <QElapsedTimer>
#include <QTimerEvent>
#include <QQmlIncubator>

Activity::Activity(QUrl source, QQuickItem *parent)
    : QQuickItem(parent)
    , m_lifeCycle(eLifeCycle_onInit)
    , m_source(source)
    , m_qml(Q_NULLPTR)
    , m_timer(0)
    , m_intent()

{
    setObjectName("AbstractWindow");
}

Activity::~Activity()
{
    qDebug() << objectName() <<Q_FUNC_INFO;
    if (m_qml)      delete m_qml;
}

void Activity::createOnAsyncMode()
{
    QWindowList windowlist = qApp->allWindows();

    if (windowlist.count())
    {
        QQuickView* view = qobject_cast<QQuickView*>(windowlist.at(0));
        QQmlEngine* engine = view->engine();
        QQmlIncubator incubator;
        QQmlComponent component(engine, m_source);
        component.create(incubator);

        if (!incubator.isReady())
            incubator.forceCompletion();

        QQuickItem *item = qobject_cast<QQuickItem *>(incubator.object());

        if (item)
        {
            this->setWidth(item->width());
            this->setHeight(item->height());
            item->setParent(this);
            this->setParent(view->contentItem());
            item->setParentItem(this);
            this->setParentItem(view->contentItem());

            this->setEnabled(false);

            m_qml = item;
        }

        else
        {
            qDebug() << objectName() <<  Q_FUNC_INFO << "qml path error..";
            return;
        }
    }
}

void Activity::onCreated()
{
    QElapsedTimer timer;
    timer.start();

    if (!m_qml)
    {
//        QWindowList windowlist = qApp->allWindows();

//        if (windowlist.count())
//        {
//            QQuickView* view = qobject_cast<QQuickView*>(windowlist.at(0));
//            QQmlEngine* engine = view->engine();
//            QQmlComponent component(engine, m_source);
//            QQuickItem *item = qobject_cast<QQuickItem *>(component.create());

//            if (item)
//            {
//                this->setWidth(item->width());
//                this->setHeight(item->height());
//                item->setParent(this);
//                this->setParent(view->contentItem());
//                item->setParentItem(this);
//                this->setParentItem(view->contentItem());

//                this->setEnabled(false);

//                m_qml = item;
//            }

//            else
//            {
//                qDebug() << objectName() <<  Q_FUNC_INFO << "qml path error..";
//                return;
//            }
//        }

        createOnAsyncMode();
    }

    m_lifeCycle = eLifeCycle_onCreated;

    qDebug() << objectName() << Q_FUNC_INFO << timer.elapsed();
}


void Activity::onStarted()
{
    qDebug() << objectName() <<Q_FUNC_INFO;
    this->setEnabled(true);

    m_lifeCycle = eLifeCycle_onStarted;
}

void Activity::onResumed()
{
    qDebug() << objectName() <<Q_FUNC_INFO;
    this->setEnabled(true);

    if (m_timer)
    {
        killTimer(m_timer);
        m_timer = 0;
    }

    m_lifeCycle = eLifeCycle_onResumed;
}

void Activity::onPaused()
{
    qDebug() << objectName() <<Q_FUNC_INFO;
    this->setEnabled(true);
    m_intent.clear();

    m_lifeCycle = eLifeCycle_onPaused;
}

void Activity::onStoped()
{
    qDebug() << objectName() <<Q_FUNC_INFO;
    this->setEnabled(false);
    m_intent.clear();
    m_timer = this->startTimer(500);

    m_lifeCycle = eLifeCycle_onStoped;
}

void Activity::onDestoryed()
{
    qDebug() << objectName() <<Q_FUNC_INFO;
    this->setEnabled(false);

    m_lifeCycle = eLifeCycle_onDestoryed;
}

void Activity::onResized(QSize& size)
{
    this->setWidth(size.width());
    this->setHeight(size.height());
    m_qml->setWidth(size.width());
    m_qml->setHeight(size.height());
}

void Activity::setIntent(QVariant data)
{
    m_intent = data;
}

QVariant Activity::intent()
{
    return m_intent;
}


void Activity::timerEvent(QTimerEvent *ev)
{
    qDebug() << objectName() <<Q_FUNC_INFO;
    if (ev->timerId() == m_timer)
    {
        killTimer(m_timer);
        m_timer = 0;
        this->onDestoryed();
        this->deleteLater();
    }

    else
        QObject::timerEvent(ev);
}

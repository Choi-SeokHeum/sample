#ifndef WINDOWLIST_H
#define WINDOWLIST_H

#include "activity.h"
#include "ListModel/popupmenulistmodel.h"
#include "ListModel/listmodel.h"
#include "ListModel/menulistmodel.h"
#include "ListModel/grouplistmodel.h"
#include "ListModel/turnlistmodel.h"
#include <QDebug>

class ActivityList :public Activity
{
    Q_OBJECT

public:
    explicit ActivityList(Activity* parent = Q_NULLPTR);
    ~ActivityList();

public:
    virtual void onCreated();
    virtual void onStarted();
    virtual void onResumed();
    virtual void onPaused();
//    virtual void onStoped();
//    virtual void onDestoryed();
private:
    QVariantList m_carImageList;
    QVariantList m_carNameList;
    QVariantList m_carYearList;

    //PopupMenu
    QVariantList m_popupMenuMainText;
    QVariantList m_popupMenuSubText;
    QVariantList m_popupMenuMainIcon;

    //TurnList
    QVariantList m_turnListMainIcon;
    QVariantList m_turnListSubIcon;
    QVariantList m_turnListBifurcation;
    QVariantList m_turnListDistance;
    QVariantList m_turnListPrice;

    PopupMenuListModel *m_popupMenuListModel;
    ListModel *m_listModel;
    MenuListModel *m_menuListModel;
    GroupListModel *m_groupListModel;
    TurnListModel *m_turnListModel;

    QQuickItem *mListView1;
    QQuickItem *mListView2;

private:
    void onInitVariantLists();

    void onInitList(QQuickItem *listView);
    void onInitMenu(QQuickItem *listView);
    void onInitGroupList(QQuickItem *listView);
    void onInitPopupMenu(QQuickItem *listView);
    void onInitTurnList(QQuickItem *listView);

private slots:
    void onClicked();
};


#endif // WINDOWLIST_H

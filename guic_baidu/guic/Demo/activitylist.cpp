#include "activitymanager.h"
#include "activitylist.h"
#include "guicdefine.h"

//#include "ListModel/popupmenulistmodel.h"
//#include "ListModel/listmodel.h"
//#include "ListModel/menulistmodel.h"
//#include "ListModel/grouplistmodel.h"

#include "activityLauncher.h"

ActivityList::ActivityList(Activity *parent)
    : Activity(QUrl("qrc:/LayoutList.qml"), parent)
{
    setObjectName("ActivityList");
}

ActivityList::~ActivityList()
{
}

void ActivityList::onCreated()
{
    Activity::onCreated();

    QQuickItem* mBackButton = this->findChild<QQuickItem*>("BackButton");
    connect(mBackButton, SIGNAL(clicked()), this, SLOT(onClicked()));
}

void ActivityList::onStarted()
{
    Activity::onStarted();
}

void ActivityList::onResumed()
{
    setEnabled(true);
    setOpacity(1);

    mListView1 = this->findChild<QQuickItem*>("listView1");
    mListView2 = this->findChild<QQuickItem*>("listView2");

    onInitVariantLists();

    onInitTurnList(mListView1);
//    onInitMenu(mListView1);
    //onInitGroupList(mListView1);
//    onInitList(mListView1);
    onInitPopupMenu(mListView2);
}

void ActivityList::onPaused()
{
    setEnabled(false);
    setOpacity(0);
}

void ActivityList::onInitVariantLists()
{
//    m_carNameList.append("Accent");
//    m_carNameList.append("Aslan");
//    m_carNameList.append("Eon");
//    m_carNameList.append("I20");
//    m_carNameList.append("I30");
//    m_carNameList.append("IX35");
//    m_carNameList.append("Santafe");
//    m_carNameList.append("Sonata");
//    m_carNameList.append("Tucson");
//    m_carNameList.append("Veloster");

    m_carNameList.append("qrc:/image/icon_sign_01.png");
    m_carNameList.append("qrc:/image/icon_sign_01.png");
    m_carNameList.append("qrc:/image/icon_sign_01.png");
    m_carNameList.append("qrc:/image/icon_sign_01.png");
    m_carNameList.append("qrc:/image/icon_sign_01.png");
    m_carNameList.append("qrc:/image/icon_sign_01.png");
    m_carNameList.append("qrc:/image/icon_sign_01.png");
    m_carNameList.append("qrc:/image/icon_sign_01.png");
    m_carNameList.append("qrc:/image/icon_sign_01.png");
    m_carNameList.append("qrc:/image/icon_sign_01.png");

    m_carImageList.append("accent.png");
    m_carImageList.append("aslan.png");
    m_carImageList.append("eon.png");
    m_carImageList.append("i20.png");
    m_carImageList.append("i30.png");
    m_carImageList.append("ix35.png");
    m_carImageList.append("santafe.png");
    m_carImageList.append("sonata.png");
    m_carImageList.append("tucson.png");
    m_carImageList.append("veloster.png");


    m_carYearList.append("2008");
    m_carYearList.append("2009");
    m_carYearList.append("2010");
    m_carYearList.append("2011");
    m_carYearList.append("2012");
    m_carYearList.append("2013");
    m_carYearList.append("2014");
    m_carYearList.append("2015");
    m_carYearList.append("2016");
    m_carYearList.append("2017");

    //PopupMenu
    m_popupMenuMainText.append("Menu 01");
    m_popupMenuMainText.append("Menu 02");
    m_popupMenuMainText.append("Menu 03");
    m_popupMenuMainText.append("Menu 04");
    m_popupMenuMainText.append("Menu 05");
    m_popupMenuMainText.append("Menu 06");
    m_popupMenuMainText.append("Menu 07");
    m_popupMenuMainText.append("Menu 08");

    m_popupMenuSubText.append("Menu 01");
    m_popupMenuSubText.append("Menu 02");
    m_popupMenuSubText.append("Menu 03");
    m_popupMenuSubText.append("Menu 04");
    m_popupMenuSubText.append("Menu 05");
    m_popupMenuSubText.append("Menu 06");
    m_popupMenuSubText.append("Menu 07");
    m_popupMenuSubText.append("Menu 08");

    m_popupMenuMainIcon.append("qrc:///image/icon_fastfood_02.png");
    m_popupMenuMainIcon.append("qrc:///image/icon_oil_hd.png");
    m_popupMenuMainIcon.append("qrc:///image/icon_parking_02.png");
    m_popupMenuMainIcon.append("qrc:///image/icon_poi_gasstation.png");
    m_popupMenuMainIcon.append("qrc:///image/icon_poi_lpg.png");

    // TurnList
    m_turnListBifurcation.append("Cheonan Tollgate");
    m_turnListBifurcation.append("Yongin Restarea");
    m_turnListBifurcation.append("Seocho");
    m_turnListBifurcation.append("Bangbae");

    m_turnListMainIcon.append("qrc:/image/kor_r3_88.png");
    m_turnListMainIcon.append("qrc:/image/kor_r1_29.png");
    m_turnListMainIcon.append("qrc:/image/kor_r2_48.png");

    m_turnListSubIcon.append("qrc:///image/icon_fastfood_02.png");
    m_turnListSubIcon.append("qrc:///image/icon_oil_hd.png");
    m_turnListSubIcon.append("qrc:///image/icon_parking_02.png");
    m_turnListSubIcon.append("qrc:///image/icon_poi_gasstation.png");
    m_turnListSubIcon.append("qrc:///image/icon_poi_lpg.png");

    m_turnListDistance.append("4.1 km");
    m_turnListDistance.append("2.4 km");
    m_turnListDistance.append("210 m");

    m_turnListPrice.append("3000");
}

void ActivityList::onInitList(QQuickItem *listView)
{
    m_listModel = new ListModel();

    for (int i = 0 ; i < 10 ; i++)
    {
        m_listModel->insertElement(ListElement(true,
                                               false,
                                               "1 km",
                                               m_carNameList.at(i%10).value<QString>(),
                                               m_carImageList.at(i%10).value<QString>(),
                                               false,
                                               QUrl("qrc:/image/icon_sign_01.png"),
                                               QUrl("qrc:/image/icon_arrow_yellow_01.png"),
                                               i%6));

//        ListElement::ListElement(const bool &enabled,
//                                 const bool &expanded,
//                                 const QString &textFirstLine,
//                                 const QString &textSecondLine,
//                                 const bool &checked,
//                                 const QUrl &imageIconPath,
//                                 const QUrl &imageDirectionPath,
//                                 const int &type)
    }

    listView->setProperty("model", QVariant::fromValue(m_listModel));

}

void ActivityList::onInitMenu(QQuickItem *listView)
{
    m_menuListModel = new MenuListModel();

    for (int i = 0 ; i < 10 ; i++)
    {
        m_menuListModel->insertElement(MenuListElement(true,
                                                       false,
                                                       m_carNameList.at(i%10).value<QString>(),
                                                       m_carImageList.at(i%10).value<QString>(),
                                                       false,
                                                       QUrl("qrc:/image/icon_sign_01.png"),
                                                       i%6));

//        MenuListElement::MenuListElement(const bool &enabled,
//                                         const bool &expanded,
//                                         const QString &textFirstLine,
//                                         const QString &textSecondLine,
//                                         const bool &checked,
//                                         const QUrl &imageIconPath,
//                                         const int &type)
    }

    listView->setProperty("model", QVariant::fromValue(m_menuListModel));
}

void ActivityList::onInitGroupList(QQuickItem *listView)
{
//    GroupListElement::GroupListElement(const bool &enabled,
//                                       const bool &expanded,
//                                       const QString &textFirstLine,
//                                       const QString &textSecondLine,
//                                       const QString &textThirdLine)

    m_groupListModel = new GroupListModel();

    for (int i = 0 ; i < 2 ; i++)
    {
        m_groupListModel->insertElement(GroupListElement(true,
                                                         false,
                                                         m_carNameList.at(i%10).value<QString>(),
                                                         m_carImageList.at(i%10).value<QString>(),
                                                         m_carYearList.at(i%10).value<QString>(),
                                                         1));


//        MenuListElement::MenuListElement(const bool &enabled,
//                                         const bool &expanded,
//                                         const QString &textFirstLine,
//                                         const QString &textSecondLine,
//                                         const bool &checked,
//                                         const QUrl &imageIconPath,
//                                         const int &type)
    }

    listView->setProperty("model", QVariant::fromValue(m_groupListModel));
}

void ActivityList::onInitPopupMenu(QQuickItem *listView)
{
    m_popupMenuListModel = new PopupMenuListModel();

    for (int i = 0 ; i < 10 ; i++)
    {
        m_popupMenuListModel->insertElement(PopupMenuListElement(true,
                                                                 false,
                                                                 m_popupMenuMainText.at(i%7).value<QString>(),
                                                                 m_popupMenuSubText.at(i%7).value<QString>(),
                                                                 true,
                                                                 m_popupMenuMainIcon.at(i%5).value<QUrl>(),
                                                                 i%5));
    }

    listView->setProperty("model", QVariant::fromValue(m_popupMenuListModel));
}

void ActivityList::onInitTurnList(QQuickItem *listView)
{
    m_turnListModel = new TurnListModel();
    m_turnListModel->insertElement(TurnListElement(true,
                                                   false,
                                                   m_turnListBifurcation.at(0).value<QString>(),
                                                   "",
                                                   "",
                                                   m_turnListPrice.at(0).value<QString>(),
                                                   m_turnListDistance.at(0).value<QString>(),
                                                   m_turnListMainIcon.at(0).value<QUrl>(),
                                                   QVariantList(),
                                                   0));

    m_turnListModel->insertElement(TurnListElement(true,
                                                   false,
                                                   m_turnListBifurcation.at(1).value<QString>(),
                                                   "",
                                                   "",
                                                   "",
                                                   m_turnListDistance.at(1).value<QString>(),
                                                   m_turnListMainIcon.at(1).value<QUrl>(),
                                                   m_turnListSubIcon,
                                                   1));

    m_turnListModel->insertElement(TurnListElement(true,
                                                   false,
                                                   m_turnListBifurcation.at(2).value<QString>(),
                                                   m_turnListBifurcation.at(3).value<QString>(),
                                                   m_turnListBifurcation.at(2).value<QString>(),
                                                   "",
                                                   m_turnListDistance.at(2).value<QString>(),
                                                   m_turnListMainIcon.at(2).value<QUrl>(),
                                                   m_turnListSubIcon,
                                                   2));

    listView->setProperty("model", QVariant::fromValue(m_turnListModel));
}

void ActivityList::onClicked()
{
    qDebug() << Q_FUNC_INFO;

    ActivityManager::instance()->startActivity<ActivityLauncher>("ActivityLauncher", "", ActivityManager::eFlagActivity_Clear_All);
}

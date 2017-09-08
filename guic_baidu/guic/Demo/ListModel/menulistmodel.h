#ifndef MENULISTMODEL_H
#define MENULISTMODEL_H

#include "menulistelement.h"
#include "abstractlistmodel.h"
#include "abstractdefine.h"

class MenuListModel: public AbstractListModel
{
    Q_OBJECT
public:
    enum LISTROLES {
        TextFirstLineRole = MENU_ROLENUMBER,
        TextSecondLineRole,
        CheckedRole,
        ImageIconPathRole,
        TypeRole,
    };

    MenuListModel(QObject *parent = 0);

    Q_INVOKABLE virtual QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;
    void insertElement(const MenuListElement &menuListElement);
    virtual void swapElement(quint32 sourceIndex, quint32 destIndex);
    Q_INVOKABLE bool setData(const QModelIndex &index, const QVariant &value, int role = Qt::EditRole);
    Q_INVOKABLE void setData(int index, const QVariant &value, int role);
    bool indexIsValid(const QModelIndex &index) const;
    //Q_INVOKABLE QVariant getData(int index, int role);
    Q_INVOKABLE bool removeRows(qint32 row, qint32 count, const QModelIndex &parent);
    Q_INVOKABLE void deleteItem(qint32 row);
    //Q_INVOKABLE void sort();

private:
    QList<MenuListElement> m_menuListElements;

    QModelIndex mListModelTop;
    QModelIndex mListModelBottom;

signals:
    void itemAdded(bool initialize);
};

#endif // MENULISTMODEL_H

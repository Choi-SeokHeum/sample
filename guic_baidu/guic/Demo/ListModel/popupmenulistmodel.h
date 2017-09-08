#ifndef POPUPMENULISTMODEL_H
#define POPUPMENULISTMODEL_H

#include "popupmenulistelement.h"
#include "abstractlistmodel.h"
#include "abstractdefine.h"

class PopupMenuListModel: public AbstractListModel
{
    Q_OBJECT
public:
    enum PopupMenuRoles {
        TextFirstLineRole = POPUPMENU_ROLENUMBER,
        TextSecondLineRole,
        CheckedRole,
        ImageIconPathRole,
        TypeRole,
    };

    PopupMenuListModel(QObject *parent = 0);

    Q_INVOKABLE virtual QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;
    void insertElement(const PopupMenuListElement &popupMenuListElement);
    virtual void swapElement(quint32 sourceIndex, quint32 destIndex);
    Q_INVOKABLE bool setData(const QModelIndex &index, const QVariant &value, int role = Qt::EditRole);
    Q_INVOKABLE void setData(int index, const QVariant &value, int role);
    bool indexIsValid(const QModelIndex &index) const;
    //Q_INVOKABLE QVariant getData(int index, int role);
    Q_INVOKABLE bool removeRows(qint32 row, qint32 count, const QModelIndex &parent);
    Q_INVOKABLE void deleteItem(qint32 row);
    //Q_INVOKABLE void sort();

private:
    QList<PopupMenuListElement> m_popupMenuListElements;

    QModelIndex mListModelTop;
    QModelIndex mListModelBottom;

signals:
    void itemAdded(bool initialize);
};

#endif // POPUPMENULISTMODEL_H

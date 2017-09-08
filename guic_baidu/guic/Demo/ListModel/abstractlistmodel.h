#ifndef ABSTRACTLISTMODEL_H
#define ABSTRACTLISTMODEL_H

#include <QAbstractListModel>

#include "abstractlistelement.h"
#include "abstractdefine.h"

class AbstractListModel : public QAbstractListModel
{
    Q_OBJECT
public:
    enum AbstractRoles {
        EnabledRole = ABSTRACT_ROLENUMBER,
        ExpandedRole
    };

    AbstractListModel(QObject *parent = 0);

    void addAbstractElement(const AbstractListElement &abstractElement);
    int rowCount(const QModelIndex & parent = QModelIndex()) const;
    virtual QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;
    QHash<int, QByteArray> roleNames() const;
    Q_INVOKABLE virtual void swapElement(quint32 sourceIndex, quint32 destIndex);
    Q_INVOKABLE virtual bool setData(const QModelIndex &index, const QVariant &value, int role = Qt::EditRole);
    Q_INVOKABLE QVariant getData(int index, int role);

protected:
    QHash<int, QByteArray> roles;

protected:
    QList<AbstractListElement> m_abstractElements;

private:
    QModelIndex mListModelTop;
    QModelIndex mListModelBottom;

};

#endif // ABSTRACTLISTMODEL_H

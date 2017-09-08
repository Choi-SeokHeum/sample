#include "grouplistmodel.h"
#include "grouplistelement.h"
#include "QDebug"
#include <QSortFilterProxyModel>

GroupListModel::GroupListModel(QObject *parent)
    : AbstractListModel(parent)
{
    roles[TextFirstLineRole] = "textFirstLine";
    roles[TextSecondLineRole] = "textSecondLine";
    roles[TextThirdLineRole] = "textThirdLine";
    roles[TypeRole] = "type";
}

void GroupListModel::setData(int index, const QVariant &value, int role)
{
    setData(this->index(index, 0), value, role);
}

//QVariant GroupListModel::getData(int index, int role)
//{
//    return data(this->index(index, 0), role);
//}

void GroupListModel::insertElement(const GroupListElement &groupListElement)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_abstractElements << (AbstractListElement)groupListElement;
    m_groupListElements << groupListElement;
    endInsertRows();

    emit dataChanged(this->index(m_groupListElements.size()), this->index(m_groupListElements.size()));
}

QVariant GroupListModel::data(const QModelIndex & index, int role) const
{
    if (index.row() < 0 || index.row() >= m_groupListElements.count())
        return QVariant();

    if (role >= AbstractRoles::EnabledRole && role <= AbstractRoles::ExpandedRole)
    {
        return AbstractListModel::data(index, role);
    }
    else
    {
        const GroupListElement &groupListElement = m_groupListElements[index.row()];

        if (role == TextFirstLineRole)
            return groupListElement.textFirstLine();
        else if (role == TextSecondLineRole)
            return groupListElement.textSecondLine();
        else if (role == TextThirdLineRole)
            return groupListElement.textThirdLine();
        else if (role == TypeRole)
            return groupListElement.type();
    }

    return QVariant();
}

void GroupListModel::swapElement(quint32 sourceIndex, quint32 destIndex)
{
    if (sourceIndex != destIndex)
    {
        if (destIndex > sourceIndex)
        {
            beginMoveRows(QModelIndex(),destIndex,destIndex,QModelIndex(),sourceIndex);
        }
        else
        {
            beginMoveRows(QModelIndex(),sourceIndex,sourceIndex,QModelIndex(),destIndex);
        }

        m_groupListElements.move(sourceIndex, destIndex);

        endMoveRows();

        emit dataChanged(this->index(m_groupListElements.size()), this->index(m_groupListElements.size()));
    }
}

bool GroupListModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if (index.row() < 0 || index.row() >= m_abstractElements.count())
    {
        return false;
    }

//    if (indexIsValid(index))
//        return false;

    if (role >= Qt::UserRole + 1 && role <= Qt::UserRole + 2)
        return AbstractListModel::setData(index, value, role);
    else
    {
        if (role == TextFirstLineRole)
            m_groupListElements[index.row()].setTextFirstLine(value.toString());
        else if (role == TextSecondLineRole)
            m_groupListElements[index.row()].setTextSecondLine(value.toString());
        else if (role == TextThirdLineRole)
            m_groupListElements[index.row()].setTextThirdLine(value.toString());
        else if (role == TypeRole)
            m_groupListElements[index.row()].setType(value.toInt());

        emit dataChanged(this->index(0, 0), this->index(this->rowCount() - 1, 0));
    }

    return true;
}

bool GroupListModel::indexIsValid(const QModelIndex &index) const
{
    return index.isValid() && index.row() < rowCount() && index.row() > -1;
}

bool GroupListModel::removeRows(qint32 row, qint32 count, const QModelIndex &parent)
{
    beginRemoveRows(parent, row, row + count - 1);

    while (count--)
    {
        m_groupListElements.removeAt(row);
    }

    endRemoveRows();

    return true;
}

void GroupListModel::deleteItem(qint32 row)
{
    removeRows(row, 1, QModelIndex());
}

//void GroupListModel::sort()
//{
//    QSortFilterProxyModel *proxy = new QSortFilterProxyModel();

//    proxy->setSourceModel(this);
//    proxy->setDynamicSortFilter(false);
//    proxy->sort(0, Qt::AscendingOrder);
//    proxy->setSortRole(Qt::UserRole + 3);
//    proxy->setSortCaseSensitivity(Qt::CaseInsensitive);

//    QList<GroupListElement> m_tempListElements;

//    for (int i = 0 ; i < m_groupListElements.count() ; i++)
//    {
//        m_tempListElements.append(GroupListElement(proxy->index(i,0).data(AbstractRoles::EnabledRole).toBool(),
//                                                   proxy->index(i,0).data(AbstractRoles::ExpandedRole).toBool(),
//                                                   proxy->index(i,0).data(TextFirstLineRole).toString(),
//                                                   proxy->index(i,0).data(TextSecondLineRole).toString(),
//                                                   proxy->index(i,0).data(TextThirdLineRole).toString()));
//    }

//    m_groupListElements.clear();
//    m_groupListElements = m_tempListElements;

//    emit dataChanged(this->index(0, 0), this->index(this->rowCount() - 1, 0));
//}

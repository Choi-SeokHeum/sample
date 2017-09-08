#include "listmodel.h"
#include "listelement.h"
#include "QDebug"
#include <QSortFilterProxyModel>

ListModel::ListModel(QObject *parent)
    : AbstractListModel(parent)
{
    roles[TextDistanceRole] = "textDistance";
    roles[TextFirstLineRole] = "textFirstLine";
    roles[TextSecondLineRole] = "textSecondLine";
    roles[CheckedRole] = "checked";
    roles[ImageIconPathRole] = "imageIconPath";
    roles[ImageDirectionPathRole] = "imageDirectionPath";
    roles[TypeRole] = "type";
}

void ListModel::setData(int index, const QVariant &value, int role)
{
    setData(this->index(index, 0), value, role);
}

//QVariant ListModel::getData(int index, int role)
//{
//    return data(this->index(index, 0), role);
//}

void ListModel::insertElement(const ListElement &listElement)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_abstractElements << (AbstractListElement)listElement;
    m_listElements << listElement;
    endInsertRows();

    emit dataChanged(this->index(m_listElements.size()), this->index(m_listElements.size()));
}

QVariant ListModel::data(const QModelIndex & index, int role) const
{
    if (index.row() < 0 || index.row() >= m_listElements.count())
        return QVariant();

    if (role >= AbstractRoles::EnabledRole && role <= AbstractRoles::ExpandedRole)
    {
        return AbstractListModel::data(index, role);
    }
    else
    {
        const ListElement &listElement = m_listElements[index.row()];

        if (role == TextDistanceRole)
            return listElement.textDistance();
        else if (role == TextFirstLineRole)
            return listElement.textFirstLine();
        else if (role == TextSecondLineRole)
            return listElement.textSecondLine();
        else if (role == CheckedRole)
            return listElement.checked();
        else if (role == ImageIconPathRole)
            return listElement.imageIconPath();
        else if (role == ImageDirectionPathRole)
            return listElement.imageDirectionPath();
        else if (role == TypeRole)
            return listElement.type();
    }

    return QVariant();
}

void ListModel::swapElement(quint32 sourceIndex, quint32 destIndex)
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

        m_listElements.move(sourceIndex, destIndex);

        endMoveRows();

        emit dataChanged(this->index(m_listElements.size()), this->index(m_listElements.size()));
    }
}

bool ListModel::setData(const QModelIndex &index, const QVariant &value, int role)
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
        if (role == TextDistanceRole)
            m_listElements[index.row()].setTextDistance(value.toString());
        else if (role == TextFirstLineRole)
            m_listElements[index.row()].setTextFirstLine(value.toString());
        else if (role == TextSecondLineRole)
            m_listElements[index.row()].setTextSecondLine(value.toString());
        else if (role == CheckedRole)
            m_listElements[index.row()].setChecked(value.toBool());
        else if (role == ImageIconPathRole)
            m_listElements[index.row()].setImageIconPath(value.toString());
        else if (role == ImageDirectionPathRole)
            m_listElements[index.row()].setImageDirectionPath(value.toString());
        else if (role == TypeRole)
            m_listElements[index.row()].setType(value.toInt());

        emit dataChanged(this->index(0, 0), this->index(this->rowCount() - 1, 0));
    }

    return true;
}

bool ListModel::indexIsValid(const QModelIndex &index) const
{
    return index.isValid() && index.row() < rowCount() && index.row() > -1;
}

bool ListModel::removeRows(qint32 row, qint32 count, const QModelIndex &parent)
{
    beginRemoveRows(parent, row, row + count - 1);

    while (count--)
    {
        m_listElements.removeAt(row);
    }

    endRemoveRows();

    return true;
}

void ListModel::deleteItem(qint32 row)
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

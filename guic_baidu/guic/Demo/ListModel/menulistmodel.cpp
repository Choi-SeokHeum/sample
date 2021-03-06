#include "menulistmodel.h"
#include "menulistelement.h"
#include "QDebug"
#include <QSortFilterProxyModel>

MenuListModel::MenuListModel(QObject *parent)
    : AbstractListModel(parent)
{
    roles[TextFirstLineRole] = "textFirstLine";
    roles[TextSecondLineRole] = "textSecondLine";
    roles[CheckedRole] = "checked";
    roles[ImageIconPathRole] = "imageIconPath";
    roles[TypeRole] = "type";
}

void MenuListModel::setData(int index, const QVariant &value, int role)
{
    setData(this->index(index, 0), value, role);
}

//QVariant MenuListModel::getData(int index, int role)
//{
//    return data(this->index(index, 0), role);
//}

void MenuListModel::insertElement(const MenuListElement &menuListElement)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_abstractElements << (AbstractListElement)menuListElement;
    m_menuListElements << menuListElement;
    endInsertRows();

    emit dataChanged(this->index(m_menuListElements.size()), this->index(m_menuListElements.size()));
}

QVariant MenuListModel::data(const QModelIndex & index, int role) const
{
    if (index.row() < 0 || index.row() >= m_menuListElements.count())
        return QVariant();

    if (role >= AbstractRoles::EnabledRole && role <= AbstractRoles::ExpandedRole)
    {
        return AbstractListModel::data(index, role);
    }
    else
    {
        const MenuListElement &listElement = m_menuListElements[index.row()];

        if (role == TextFirstLineRole)
            return listElement.textFirstLine();
        else if (role == TextSecondLineRole)
            return listElement.textSecondLine();
        else if (role == CheckedRole)
            return listElement.checked();
        else if (role == ImageIconPathRole)
            return listElement.imageIconPath();
        else if (role == TypeRole)
            return listElement.type();
    }

    return QVariant();
}

void MenuListModel::swapElement(quint32 sourceIndex, quint32 destIndex)
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

        m_menuListElements.move(sourceIndex, destIndex);

        endMoveRows();

        emit dataChanged(this->index(m_menuListElements.size()), this->index(m_menuListElements.size()));
    }
}

bool MenuListModel::setData(const QModelIndex &index, const QVariant &value, int role)
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
            m_menuListElements[index.row()].setTextFirstLine(value.toString());
        else if (role == TextSecondLineRole)
            m_menuListElements[index.row()].setTextSecondLine(value.toString());
        else if (role == CheckedRole)
            m_menuListElements[index.row()].setChecked(value.toBool());
        else if (role == ImageIconPathRole)
            m_menuListElements[index.row()].setImageIconPath(value.toString());
        else if (role == TypeRole)
            m_menuListElements[index.row()].setType(value.toInt());

        emit dataChanged(this->index(0, 0), this->index(this->rowCount() - 1, 0));
    }

    return true;
}

bool MenuListModel::indexIsValid(const QModelIndex &index) const
{
    return index.isValid() && index.row() < rowCount() && index.row() > -1;
}

bool MenuListModel::removeRows(qint32 row, qint32 count, const QModelIndex &parent)
{
    beginRemoveRows(parent, row, row + count - 1);

    while (count--)
    {
        m_menuListElements.removeAt(row);
    }

    endRemoveRows();

    return true;
}

void MenuListModel::deleteItem(qint32 row)
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

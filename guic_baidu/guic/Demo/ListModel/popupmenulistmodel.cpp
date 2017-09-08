#include "popupmenulistmodel.h"
#include "popupmenulistelement.h"
#include "QDebug"
#include <QSortFilterProxyModel>

PopupMenuListModel::PopupMenuListModel(QObject *parent)
    : AbstractListModel(parent)
{
    roles[TextFirstLineRole] = "textFirstLine";
    roles[TextSecondLineRole] = "textSecondLine";
    roles[CheckedRole] = "checked";
    roles[ImageIconPathRole] = "imageIconPath";
    roles[TypeRole] = "type";
}

void PopupMenuListModel::setData(int index, const QVariant &value, int role)
{
    setData(this->index(index, 0), value, role);
}

//QVariant PopupMenuListModel::getData(int index, int role)
//{
//    return data(this->index(index, 0), role);
//}

void PopupMenuListModel::insertElement(const PopupMenuListElement &popupMenuListElement)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_abstractElements << (AbstractListElement)popupMenuListElement;
    m_popupMenuListElements << popupMenuListElement;
    endInsertRows();

    emit dataChanged(this->index(m_popupMenuListElements.size()), this->index(m_popupMenuListElements.size()));
}

QVariant PopupMenuListModel::data(const QModelIndex & index, int role) const
{
    if (index.row() < 0 || index.row() >= m_popupMenuListElements.count())
        return QVariant();

    if (role >= AbstractRoles::EnabledRole && role <= AbstractRoles::ExpandedRole)
    {
        return AbstractListModel::data(index, role);
    }
    else
    {
        const PopupMenuListElement &popupMenuListmElement = m_popupMenuListElements[index.row()];

        if (role == TextFirstLineRole)
            return popupMenuListmElement.textFirstLine();
        else if (role == TextSecondLineRole)
            return popupMenuListmElement.textSecondLine();
        else if (role == CheckedRole)
            return popupMenuListmElement.checked();
        else if (role == ImageIconPathRole)
            return popupMenuListmElement.imageIconPath();
        else if (role == TypeRole)
            return popupMenuListmElement.type();
    }

    return QVariant();
}

void PopupMenuListModel::swapElement(quint32 sourceIndex, quint32 destIndex)
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

        m_popupMenuListElements.move(sourceIndex, destIndex);

        endMoveRows();

        emit dataChanged(this->index(m_popupMenuListElements.size()), this->index(m_popupMenuListElements.size()));
    }
}

bool PopupMenuListModel::setData(const QModelIndex &index, const QVariant &value, int role)
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
            m_popupMenuListElements[index.row()].setTextFirstLine(value.toString());
        else if (role == TextSecondLineRole)
            m_popupMenuListElements[index.row()].setTextSecondLine(value.toString());
        else if (role == CheckedRole)
            m_popupMenuListElements[index.row()].setChecked(value.toBool());
        else if (role == ImageIconPathRole)
            m_popupMenuListElements[index.row()].setImageIconPath(value.toUrl());
        else if (role == TypeRole)
            m_popupMenuListElements[index.row()].setType(value.toInt());

        emit dataChanged(this->index(0, 0), this->index(this->rowCount() - 1, 0));
    }

    return true;
}

bool PopupMenuListModel::indexIsValid(const QModelIndex &index) const
{
    return index.isValid() && index.row() < rowCount() && index.row() > -1;
}

bool PopupMenuListModel::removeRows(qint32 row, qint32 count, const QModelIndex &parent)
{
    beginRemoveRows(parent, row, row + count - 1);

    while (count--)
    {
        m_popupMenuListElements.removeAt(row);
    }

    endRemoveRows();

    return true;
}

void PopupMenuListModel::deleteItem(qint32 row)
{
    removeRows(row, 1, QModelIndex());
}

//void PopupMenuListModel::sort()
//{
//    QSortFilterProxyModel *proxy = new QSortFilterProxyModel();

//    proxy->setSourceModel(this);
//    proxy->setDynamicSortFilter(false);
//    proxy->sort(0, Qt::AscendingOrder);
//    proxy->setSortRole(Qt::UserRole + 3);
//    proxy->setSortCaseSensitivity(Qt::CaseInsensitive);

//    QList<PopupMenuListElement> m_tempListElements;

//    for (int i = 0 ; i < m_popupMenuListElements.count() ; i++)
//    {
//        m_tempListElements.append(PopupMenuListElement(proxy->index(i,0).data(AbstractRoles::EnabledRole).toBool(),
//                                                       proxy->index(i,0).data(AbstractRoles::ExpandedRole).toBool(),
//                                                       proxy->index(i,0).data(TextFirstLineRole).toString(),
//                                                       proxy->index(i,0).data(TextSecondLineRole).toString(),
//                                                       proxy->index(i,0).data(CheckedRole).toBool(),
//                                                       proxy->index(i,0).data(ImageIconPathRole).toUrl(),
//                                                       proxy->index(i,0).data(TypeRole).toInt()));
//    }

//    m_popupMenuListElements.clear();
//    m_popupMenuListElements = m_tempListElements;

//    emit dataChanged(this->index(0, 0), this->index(this->rowCount() - 1, 0));
//}

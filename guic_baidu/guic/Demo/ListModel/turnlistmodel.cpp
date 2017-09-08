#include "turnlistmodel.h"
#include "turnlistelement.h"
#include "QDebug"
#include <QSortFilterProxyModel>

TurnListModel::TurnListModel(QObject *parent)
    : AbstractListModel(parent)
{
    roles[TextBifurcationRole] = "textBifurcation";
    roles[TextFirstLineRole] = "textFirstLine";
    roles[TextSecondLineRole] = "textSecondLine";
    roles[TextPriceRole] = "textPrice";
    roles[TextDistanceRole] = "textDistance";
    roles[ImageIconRole] = "imageIcon";
    roles[ImageIconListRole] = "imageIconList";
    roles[TypeRole] = "type";
}

void TurnListModel::setData(int index, const QVariant &value, int role)
{
    setData(this->index(index, 0), value, role);
}

//QVariant TurnListModel::getData(int index, int role)
//{
//    return data(this->index(index, 0), role);
//}

void TurnListModel::insertElement(const TurnListElement &turnListElement)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_abstractElements << (AbstractListElement)turnListElement;
    m_turnListElements << turnListElement;
    endInsertRows();

    emit dataChanged(this->index(m_turnListElements.size()), this->index(m_turnListElements.size()));
}

QVariant TurnListModel::data(const QModelIndex & index, int role) const
{
    if (index.row() < 0 || index.row() >= m_turnListElements.count())
        return QVariant();

    if (role >= AbstractRoles::EnabledRole && role <= AbstractRoles::ExpandedRole)
    {
        return AbstractListModel::data(index, role);
    }
    else
    {
        const TurnListElement &turnListElement = m_turnListElements[index.row()];

        if (role == TextBifurcationRole)
            return turnListElement.textBifurcation();
        else if (role == TextFirstLineRole)
            return turnListElement.textFirstLine();
        else if (role == TextSecondLineRole)
            return turnListElement.textSecondLine();
        else if (role == TextPriceRole)
            return turnListElement.textPrice();
        else if (role == TextDistanceRole)
            return turnListElement.textDistance();
        else if (role == ImageIconRole)
            return turnListElement.imageIcon();
        else if (role == ImageIconListRole)
            return turnListElement.imageIconList();
        else if (role == TypeRole)
            return turnListElement.type();
    }

    return QVariant();
}

void TurnListModel::swapElement(quint32 sourceIndex, quint32 destIndex)
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

        m_turnListElements.move(sourceIndex, destIndex);

        endMoveRows();

        emit dataChanged(this->index(m_turnListElements.size()), this->index(m_turnListElements.size()));
    }
}

bool TurnListModel::setData(const QModelIndex &index, const QVariant &value, int role)
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
        if (role == TextBifurcationRole)
            m_turnListElements[index.row()].setTextBifurcation(value.toString());
        else if (role == TextFirstLineRole)
            m_turnListElements[index.row()].setTextFirstLine(value.toString());
        else if (role == TextSecondLineRole)
            m_turnListElements[index.row()].setTextSecondLine(value.toString());
        else if (role == TextPriceRole)
            m_turnListElements[index.row()].setTextPrice(value.toString());
        else if (role == TextDistanceRole)
            m_turnListElements[index.row()].setTextDistance(value.toString());
        else if (role == ImageIconRole)
            m_turnListElements[index.row()].setImageIcon(value.toUrl());
        else if (role == ImageIconListRole)
            m_turnListElements[index.row()].setImageIconList(qvariant_cast<QVariantList>(value));
        else if (role == TypeRole)
            m_turnListElements[index.row()].setType(value.toInt());

        emit dataChanged(this->index(0, 0), this->index(this->rowCount() - 1, 0));
    }

    return true;
}

bool TurnListModel::indexIsValid(const QModelIndex &index) const
{
    return index.isValid() && index.row() < rowCount() && index.row() > -1;
}

bool TurnListModel::removeRows(qint32 row, qint32 count, const QModelIndex &parent)
{
    beginRemoveRows(parent, row, row + count - 1);

    while (count--)
    {
        m_turnListElements.removeAt(row);
    }

    endRemoveRows();

    return true;
}

void TurnListModel::deleteItem(qint32 row)
{
    removeRows(row, 1, QModelIndex());
}

//void TurnListModel::sort()
//{
//    QSortFilterProxyModel *proxy = new QSortFilterProxyModel();

//    proxy->setSourceModel(this);
//    proxy->setDynamicSortFilter(false);
//    proxy->sort(0, Qt::AscendingOrder);
//    proxy->setSortRole(Qt::UserRole + 3);
//    proxy->setSortCaseSensitivity(Qt::CaseInsensitive);

//    QList<GroupListElement> m_tempListElements;

//    for (int i = 0 ; i < m_turnListElements.count() ; i++)
//    {
//        m_tempListElements.append(TurnListElement(proxy->index(i,0).data(AbstractRoles::EnabledRole).toBool(),
//                                                   proxy->index(i,0).data(AbstractRoles::ExpandedRole).toBool(),
//                                                   proxy->index(i,0).data(TextFirstLineRole).toString(),
//                                                   proxy->index(i,0).data(TextSecondLineRole).toString(),
//                                                   proxy->index(i,0).data(TextThirdLineRole).toString()));
//    }

//    m_turnListElements.clear();
//    m_turnListElements = m_tempListElements;

//    emit dataChanged(this->index(0, 0), this->index(this->rowCount() - 1, 0));
//}

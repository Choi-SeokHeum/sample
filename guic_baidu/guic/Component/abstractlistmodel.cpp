#include "abstractlistmodel.h"
#include "abstractlistelement.h"
#include "QDebug"

AbstractListModel::AbstractListModel(QObject *parent)
    : QAbstractListModel(parent)
{
    roles[EnabledRole] = "myEnabled";
    roles[ExpandedRole] = "myExpanded";
}

void AbstractListModel::addAbstractElement(const AbstractListElement &abstractListElement)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_abstractElements << abstractListElement;
    endInsertRows();
}

int AbstractListModel::rowCount(const QModelIndex & parent) const {
    Q_UNUSED(parent);
    return m_abstractElements.count();
}

QVariant AbstractListModel::data(const QModelIndex & index, int role) const {
    if (index.row() < 0 || index.row() >= m_abstractElements.count())
        return QVariant();

    const AbstractListElement &abstractElement = m_abstractElements[index.row()];
    if (role == EnabledRole)
        return abstractElement.enabled();
    else if (role == ExpandedRole)
        return abstractElement.expanded();
    return QVariant();
}

QHash<int, QByteArray> AbstractListModel::roleNames() const {
    return roles;
}

void AbstractListModel::swapElement(quint32 sourceIndex, quint32 destIndex)
{
    if (sourceIndex != destIndex)
    {
        qDebug() << "swapElement";
        beginMoveRows(QModelIndex(),sourceIndex,sourceIndex,QModelIndex(),destIndex);

        m_abstractElements.move(sourceIndex, destIndex);
        endMoveRows();

        emit dataChanged(this->index(m_abstractElements.size()), this->index(m_abstractElements.size()));
    }
}

bool AbstractListModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
//    if (index.row() < 0 || index.row() >= m_abstractElements.count())
//        return false;

    if (role == EnabledRole)
        m_abstractElements[index.row()].setEnabled(value.toBool());
    else if (role == ExpandedRole)
        m_abstractElements[index.row()].setExpanded(value.toBool());

    emit dataChanged(index, index);

    return true;
}



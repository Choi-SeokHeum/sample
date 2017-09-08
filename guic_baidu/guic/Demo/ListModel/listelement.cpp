#include "listelement.h"
#include "abstractlistelement.h"

//GroupListElement::GroupListElement(const bool &enabled, const bool &expanded
//                             , const QString &value, const QString &path, const int &type)
//    : AbstractListElement(enabled, expanded), m_value(value), m_path(path), m_type(type)
//{
//}

ListElement::ListElement(const bool &enabled,
                         const bool &expanded,
                         const QString &textDistance,
                         const QString &textFirstLine,
                         const QString &textSecondLine,
                         const bool &checked,
                         const QUrl &imageIconPath,
                         const QUrl &imageDirectionPath,
                         const int &type)
    : AbstractListElement(enabled, expanded),
      m_textDistance(textDistance),
      m_textFirstLine(textFirstLine),
      m_textSecondLine(textSecondLine),
      m_checked(checked),
      m_imageIconPath(imageIconPath),
      m_imageDirectionPath(imageDirectionPath),
      m_type(type)
{
}

QString ListElement::textDistance() const
{
    return m_textDistance;
}

QString ListElement::textFirstLine() const
{
    return m_textFirstLine;
}

QString ListElement::textSecondLine() const
{
    return m_textSecondLine;
}

bool ListElement::checked() const
{
    return m_checked;
}

QUrl ListElement::imageIconPath() const
{
    return m_imageIconPath;
}

QUrl ListElement::imageDirectionPath() const
{
    return m_imageDirectionPath;
}

int ListElement::type() const
{
    return m_type;
}

void ListElement::setTextDistance(const QString &textDistance)
{
    if (m_textDistance != textDistance)
        m_textDistance = textDistance;
}


void ListElement::setTextFirstLine(const QString &textFirstLine)
{
    if (m_textFirstLine != textFirstLine)
        m_textFirstLine = textFirstLine;
}

void ListElement::setTextSecondLine(const QString &textSecondLine)
{
    if (m_textSecondLine != textSecondLine)
        m_textSecondLine = textSecondLine;
}

void ListElement::setChecked(const bool &checked)
{
    if (m_checked != checked)
        m_checked = checked;
}

void ListElement::setImageIconPath(const QUrl &imageIconPath)
{
    if (m_imageIconPath != imageIconPath)
        m_imageIconPath = imageIconPath;
}

void ListElement::setImageDirectionPath(const QUrl &imageDirectionPath)
{
    if (m_imageDirectionPath != imageDirectionPath)
        m_imageDirectionPath = imageDirectionPath;
}

void ListElement::setType(const int &type)
{
    if (m_type != type)
        m_type = type;
}


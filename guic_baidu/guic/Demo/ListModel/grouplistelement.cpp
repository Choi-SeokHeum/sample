#include "grouplistelement.h"
#include "abstractlistelement.h"

//GroupListElement::GroupListElement(const bool &enabled, const bool &expanded
//                             , const QString &value, const QString &path, const int &type)
//    : AbstractListElement(enabled, expanded), m_value(value), m_path(path), m_type(type)
//{
//}

GroupListElement::GroupListElement(const bool &enabled,
                                   const bool &expanded,
                                   const QString &textFirstLine,
                                   const QString &textSecondLine,
                                   const QString &textThirdLine,
                                   const int &type)
    : AbstractListElement(enabled, expanded),
      m_textFirstLine(textFirstLine),
      m_textSecondLine(textSecondLine),
      m_textThirdLine(textThirdLine),
      m_type(type)
{
}

QString GroupListElement::textFirstLine() const
{
    return m_textFirstLine;
}

QString GroupListElement::textSecondLine() const
{
    return m_textSecondLine;
}

QString GroupListElement::textThirdLine() const
{
    return m_textThirdLine;
}

int GroupListElement::type() const
{
    return m_type;
}

void GroupListElement::setTextFirstLine(const QString &textFirstLine)
{
    if (m_textFirstLine != textFirstLine)
        m_textFirstLine = textFirstLine;
}

void GroupListElement::setTextSecondLine(const QString &textSecondLine)
{
    if (m_textSecondLine != textSecondLine)
        m_textSecondLine = textSecondLine;
}

void GroupListElement::setTextThirdLine(const QString &textThirdLine)
{
    if (m_textThirdLine != textThirdLine)
        m_textThirdLine = textThirdLine;
}

void GroupListElement::setType(const int &type)
{
    if (m_type != type)
        m_type = type;
}

#include "menulistelement.h"
#include "abstractlistelement.h"

//GroupListElement::GroupListElement(const bool &enabled, const bool &expanded
//                             , const QString &value, const QString &path, const int &type)
//    : AbstractListElement(enabled, expanded), m_value(value), m_path(path), m_type(type)
//{
//}

MenuListElement::MenuListElement(const bool &enabled,
                         const bool &expanded,
                         const QString &textFirstLine,
                         const QString &textSecondLine,
                         const bool &checked,
                         const QUrl &imageIconPath,
                         const int &type)
    : AbstractListElement(enabled, expanded),
      m_textFirstLine(textFirstLine),
      m_textSecondLine(textSecondLine),
      m_checked(checked),
      m_imageIconPath(imageIconPath),
      m_type(type)
{
}

QString MenuListElement::textFirstLine() const
{
    return m_textFirstLine;
}

QString MenuListElement::textSecondLine() const
{
    return m_textSecondLine;
}

bool MenuListElement::checked() const
{
    return m_checked;
}

QUrl MenuListElement::imageIconPath() const
{
    return m_imageIconPath;
}

int MenuListElement::type() const
{
    return m_type;
}


void MenuListElement::setTextFirstLine(const QString &textFirstLine)
{
    if (m_textFirstLine != textFirstLine)
        m_textFirstLine = textFirstLine;
}

void MenuListElement::setTextSecondLine(const QString &textSecondLine)
{
    if (m_textSecondLine != textSecondLine)
        m_textSecondLine = textSecondLine;
}

void MenuListElement::setChecked(const bool &checked)
{
    if (m_checked != checked)
        m_checked = checked;
}

void MenuListElement::setImageIconPath(const QUrl &imageIconPath)
{
    if (m_imageIconPath != imageIconPath)
        m_imageIconPath = imageIconPath;
}

void MenuListElement::setType(const int &type)
{
    if (m_type != type)
        m_type = type;
}

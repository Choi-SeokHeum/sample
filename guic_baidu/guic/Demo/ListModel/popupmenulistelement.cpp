#include "popupmenulistelement.h"
#include "abstractlistelement.h"

//PopupMenuListElement::PopupMenuListElement(const bool &enabled, const bool &expanded
//                             , const QString &value, const QString &path, const int &type)
//    : AbstractListElement(enabled, expanded), m_value(value), m_path(path), m_type(type)
//{
//}

PopupMenuListElement::PopupMenuListElement(const bool &enabled,
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

QString PopupMenuListElement::textFirstLine() const
{
    return m_textFirstLine;
}

QString PopupMenuListElement::textSecondLine() const
{
    return m_textSecondLine;
}

bool PopupMenuListElement::checked() const
{
    return m_checked;
}

QUrl PopupMenuListElement::imageIconPath() const
{
    return m_imageIconPath;
}

int PopupMenuListElement::type() const
{
    return m_type;
}

void PopupMenuListElement::setTextFirstLine(const QString &textFirstLine)
{
    if (m_textFirstLine != textFirstLine)
        m_textFirstLine = textFirstLine;
}

void PopupMenuListElement::setTextSecondLine(const QString &textSecondLine)
{
    if (m_textSecondLine != textSecondLine)
        m_textSecondLine = textSecondLine;
}

void PopupMenuListElement::setChecked(const bool &checked)
{
    if (m_checked != checked)
        m_checked = checked;
}

void PopupMenuListElement::setImageIconPath(const QUrl &imageIconPath)
{
    if (m_imageIconPath != imageIconPath)
        m_imageIconPath = imageIconPath;
}

void PopupMenuListElement::setType(const int &type)
{
    if (m_type != type)
        m_type = type;
}

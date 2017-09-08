#include "turnlistelement.h"
#include "abstractlistelement.h"

TurnListElement::TurnListElement(const bool &enabled,
                                 const bool &expanded,
                                 const QString &textBifurcation,
                                 const QString &textFirstLine,
                                 const QString &textSecondLine,
                                 const QString &textPrice,
                                 const QString &textDistance,
                                 const QUrl &imageIcon,
                                 const QVariantList &imageIconList,
                                 const int &type)
    : AbstractListElement(enabled, expanded),
      m_textBifurcation(textBifurcation),
      m_textFirstLine(textFirstLine),
      m_textSecondLine(textSecondLine),
      m_textPrice(textPrice),
      m_textDistance(textDistance),
      m_imageIcon(imageIcon),
      m_imageIconList(imageIconList),
      m_type(type)
{
}

QString TurnListElement::textBifurcation() const
{
    return m_textBifurcation;
}

QString TurnListElement::textFirstLine() const
{
    return m_textFirstLine;
}

QString TurnListElement::textSecondLine() const
{
    return m_textSecondLine;
}

QString TurnListElement::textPrice() const
{
    return m_textPrice;
}

QString TurnListElement::textDistance() const
{
    return m_textDistance;
}

QUrl TurnListElement::imageIcon() const
{
    return m_imageIcon;
}

QVariantList TurnListElement::imageIconList() const
{
    return m_imageIconList;
}

int TurnListElement::type() const
{
    return m_type;
}

void TurnListElement::setTextBifurcation(const QString &textBifurcation)
{
    if (m_textBifurcation != textBifurcation)
        m_textBifurcation = textBifurcation;
}

void TurnListElement::setTextFirstLine(const QString &textFirstLine)
{
    if (m_textFirstLine != textFirstLine)
        m_textFirstLine = textFirstLine;
}

void TurnListElement::setTextSecondLine(const QString &textSecondLine)
{
    if (m_textSecondLine != textSecondLine)
        m_textSecondLine = textSecondLine;
}

void TurnListElement::setTextPrice(const QString &textPrice)
{
    if (m_textPrice != textPrice)
        m_textPrice = textPrice;
}

void TurnListElement::setTextDistance(const QString &textDistance)
{
    if (m_textDistance != textDistance)
        m_textDistance = textDistance;
}

void TurnListElement::setImageIcon(const QUrl &imageIcon)
{
    if (m_imageIcon != imageIcon)
        m_imageIcon = imageIcon;
}

void TurnListElement::setImageIconList(const QVariantList &imageIconList)
{
    if (m_imageIconList != imageIconList)
        m_imageIconList = imageIconList;
}

void TurnListElement::setType(const int &type)
{
    if (m_type != type)
        m_type = type;
}

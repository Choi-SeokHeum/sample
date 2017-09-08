#include "abstractlistelement.h"
#include <QDebug>

AbstractListElement::AbstractListElement(const bool &enabled, const bool &expanded)
    : m_enabled(enabled), m_expanded(expanded)
{
}

bool AbstractListElement::enabled() const
{
    return m_enabled;
}

bool AbstractListElement::expanded() const
{
    return m_expanded;
}

void AbstractListElement::setEnabled(const bool &enabled)
{
    if (m_enabled != enabled)
        m_enabled = enabled;
}

void AbstractListElement::setExpanded(const bool &expanded)
{
    if (m_expanded != expanded)
        m_expanded = expanded;
}

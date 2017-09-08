#ifndef ABSTRACTLISTELEMENT_H
#define ABSTRACTLISTELEMENT_H

#include <QStringList>

class AbstractListElement
{
public:
    AbstractListElement(const bool &enabled, const bool &expanded);

    bool enabled() const;
    bool expanded() const;

    void setEnabled(const bool &enabled);
    void setExpanded(const bool &expanded);

private:
    bool m_enabled;
    bool m_expanded;
};

#endif // ABSTRACTLISTELEMENT_H

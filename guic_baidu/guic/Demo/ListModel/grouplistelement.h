#ifndef GROUPLISTELEMENT_H
#define GROUPLISTELEMENT_H

#include "abstractlistelement.h"
#include <QUrl>

class GroupListElement: public AbstractListElement
{
public:
    GroupListElement(const bool &enabled,
                     const bool &expanded,
                     const QString &textFirstLine,
                     const QString &textSecondLine,
                     const QString &textThirdLine,
                     const int &type);

    QString textFirstLine() const;
    QString textSecondLine() const;
    QString textThirdLine() const;
    int type() const;

    void setTextFirstLine(const QString &textFirstLine);
    void setTextSecondLine(const QString &textSecondLine);
    void setTextThirdLine(const QString &textThirdLine);
    void setType(const int &type);


private:
    QString m_textFirstLine;
    QString m_textSecondLine;
    QString m_textThirdLine;
    int m_type;
};

#endif // GROUPLISTELEMENT_H

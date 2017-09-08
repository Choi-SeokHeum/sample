#ifndef POPUPMENULISTELEMENT_H
#define POPUPMENULISTELEMENT_H

#include "abstractlistelement.h"
#include <QUrl>

class PopupMenuListElement: public AbstractListElement
{
public:
    PopupMenuListElement(const bool &enabled,
                         const bool &expanded,
                         const QString &textFirstLine,
                         const QString &textSecondLine,
                         const bool &m_checked,
                         const QUrl &m_imageIconPath,
                         const int &type);

    QString textFirstLine() const;
    QString textSecondLine() const;
    bool checked() const;
    QUrl imageIconPath() const;
    int type() const;

    void setTextFirstLine(const QString &textFirstLine);
    void setTextSecondLine(const QString &textSecondLine);
    void setChecked(const bool &checked);
    void setImageIconPath(const QUrl &imageIconPath);
    void setType(const int &type);

private:
    QString m_textFirstLine;
    QString m_textSecondLine;
    bool m_checked;
    QUrl m_imageIconPath;
    int m_type;
};

#endif // POPUPMENULISTELEMENT_H

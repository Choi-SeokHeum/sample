#ifndef LISTELEMENT_H
#define LISTELEMENT_H

#include "abstractlistelement.h"
#include <QUrl>

class ListElement: public AbstractListElement
{
public:
    ListElement(const bool &enabled,
                const bool &expanded,
                const QString &textDistance,
                const QString &textFirstLine,
                const QString &textSecondLine,
                const bool &m_checked,
                const QUrl &m_imageIconPath,
                const QUrl &m_imageDirectionPath,
                const int &type);

    QString textDistance() const;
    QString textFirstLine() const;
    QString textSecondLine() const;
    bool checked() const;
    QUrl imageIconPath() const;
    QUrl imageDirectionPath() const;
    int type() const;

    void setTextDistance(const QString &textDistance);
    void setTextFirstLine(const QString &textFirstLine);
    void setTextSecondLine(const QString &textSecondLine);
    void setChecked(const bool &checked);
    void setImageIconPath(const QUrl &imageIconPath);
    void setImageDirectionPath(const QUrl &imageDirectionPath);
    void setType(const int &type);

private:
    QString m_textDistance;
    QString m_textFirstLine;
    QString m_textSecondLine;
    bool m_checked;
    QUrl m_imageIconPath;
    QUrl m_imageDirectionPath;
    int m_type;
};

#endif // LISTELEMENT_H

#ifndef TURNLISTELEMENT_H
#define TURNLISTELEMENT_H

#include "abstractlistelement.h"
#include <QUrl>
#include <QVariantList>

class TurnListElement: public AbstractListElement
{
public:
    TurnListElement(const bool &enabled,
                    const bool &expanded,
                    const QString &textBifurcation,
                    const QString &textFirstLine,
                    const QString &textSecondLine,
                    const QString &textPrice,
                    const QString &textDistance,
                    const QUrl &imageIcon,
                    const QVariantList &imageIconList,
                    const int &type);

    QString textBifurcation() const;
    QString textFirstLine() const;
    QString textSecondLine() const;
    QString textPrice() const;
    QString textDistance() const;
    QUrl imageIcon() const;
    QVariantList imageIconList() const;
    int type() const;

    void setTextBifurcation(const QString &textBifurcation);
    void setTextFirstLine(const QString &textFirstLine);
    void setTextSecondLine(const QString &textSecondLine);
    void setTextPrice(const QString &textPrice);
    void setTextDistance(const QString &textDistance);
    void setImageIcon(const QUrl &imageIcon);
    void setImageIconList(const QVariantList &imageIconList);
    void setType(const int &type);


private:
    QString m_textBifurcation;
    QString m_textFirstLine;
    QString m_textSecondLine;
    QString m_textPrice;
    QString m_textDistance;
    QUrl m_imageIcon;
    QVariantList m_imageIconList;
    int m_type;
};

//TextBifurcationRole = GROUPLIST_ROLENUMBER,
//TextFirstLineRole,
//TextSecondLineRole,
//TextPriceRole,
//ImageIconListRole,
//TypeRole

#endif // TURNLISTELEMENT_H

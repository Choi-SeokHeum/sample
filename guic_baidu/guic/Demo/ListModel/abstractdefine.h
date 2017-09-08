#ifndef ABSTRACTDEFINE_H
#define ABSTRACTDEFINE_H

#include <QObject>

#define ABSTRACT_ROLENUMBER Qt::UserRole + 1
#define POPUPMENU_ROLENUMBER Qt::UserRole + 10
#define LIST_ROLENUMBER Qt::UserRole + 20
#define MENU_ROLENUMBER Qt::UserRole + 30
#define GROUPLIST_ROLENUMBER Qt::UserRole + 40
#define ROUTEINFO_ROLENUMBER Qt::UserRole + 50
#define TURNLIST_ROLENUMBER Qt::UserRole + 60

class AbstractDefine : public QObject{
    Q_OBJECT
    Q_ENUMS(SOURCE)

public:
    enum ModelRoles {
        EnabledRole = ABSTRACT_ROLENUMBER,
        ExpandedRole
    };
};

#endif // ABSTRACTDEFINE_H

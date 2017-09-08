#ifndef ABSTRACTDEFINE_H
#define ABSTRACTDEFINE_H

#include <QObject>
//#define START_ROLE_NUMBER Qt::UserRole + 3

class AbstractDefine : public QObject{
    Q_OBJECT
    Q_ENUMS(SOURCE)

public:
    enum ModelRoles {
        Enabled = Qt::UserRole + 1,
        Value,
        Path
    };
};

#endif // ABSTRACTDEFINE_H

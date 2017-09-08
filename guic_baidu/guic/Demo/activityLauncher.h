#ifndef WINDOWHOME_H
#define WINDOWHOME_H

#include "activity.h"
#include <QDebug>

class ActivityLauncher :public Activity
{
    Q_OBJECT

public:
    explicit ActivityLauncher(Activity* parent = Q_NULLPTR);
    ~ActivityLauncher();

public:
    virtual void onCreated();
    virtual void onStarted();
    virtual void onResumed();
    virtual void onPaused();
//    virtual void onStoped();
//    virtual void onDestoryed();

private slots:
    void onClicked(int index);
};


#endif // WINDOWHOME_H

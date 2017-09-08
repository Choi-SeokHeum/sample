#ifndef ACTIVITYEXAMPLE_H
#define ACTIVITYEXAMPLE_H
#include "activity.h"



class ActivityExample : public Activity
{
    Q_OBJECT

public:
    explicit ActivityExample(Activity* parent = Q_NULLPTR);
    ~ActivityExample();


public:
    virtual void onCreated();
    virtual void onStarted();
    virtual void onResumed();
    virtual void onPaused();
//    virtual void onStoped();
//    virtual void onDestoryed();

public slots:
    void backButton();

};

#endif // ACTIVITYEXAMPLE_H

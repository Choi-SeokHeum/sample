TEMPLATE = app

QT += qml quick quick-private
CONFIG += c++11

SOURCES += \
main.cpp\
activity.ipp\
activityLauncher.cpp\
activitymanager.cpp\
    activitylist.cpp \
    ListModel/abstractlistmodel.cpp \
    ListModel/abstractlistelement.cpp \
    ListModel/popupmenulistmodel.cpp \
    ListModel/popupmenulistelement.cpp \
    ListModel/turnlistmodel.cpp \
    ListModel/turnlistelement.cpp \
    ListModel/routeinfolistelement.cpp \
    ListModel/routeinfolistmodel.cpp \
    ListModel/listmodel.cpp \
    ListModel/listelement.cpp \
    ListModel/grouplistmodel.cpp \
    ListModel/grouplistelement.cpp \
    ListModel/menulistmodel.cpp \
    ListModel/menulistelement.cpp \
    activityexample.cpp

RESOURCES += \
qml.qrc \
#image.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
activity.h\
activityLauncher.h\
activitymanager.h\
    activitylist.h \
    ListModel/abstractlistmodel.h \
    ListModel/abstractlistelement.h \
    ListModel/abstractdefine.h \
    ListModel/popupmenulistmodel.h \
    ListModel/popupmenulistelement.h \
    ListModel/turnlistmodel.h \
    ListModel/turnlistelement.h \
    ListModel/routeinfolistelement.h \
    ListModel/routeinfolistmodel.h \
    ListModel/listmodel.h \
    ListModel/listelement.h \
    ListModel/grouplistmodel.h \
    ListModel/grouplistelement.h \
    ListModel/menulistmodel.h \
    ListModel/menulistelement.h \
    activityexample.h

DISTFILES +=


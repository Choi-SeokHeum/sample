QT += core
QT -= gui

CONFIG += c++11

TARGET = cdl-daemon
CONFIG += console
CONFIG -= app_bundle

TEMPLATE = app

SRC_PATH = $$PWD/src/

INCLUDEPATH += src/
INCLUDEPATH += include/

SOURCES += \
        $$SRC_PATH/btree.c \
        $$SRC_PATH/rvi.c \
        $$SRC_PATH/rvi_list.c \
	$$PWD/examples/interactive.c \

HEADERS += \
        $$SRC_PATH/btree.h \
        $$SRC_PATH/rvi.h \
        $$SRC_PATH/rvi_list.h \

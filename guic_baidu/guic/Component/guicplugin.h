#ifndef GUIC_PLUGIN_H
#define GUIC_PLUGIN_H

#include <QQmlExtensionPlugin>

class GuicPlugin : public QQmlExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID "org.qt-project.Qt.QQmlExtensionInterface")

public:
    void registerTypes(const char *uri);
};

#endif // GUIC_PLUGIN_H

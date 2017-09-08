import QtQuick 2.0

Loader {
    id: loader
    objectName: "loader"
    width: listView.width
    height: listView.height/3
    sourceComponent: createSpriteObjects(type, listView)

    property bool myEnabled//: model.myEnabled
    property bool myExpanded//: model.myExpanded
    property int myIndex//: model.index

    function createSpriteObjects(type, parent) {
        var delegateUrl = retDelegate(type)
        var component = Qt.createComponent(delegateUrl);

        if (component.status === Component.Ready)
            return finishCreation(component, parent);
        else
            component.statusChanged.connect(finishCreation);
    }

    function finishCreation(component, parent) {
        if (component.status === Component.Ready) {
            var object = component.createObject(parent)

            if (object === null) {
                console.log("Error creating object");
                return null
            }
            else {
                return object
            }
        } else if (component.status === Component.Error) {
            // Error Handling
            console.log("Error loading component:", component.errorString());
        }
    }

    function retDelegate(type)
    {
        switch (type)
        {
        case 0: return "qrc:///Delegate/RouteInfo/DelegateRouteInfo.qml"
        }
    }
}

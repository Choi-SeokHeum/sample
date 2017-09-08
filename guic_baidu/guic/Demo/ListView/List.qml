import IVIS.Component 1.0
import QtQuick 2.0
import "../DelegateSelector"

TListView {
    id: listView
    objectName: "listView"
    width: 1205
    height: 110 * 5
    clip: true
    snapMode: ListView.SnapToItem
    pageChangePolicy: true
    countInView: 5

    delegate: DelegateSelectorList {
        myEnabled: model.myEnabled
        myExpanded: model.myExpanded
        myIndex: model.index
    }

    /*Loader {
        id: loader
        objectName: "loader"
        width: listView.width
        height: listView.height/5
        sourceComponent: createSpriteObjects(type, listView)

        property bool myEnabled: model.myEnabled
        property bool myExpanded: model.myExpanded
        property int index: model.index
    }*/
}

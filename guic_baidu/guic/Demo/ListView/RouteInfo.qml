import IVIS.Component 1.0
import QtQuick 2.0
import "../DelegateSelector"

TListView {
    id: listView
    objectName: "listView"
    width: 482
    height: 591
    clip: true
    snapMode: ListView.SnapToItem
    pageChangePolicy: true
    countInView: 3

    delegate: DelegateSelectorRouteInfo {
        myEnabled: model.myEnabled
        myExpanded: model.myExpanded
        myIndex: model.index
    }
}

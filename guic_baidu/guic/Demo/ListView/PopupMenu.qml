import IVIS.Component 1.0
import QtQuick 2.0
import "../DelegateSelector"

TListView {
    id: listView
    objectName: "listView"
    width: 443
    height: 624
    clip: true
    snapMode: ListView.SnapToItem
    pageChangePolicy: false
    countInView: 6

    delegate: DelegateSelectorPopupMenu {
        myEnabled: model.myEnabled
        myExpanded: model.myExpanded
        myIndex: model.index
    }
}

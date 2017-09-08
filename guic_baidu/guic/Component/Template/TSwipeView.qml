import QtQuick 2.0

TListView {
    id : tSwipeView
    objectName: "tSwipeView"

    width: 720*1.2
    height: 720
    snapMode: TListView.SnapOneItem
    orientation: TListView.Horizontal
    highlightMoveDuration: 250
    onFlickEnded: {
        if ( orientation === ListView.Horizontal)
            currentIndex = contentX/width
        else
            currentIndex = contentY/height
    }
    highlightRangeMode: TListView.StrictlyEnforceRange
    preferredHighlightBegin: 0
    preferredHighlightEnd: 0

    delegate: Component{
        id : delegate

        Item{
            id : tSwipeVeiwItem
            objectName: "tSwipeVeiwItem = " + index
            width: tSwipeView.width
            height: tSwipeView.height

            Component.onDestruction: console.log(tSwipeVeiwItem.objectName+" onDestruction")
            Component.onCompleted: {
                var component = Qt.createComponent(qml)
                console.log(tSwipeVeiwItem.objectName+" create "+qml)

                if ( component.status === Component.Ready )
                {
                    var item = component.createObject(tSwipeVeiwItem);
                    item.parent = tSwipeVeiwItem
                }
                else
                {
                    console.log("error = " + component.status)
                }
            }
        }
    }
}


import QtQuick 2.0

ListView {
    id: listView
    focus: false
    snapMode: ListView.SnapOneItem

    signal add()
    signal remove(int currentIndex)
    signal reorder(int sourceIndex, int destindex)

    onMovementEnded: {
//        if ( !isCurrentIndexInView() )
//        {
//            var i = listView.checkNextIndex(listView.topIndexOfView - 1)

//            if (i !== listView.undefinedIndexValue)
//                listView.currentIndex = listView.checkNextIndex(listView.topIndexOfView - 1)
//        }

//        if (!isCurrentIndexInView())
//        {
//            listView.currentIndex = getTopItemIndex()

//            if (listView.currentIndex === -1)
//            {
//                var index
//                if (listView.orientation === Qt.Vertical)
//                    index = listView.indexAt(0, listView.contentY + 1 + listView.height/countInView)
//                else if (listView.orientation === Qt.Horizontal)
//                    index = listView.indexAt(listView.contentX + 1 + listView.height/countInView, 0)

//                index = checkNextIndex(index - 1)
//                listView.currentIndex = index
//            }
//        }
    }

    interactive: !listView.hardKeyPressed
    highlightMoveDuration: 0
    //cacheBuffer: 2000
    orientation: Qt.Vertical

    property bool myFocus: false

    property bool removeEnabled: false
    property bool reorderEnabled: false

    property bool hardKeyPressed: false
    property int countInView: (listView.orientation === Qt.Vertical)
                              ? listView.height / listView.itemHeight
                              : listView.width / listView.itemWidth

    property int itemHeight
    property bool pageChangePolicy: false

    readonly property int undefinedIndexValue: -1

    property bool autoIncrease: false
    property bool autoDecrease: false

    property int selectedIndex: 0

    signal enterPressed()
    signal enterReleased()
    signal itemClicked(int index)
    signal itemPressed(int index)

//    onContentYChanged: {
//        //console.log("contentY: ", contentY)
//    }

//    onModelChanged: {
//        //listView.currentIndex = 0
//    }

//    onCurrentIndexChanged: {
////        var i = listView.checkNextIndex(listView.currentIndex)

////        if (i === listView.undefinedIndexValue)
////            i = listView.checkPreviousIndex(listView.currentIndex)

////        listView.currentIndex = i
//    }

    onEnterPressed: {
        listView.itemAt(0, listView.currentIndex*listView.itemHeight).onPressed()

        if (!listView.dragging && !listView.flicking)
            listView.hardKeyPressed = true
    }

    onEnterReleased: {
        listView.itemAt(0, listView.currentIndex*listView.itemHeight).onReleased()
        listView.hardKeyPressed = false
    }

    Timer {
        id: increaseTimer

        running: listView.autoIncrease
        repeat: true
        interval: 100

        onTriggered: {
            if (listView.getBottomItemIndex() !== listView.count - 1)
            {
                listView.positionViewAtIndex(listView.getBottomItemIndex() + 1, ListView.End)

                delegateModel.model.swapElement(listView.getBottomItemIndex(),
                                listView.getBottomItemIndex() - 1, 1)
            }
        }
    }

    Timer {
        id: decreaseTimer

        running: listView.autoDecrease
        repeat: true
        interval: 100

        onTriggered: {
            if (listView.getTopItemIndex() !== 0)
            {
                listView.positionViewAtIndex(listView.getTopItemIndex() - 1, ListView.Beginning)

                delegateModel.model.swapElement(listView.getTopItemIndex(),
                                                listView.getTopItemIndex() + 1, 1)
            }
        }
    }

    function setCurrentIndex(index, mode)
    {
        listView.positionViewAtIndex(index, mode)
        listView.currentIndex = index
    }

    function pageUp()
    {
        var topItemindex = listView.getTopItemIndex()
        var previousIndex = checkPreviousIndex(topItemindex)

        if (previousIndex === listView.undefinedIndexValue)
            return false

        positionViewAtIndex(topItemindex - Math.ceil((topItemindex - previousIndex)/countInView)
                            , ListView.End)
        listView.currentIndex = previousIndex

        return true
    }

    function pageDown()
    {
        var btmItemindex = listView.getBottomItemIndex()
        var nextIndex = checkNextIndex(btmItemindex)

        if (nextIndex === listView.undefinedIndexValue)
            return false

        positionViewAtIndex(btmItemindex + Math.ceil((nextIndex - btmItemindex)/countInView)
                            , ListView.Beginning)
        listView.currentIndex = nextIndex

        return true
    }

    function increaseCurrentIndex()
    {
        var nextIndex = checkNextIndex(listView.currentIndex)
        var btmItemindex = listView.getBottomItemIndex()

        if (nextIndex === listView.undefinedIndexValue)
            return false

        if (pageChangePolicy)
        {
            if (btmItemindex < nextIndex)
                positionViewAtIndex(btmItemindex + Math.ceil((nextIndex - btmItemindex)/countInView)
                                    , ListView.Beginning)
        }
        else
        {
            if (btmItemindex < nextIndex)
                positionViewAtIndex(nextIndex, ListView.End)
        }

        if (nextIndex === listView.getBottomItemIndex())
        {
            positionViewAtIndex(nextIndex, ListView.End)
        }

        listView.currentIndex = nextIndex
        //listView.incrementCurrentIndex()

        return true
    }

    function decreaseCurrentIndex()
    {
        var previousIndex = checkPreviousIndex(listView.currentIndex)
        var topItemindex = listView.getTopItemIndex()

        if (previousIndex === listView.undefinedIndexValue)
            return false

        if (pageChangePolicy)
        {
            if (previousIndex < topItemindex)
                positionViewAtIndex(topItemindex - Math.ceil((topItemindex - previousIndex)/countInView)
                                    , ListView.End)
        }
        else
        {
            if (previousIndex < topItemindex)
                positionViewAtIndex(previousIndex, ListView.Beginning)
        }

        if (previousIndex === listView.getTopItemIndex())
        {
            positionViewAtIndex(previousIndex, ListView.Beginning)
        }

        listView.currentIndex = previousIndex
        //listView.decrementCurrentIndex()

        return true
    }

    function moveFocusOnTopItem()
    {
        var topItemIndex = listView.getTopItemIndex()
        positionViewAtIndex(topItemIndex, ListView.Beginning)
        currentIndex = topItemIndex
    }

    function moveFocusOnBottomItem()
    {
        var bottomItemIndex = listView.getBottomItemIndex()
        positionViewAtIndex(bottomItemIndex, ListView.End)
        currentIndex = bottomItemIndex
    }

    function checkNextIndex(index)
    {
        var idx = listView.undefinedIndexValue

        for (var i  = index + 1 ; i < listView.count ; i++)
        {
            //if (delegateModel.model.getData(i, 0x101))
            //if ( delegateModel.model.elementEnabled(i) )
            //if (model.get(i).myEnabled)
            //if (delegateModel.model.getData(i, 0x0101))
            if (model.getData(i, 0x0101))
            {
                idx = i;

                return idx
            }
        }

        return idx
    }

    function checkPreviousIndex(index)
    {
        var idx = listView.undefinedIndexValue

        for (var i  = index - 1 ; i >= 0 ; i--)
        {
            //if (delegateModel.model.getData(i, 0x101))
            //if ( delegateModel.model.elementEnabled(i) )
            //if (delegateModel.model.get(i).itemEnabled)
            //if (model.get(i).myEnabled)
            //if (delegateModel.model.getData(i, 0x0101))
            if (model.getData(i, 0x0101))
            {
                idx = i;

                return idx
            }
        }

        return idx
    }

    function isCurrentIndexInView()
    {
        var topItemIndex = listView.getTopItemIndex()
        var btmItemIndex = listView.getBottomItemIndex()

        if (topItemIndex === -1)
            return false

        if (listView.currentIndex >= topItemIndex &&
            listView.currentIndex <= btmItemIndex)
            return true
        else
            return false
    }

    function isAvailableToSwitchPrevPage(previousIndex)
    {
        //enough

        var bottomItem = listView.childAt(0, listView.contentY - listView.height + 1)

        console.log("bottomItem: ", bottomItem)

        if ( bottomItem !== listView.undefinedIndexValue)
            return true
        else
            return false
    }

    function isAvailableToSwitchNextPage(nextIndex)
    {
        //enough

        var topItem = listView.childAt(0, listView.contentY*2 + listView.height - 1)

        console.log("topItem: ", topItem)

        if ( topItem !== listView.undefinedIndexValue)
            return true
        else
            return false
    }

    //
    function getTopItem()
    {
        var item

        if (listView.orientation === Qt.Vertical)
            item = listView.itemAt(0, listView.contentY + 1)
        else if (listView.orientation === Qt.Horizontal)
            item = listView.itemAt(listView.contentX + 1, 0)

        return item
    }

    function getBottomItem()
    {
        var item

        if (listView.orientation === Qt.Vertical)
            item = listView.itemAt(0, listView.contentY + listView.height - 1)
        else if (listView.orientation === Qt.Horizontal)
            item = listView.itemAt(listView.contentX + listView.width - 1, 0)

        return item
    }

    function getTopItemIndex()
    {
        var index

        if (listView.orientation === Qt.Vertical)
            index = listView.indexAt(0, listView.contentY + 1)
        else if (listView.orientation === Qt.Horizontal)
            index = listView.indexAt(listView.contentX + 1, 0)

        return index
    }

    function getBottomItemIndex()
    {
        var index

        if (listView.orientation === Qt.Vertical)
            index = listView.indexAt(0, listView.contentY + listView.height - 1)
        else if (listView.orientation === Qt.Horizontal)
            index = listView.indexAt(listView.contentX + listView.width - 1, 0)

        return index
    }
    //

//    function tempFunc(index)
//    {
//        //console.log("delegateModel.model.data(index) :", delegateModel.model.data(model.index(0, 0),0)/*delegateModel.model.index(6, 0)*/)
//        //console.log("delegateModel.model.data(index) :", delegateModel.model.titleName(index))
//        console.log("delegateModel.model.data(index) :", delegateModel.model.elementEnabled(index))
//    }

    function tempFunc()
    {
        positionViewAtIndex(3, ListView.End)
        listView.currentIndex = 3
    }

    Component.onCompleted: {
    }
}

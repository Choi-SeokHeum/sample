import QtQuick 2.0

Item {
    id : tTabBar
    objectName: "tTabBar"
    width: 800
    height: 100

    property int buttonCount : 1
    property bool autoWidth : false

    property int startX
    property int startY
    property int interval

    onChildrenChanged: {
        reorderItem()
    }


    function reorderItem()
    {
        if (tTabBar.children.length > 1)
        {
            var previousItem = tTabBar.children[tTabBar.children.length - 1]
            var nextItem = tTabBar.children[tTabBar.children.length - 2]

            previousItem.x = nextItem.x + nextItem.width + tTabBar.interval
            previousItem.y = nextItem.y
        }
        else
        {
            var item = tTabBar.children[tTabBar.children.length - 1]
            item.x = startX
            item.y = startY
        }
    }
    function autoSize(tabBarWidth, startX, buttonCount, interval)
    {
        var autoValue = ((tabBarWidth-(startX*2))-((buttonCount-1)*interval))/buttonCount
        return autoValue
    }
}

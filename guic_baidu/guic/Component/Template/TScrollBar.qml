import QtQuick 2.0

TControl {
    id: scrollbar
    objectName: "ScrollBar"

    property bool pressed: false
    property int orientation: Qt.Vertical

    property real size: 0
    property real position: 0
    property bool active: false
    property int minSize: 40

    property var listView

//    signal press(int mouseX, int mouseY)
//    signal release()
//    signal positionChange(int mouseX, int mouseY)

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        objectName: "ScrollbarMouseArea"

        onPressed: privateObject.onPressed(mouseX, mouseY) //scrollbar.pressed(mouseX, mouseY)
        onPositionChanged: privateObject.onPositionChanged(mouseX, mouseY) //scrollbar.positionChanged(mouseX, mouseY)
        onReleased: privateObject.onReleased() //scrollbar.released(mouseX, mouseY)
    }

    property var heightRatio: listView.visibleArea.heightRatio
    property var widthRatio: listView.visibleArea.widthRatio

    property var yPosition: listView.visibleArea.yPosition
    property var xPosition: listView.visibleArea.xPosition

    function resetState(){
        privateObject.onReleased()
    }

    onHeightRatioChanged: {
//        console.log("heightRatio: ", heightRatio)

        if (listView === undefined || isNaN(heightRatio))
            return

        if (orientation === Qt.Vertical)
            privateObject.ratio = scrollbar.heightRatio
        else
            privateObject.ratio = scrollbar.widthRatio
    }

    onWidthRatioChanged: {
//        console.log("widthRatio: ", heightRatio)
        if (listView === undefined || isNaN(widthRatio))
            return

        if (orientation === Qt.Vertical)
            privateObject.ratio = scrollbar.heightRatio
        else
            privateObject.ratio = scrollbar.widthRatio
    }

    onYPositionChanged: {
//        console.log("yPosition: ", yPosition)
        if (listView === undefined || isNaN(yPosition))
            return

        if (orientation === Qt.Vertical)
            privateObject.position = listView.visibleArea.yPosition
        else
            privateObject.position = listView.visibleArea.xPosition
    }

    onXPositionChanged: {
//        console.log("xPosition: ", xPosition)
        if (listView === undefined || isNaN(xPosition))
            return

        if (orientation === Qt.Vertical)
            privateObject.position = listView.visibleArea.yPosition
        else
            privateObject.position = listView.visibleArea.xPosition
    }

    QtObject {
        id: privateObject

        property real ratio//: (orientation === Qt.Vertical) ? listView.visibleArea.heightRatio : listView.visibleArea.widthRatio
        property real position//: (orientation === Qt.Vertical) ? listView.visibleArea.yPosition : listView.visibleArea.xPosition
        property real maxPosition: (orientation === Qt.Vertical) ? scrollbar.height-scrollbar.size : scrollbar.width-scrollbar.size
        property real minPosition: 0
        property bool pressedInArea: false
        property int beforePos: 0

        onRatioChanged: {
//            console.log("ratio: ", ratio)
//            console.log("height: ", listView.height)
//            console.log("size: ", ratio * listView.height)

            if (orientation === Qt.Vertical)
                scrollbar.size = privateObject.ratio * listView.height
            else
                scrollbar.size = privateObject.ratio * listView.width

            if (scrollbar.size < scrollbar.minSize)
                scrollbar.size = scrollbar.minSize
        }

        onPositionChanged: {
            if (!pressed)
            {
                if (scrollbar.size === scrollbar.minSize)
                {
                    if (orientation === Qt.Vertical)
                        scrollbar.position = privateObject.position
                                * (listView.height - scrollbar.size + privateObject.ratio * listView.height)
                    else
                        scrollbar.position = privateObject.position
                                * (listView.width - scrollbar.size + privateObject.ratio * listView.width)
                }
                else
                {
                    if (orientation === Qt.Vertical)
                        scrollbar.position = privateObject.position * listView.height
                    else
                        scrollbar.position = privateObject.position * listView.width
                }
            }
        }

        function onPressed (mouseX, mouseY)
        {
            if (active)
            {
                scrollbar.pressed = true

                if (scrollbar.height === scrollbar.size)
                    return

                if (scrollbar.orientation === Qt.Vertical)
                {
                    if (mouseY >= scrollbar.position && mouseY <= scrollbar.position + scrollbar.size)
                    {
                        privateObject.pressedInArea = true
                        privateObject.beforePos = mouseY
                    }
                    else
                    {
                        var y

                        if (mouseY > maxPosition )
                            y = maxPosition
                        else if (0 > mouseY)
                            y = 0
                        else
                            y = mouseY

                        scrollbar.listView.contentY = (y / maxPosition) * (scrollbar.listView.contentHeight-scrollbar.height)
                        scrollbar.position = y
                    }

                    scrollbar.pressed = true
                }
                else
                {
                    //console.log("Qt.Horizontal")

                    if (mouseX >= scrollbar.position && mouseX <= scrollbar.position + scrollbar.size)
                    {
                        privateObject.pressedInArea = true
                        privateObject.beforePos = mouseX
                    }
                    else
                    {
                        var x

                        if (mouseX > maxPosition )
                            x = maxPosition
                        else if (0 > mouseX)
                            x = 0
                        else
                            x = mouseX

                        scrollbar.listView.contentX = x / maxPosition * (scrollbar.listView.contentWidth-scrollbar.width)
                        scrollbar.position = x
                    }

                    //scrollbar.pressed = true
                }
            }
        }

        function onPositionChanged (mouseX, mouseY)
        {
            if (active)
            {
                if (scrollbar.height === scrollbar.size)
                    return

                if (scrollbar.orientation === Qt.Vertical)
                {
                    //console.log("Qt.Vertical")

                    var y   //for setting listview's contentY and scrollbar's position

                    if (privateObject.pressedInArea)
                    {
                        if (mouseY < 0 || mouseY > scrollbar.height)
                            return

                        y = mouseY - privateObject.beforePos// + scrollbar.position

                        if (scrollbar.position + y > maxPosition )
                        {
                            y = maxPosition
                            scrollbar.listView.contentY = y / maxPosition * (scrollbar.listView.contentHeight-scrollbar.height)
                            scrollbar.position = y
                        }
                        else if (0 > scrollbar.position + y)
                        {
                            y = 0
                            scrollbar.listView.contentY = y / maxPosition * (scrollbar.listView.contentHeight-scrollbar.height)
                            scrollbar.position = y
                        }
                        else
                        {
                            scrollbar.listView.contentY += y / maxPosition * (scrollbar.listView.contentHeight-scrollbar.height)
                            scrollbar.position += y
                        }

                        privateObject.beforePos = mouseY
                    }
                    else
                    {
                        if (mouseY > maxPosition )
                            y = maxPosition
                        else if (0 > mouseY)
                            y = 0
                        else
                            y = mouseY

                        scrollbar.listView.contentY = y / maxPosition * (scrollbar.listView.contentHeight-scrollbar.height)
                        scrollbar.position = y
                    }
                }
                else
                {
                    //console.log("Qt.Horizontal")

                    var x   //for setting listview's contentX and scrollbar's position

                    if (privateObject.pressedInArea)
                    {
                        if ( !(privateObject.maxPosition === privateObject.minPosition) )
                        {
                            if (scrollbar.position + x > maxPosition )
                            {
                                x = maxPosition
                                scrollbar.listView.contentX = x / maxPosition * (scrollbar.listView.contentWidth-scrollbar.width)
                                scrollbar.position = x
                            }
                            else if (0 > scrollbar.position + x)
                            {
                                x = 0
                                scrollbar.listView.contentX = x / maxPosition * (scrollbar.listView.contentWidth-scrollbar.width)
                                scrollbar.position = x
                            }
                            else
                            {
                                scrollbar.listView.contentX += x / maxPosition * (scrollbar.listView.contentWidth-scrollbar.width)
                                scrollbar.position += x
                            }
                        }
                    }
                    else
                    {
                        if (mouseX > maxPosition )
                            x = maxPosition
                        else if (0 > mouseX)
                            x = 0
                        else
                            x = mouseX

                        scrollbar.listView.contentX = x / maxPosition * (scrollbar.listView.contentWidth-scrollbar.width)
                        scrollbar.position = x
                    }
                }
            }
        }

        function onReleased ()
        {
            if (active)
            {
                scrollbar.pressed = false
                privateObject.pressedInArea = false
            }
        }
    }
}

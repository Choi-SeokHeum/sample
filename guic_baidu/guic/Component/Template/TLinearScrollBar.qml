import QtQuick 2.0

TScrollBar {
    id: linearScrollBar
    objectName: "linearScrollBar"

    property real size: 0
    property real position: 0
    property bool active: false
    property int minSize: 40

    property var listView

    onPress: {
        privateObject.onPressed(mouseX, mouseY)
    }

    onPositionChange: {
        privateObject.onPositionChanged(mouseX, mouseY)
    }

    onRelease: {
        privateObject.onReleased()
    }

    QtObject {
        id: privateObject

        property real ratio: (orientation === Qt.Vertical) ? listView.visibleArea.heightRatio : listView.visibleArea.widthRatio
        property real position: (orientation === Qt.Vertical) ? listView.visibleArea.yPosition : listView.visibleArea.xPosition
        property real maxPosition: (orientation === Qt.Vertical) ? linearScrollBar.height-linearScrollBar.size : linearScrollBar.width-linearScrollBar.size
        property real minPosition: 0
        property bool pressedInArea: false
        property int beforePos: 0

        onRatioChanged: {
//            console.log("ratio: ", ratio)
//            console.log("height: ", listView.height)
//            console.log("size: ", ratio * listView.height)

            if (orientation === Qt.Vertical)
                linearScrollBar.size = privateObject.ratio * listView.height
            else
                linearScrollBar.size = privateObject.ratio * listView.width

            if (linearScrollBar.size < linearScrollBar.minSize)
                linearScrollBar.size = linearScrollBar.minSize
        }

        onPositionChanged: {
            if (!pressed)
            {
                if (linearScrollBar.size === linearScrollBar.minSize)
                {
                    if (orientation === Qt.Vertical)
                        linearScrollBar.position = privateObject.position
                                * (listView.height - linearScrollBar.size + privateObject.ratio * listView.height)
                    else
                        linearScrollBar.position = privateObject.position
                                * (listView.width - linearScrollBar.size + privateObject.ratio * listView.width)
                }
                else
                {
                    if (orientation === Qt.Vertical)
                        linearScrollBar.position = privateObject.position * listView.height
                    else
                        linearScrollBar.position = privateObject.position * listView.width
                }
            }
        }

        function onPressed (mouseX, mouseY)
        {
            if (active)
            {
                if (linearScrollBar.orientation === Qt.Vertical)
                {
                    //console.log("Qt.Vertical")

                    if (mouseY >= linearScrollBar.position && mouseY <= linearScrollBar.position + linearScrollBar.size)
                    {
                        privateObject.pressedInArea = true
                        privateObject.beforePos = mouseY

                        linearScrollBar.listView.contentY = linearScrollBar.position / maxPosition * (linearScrollBar.listView.contentHeight-linearScrollBar.height)
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

                        linearScrollBar.listView.contentY = y / maxPosition * (linearScrollBar.listView.contentHeight-linearScrollBar.height)
                        linearScrollBar.position = y
                    }

                    linearScrollBar.pressed = true
                }
                else
                {
                    //console.log("Qt.Horizontal")

                    if (mouseX >= linearScrollBar.position && mouseX <= linearScrollBar.position + linearScrollBar.size)
                    {
                        privateObject.pressedInArea = true
                        privateObject.beforePos = mouseX

                        linearScrollBar.listView.contentX = linearScrollBar.position / maxPosition * (linearScrollBar.listView.contentWidth-linearScrollBar.width)
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

                        linearScrollBar.listView.contentX = x / maxPosition * (linearScrollBar.listView.contentWidth-linearScrollBar.width)
                        linearScrollBar.position = x
                    }

                    linearScrollBar.pressed = true
                }
            }
        }

        function onPositionChanged (mouseX, mouseY)
        {
            if (active)
            {
                if (linearScrollBar.orientation === Qt.Vertical)
                {
                    //console.log("Qt.Vertical")

                    var y   //for setting listview's contentY and scrollbar's position

                    if (privateObject.pressedInArea)
                    {
                        if ( !(privateObject.maxPosition === privateObject.minPosition) )
                        {
                            y = mouseY - privateObject.beforePos + linearScrollBar.position

                            if (y > maxPosition )
                                y = maxPosition
                            else if (0 > y)
                                y = 0

                            linearScrollBar.listView.contentY = y / maxPosition * (linearScrollBar.listView.contentHeight-linearScrollBar.height)
                            linearScrollBar.position = y

                            if ( mouseY > 0 + linearScrollBar.size/2 && mouseY < listView.height - linearScrollBar.size/2 )
                                privateObject.beforePos = mouseY
                        }
                    }
                    else
                    {
                        if (mouseY > maxPosition )
                            y = maxPosition
                        else if (0 > mouseY)
                            y = 0
                        else
                            y = mouseY

                        linearScrollBar.listView.contentY = y / maxPosition * (linearScrollBar.listView.contentHeight-linearScrollBar.height)
                        linearScrollBar.position = y
                    }
                }
                else
                {
                    //console.log("Qt.Horizontal")

                    var x   //for setting listview's contentY and scrollbar's position

                    if (privateObject.pressedInArea)
                    {
                        if ( !(privateObject.maxPosition === privateObject.minPosition) )
                        {
                            x = mouseX - privateObject.beforePos + linearScrollBar.position

                            if (x > maxPosition )
                                x = maxPosition
                            else if (0 > x)
                                x = 0

                            linearScrollBar.listView.contentX = x / maxPosition * (linearScrollBar.listView.contentWidth-linearScrollBar.width)
                            linearScrollBar.position = x

                            if ( mouseX > 0 + linearScrollBar.size/2 && mouseX < listView.width - linearScrollBar.size/2 )
                                privateObject.beforePos = mouseX
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

                        linearScrollBar.listView.contentX = x / maxPosition * (linearScrollBar.listView.contentWidth-linearScrollBar.width)
                        linearScrollBar.position = x
                    }
                }
            }
        }

        function onReleased ()
        {
            if (active)
            {
                linearScrollBar.pressed = false
                privateObject.pressedInArea = false
            }
        }
    }
}

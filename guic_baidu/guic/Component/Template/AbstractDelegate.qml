import QtQuick 2.0
import QtQml.Models 2.1

Item {
    id: abstractDelegate
    objectName: "AbstractDelegate"

    //anchors { left: parent.left; right: parent.right }
    //height: content.height

    property var listView: parent.parent.parent
    property bool held: false
    //property bool isEnabled: myEnabled
    enabled: myEnabled
    property bool isExpanded: myExpanded
    property int index: myIndex//parent.index

    property bool pressed: false

    signal clicked(int index)
    signal temp()

    //enabled: itemEnabled//delegateModel.model.getData(index, 0x101)//delegateModel.model.elementEnabled(index)

    //focus: abstractDelegate.enabled && (listView.currentIndex === index) && listView.focus
//    property bool myFocus: abstractDelegate.enabled && (listView.currentIndex === index)// && listView.focus
//    property bool mySelected: abstractDelegate.enabled && (listView.selectedIndex === index)
    property bool myFocus: abstractDelegate.enabled && (listView.currentIndex === index) && listView.myFocus
    property bool mySelected: abstractDelegate.enabled && (listView.selectedIndex === index)

    onHeldChanged: {
        if (!held)
        {
            listView.autoIncrease = false
            listView.autoDecrease = false
        }
    }

    onMyFocusChanged: {
        //privateObject.setState()
    }

    onEnabledChanged: {
        privateObject.setState()
    }

    onIsExpandedChanged: {
        if (isExpanded)
        {
            if (index === listView.getBottomItemIndex())
            {
                listView.contentY += listView.itemHeight
                //listView.positionViewAtIndex(index, ListView.End)
            }
        }
        else
        {
            if (index === listView.getBottomItemIndex())
            {
                listView.contentY -= listView.itemHeight
                //listView.positionViewAtIndex(index, ListView.End)
            }
        }
    }

    state: "NORMAL"

    states: [
        State {
            name: "NORMAL"
        },
        State {
            name: "SELECTED"
        },
        State {
            name: "PRESSED"
        },
        State {
            name: "DISABLED"
        },
        State {
            name: "FOCUSED"
        }
    ]

    MouseArea {
        id: mouseArea
        anchors.fill: abstractDelegate
        enabled: listView.interactive && abstractDelegate.enabled

        onPressed: {
            privateObject.onPressed(mouseX, mouseY)
        }

        onReleased: {
            privateObject.onReleased(mouseX, mouseY)
        }

        onCanceled: {
            privateObject.onCanceled(mouseX, mouseY)
        }

        onPressAndHold: {
            privateObject.onPressAndHold(mouseX, mouseY)
        }

        drag.target: held ? content : undefined
        drag.axis: listView.orientation === Qt.Vertical ? Drag.YAxis : Drag.XAxis

//        onMouseYChanged: {
//            if (held)
//            {
//                if (abstractDelegate === listView.getTopItem())
//                {
//                    if (mouseY < 20)
//                    {
//                        if (!listView.autoDecrease)
//                            listView.autoDecrease = true
//                    }
//                    else
//                    {
//                        if (listView.autoDecrease)
//                            listView.autoDecrease = false
//                    }

//                }
//                else if (abstractDelegate === listView.getBottomItem())
//                {
//                    if (mouseY > 60)
//                        if (!listView.autoIncrease)
//                            listView.autoIncrease = true
//                    else
//                        if (listView.autoIncrease)
//                            listView.autoIncrease = false
//                }
//            }
//        }
    }

//    Connections {
//        target: listView

//        onReorderEnabledChanged: {
//            if (listView.reorderEnabled)
//                delegateModel.model.tempFunc(index, false, 0x0102)
//                //delegateModel.model.tempFunc(index, false, 0x0102)
//                //delegateModel.model.get(index).itemExpanded = false
//                //abstractDelegate.expanded = false
//        }

//        onRemoveEnabledChanged: {
//            if (listView.removeEnabled)
//                delegateModel.model.tempFunc(index, false, 0x0102)
//                //delegateModel.model.tempFunc(index, false, 0x0102)
//                //delegateModel.model.get(index).itemExpanded = false
//                //abstractDelegate.expanded = false
//        }

////        onCurrentIndexChanged: {
////            if (!focus)
////            {
////                if (abstractDelegate.enabled)
////                    if (listView.currentIndex === index)
////                        state = "SELECTED"
////                    else
////                        state = "NORMAL"
////                else
////                    state = "DISABLED"
////            }
////        }
//    }

    function onPressed()
    {
        privateObject.onPressed()
    }

    function onReleased()
    {
        privateObject.onReleased()
    }

    QtObject {
        id: privateObject

        function onPressed(mouseX, mouseY) {
            abstractDelegate.state = "PRESSED"
            listView.currentIndex = index

            listView.itemPressed(index)
            //console.log(index)

            //pressed = true
        }

        function onPositionChanged(mouseX, mouseY){

        }

        function onReleased(mouseX, mouseY) {
//            if (listView.currentIndex === index)
//            {
//                abstractDelegate.state = "FOCUSED"
//            }
//            else
//            {
//                //listView.currentIndex = index
//                listView.selectedIndex = index
//            }

            abstractDelegate.state = "FOCUSED"
            listView.selectedIndex = index

            listView.itemClicked(index)
            //pressed = false
        }

        function onCanceled(mouseX, mouseY) {
            if (!myFocus)
                abstractDelegate.state = "NORMAL"
            else
                abstractDelegate.state = "FOCUSED"

            //pressed = false
        }

        function onPressAndHold(mouseX, mouseY){
        }

        function setState() {
            if (!abstractDelegate.enabled)
                abstractDelegate.state = "DISABLED"
            else {
                if (!myFocus)
                {
                    if (abstractDelegate.enabled)
                        if (listView.currentIndex === index)
                            abstractDelegate.state = "SELECTED"
                        else
                            abstractDelegate.state = "NORMAL"
                    else
                        abstractDelegate.state = "DISABLED"
                }
                else
                {
                    if (abstractDelegate.enabled)
                    {
                        abstractDelegate.state = "FOCUSED"
                    }
                    else
                    {
                        abstractDelegate.state = "DISABLED"

                        var i = listView.checkNextIndex(listView.currentIndex)

                        if (i === listView.undefinedIndexValue)
                            i = listView.checkPreviousIndex(listView.currentIndex)

                        listView.currentIndex = i
                    }
                }
            }
        }
    }

    Component.onCompleted: {
        privateObject.setState()
        listView = parent.parent.parent

        if (listView.orientation === Qt.Vertical)
        {
            anchors.left = parent.left
            anchors.right = parent.right
        }
        else if (listView.orientation === Qt.Horizontal)
        {
            anchors.top = parent.top
            anchors.bottom = parent.bottom
        }

//        console.log("Abstractdelegate--------------------------")
//        console.log("parent.index: ", parent.index)
//        console.log("enabled: ", enabled)
//        console.log("isExpanded", isExpanded)
//        console.log("listView.objectName", listView.objectName)

//        console.log("parent.objectName: ", parent.objectName)

//        console.log(abstractDelegate.enabled)
    }
}

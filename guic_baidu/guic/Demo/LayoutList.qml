import QtQuick 2.6
//import QtQuick.Window 2.2
import IVIS.Component 1.0
import "./ListView"

Item {
    id: root
    objectName: "root"
    width: 1280
    height: 720
    visible: true

    Rectangle {
        anchors.fill: parent
        color: "black"
    }

    FocusGroup {
        id: focusGroup

        Component.onCompleted: {
            focusGroup.registerItem(listView1, 0, 0)
            focusGroup.registerItem(listView2, 0, 1)

            FocusGroupManager.registerFocusGroup(focusGroup)
            FocusGroupManager.moveGroupFocusByID(focusGroup)
        }
    }

//    Menu {
//        id: listView1
//        objectName: "listView1"
//        width: 595
//        height: 535
//        clip: true
//        snapMode: ListView.SnapToItem
//        pageChangePolicy: false
//        countInView: 5

//        onItemClicked: {
//            console.log("(onItemClicked) index: ", index)
//        }

//        onItemPressed: {
//            console.log("(onItemPressed) index: ", index)

//            focusGroup.moveFocusSpecificItem("listView1")
//        }
//    }

    TurnList {
        id: listView1
        objectName: "listView1"
        model: listModel
    }

//    GroupList {
//        id: listView1
//        objectName: "listView1"
//        countInView: 3

//        onItemClicked: {
//            console.log("(onItemClicked) index: ", index)
//        }

//        onItemPressed: {
//            console.log("(onItemPressed) index: ", index)

//            focusGroup.moveFocusSpecificItem("listView1")
//        }
//    }

    RouteInfo {
        id: listView
        model: listModel
    }

//    List {
//        id: listView1
//        objectName: "listView1"

//        width: 1205
//        height: 110 * 5

//        countInView: 5

//        onItemClicked: {
//            console.log("(onItemClicked) index: ", index)
//        }

//        onItemPressed: {
//            console.log("(onItemPressed) index: ", index)

//            focusGroup.moveFocusSpecificItem("listView1")
//        }
//    }

//    LinearScrollBar {
//        anchors.left: listView2.right
//        anchors.top: listView2.top
//        anchors.bottom: listView2.bottom
//        listView: listView2
//    }

    CurvedScrollBar {
        anchors.left: listView2.right
        anchors.top: listView2.top
        anchors.bottom: listView2.bottom
        listView: listView2

        image_BackGround: "qrc:///image/scroll_menu_bg.png"
        image_Active: "qrc:///image/scroll_menu.png"
    }

//    PopupMenu {
//        id: listView1
//        objectName: "listView1"

//        onItemClicked: {
//            console.log("(onItemClicked) index: ", index)
//        }

//        onItemPressed: {
//            console.log("(onItemPressed) index: ", index)

//            focusGroup.moveFocusSpecificItem("listView1")
//        }
//    }

    PopupMenu {
        id: listView2
        objectName: "listView2"
        anchors.left: listView1.right

        onItemClicked: {
            console.log("(onItemClicked) index: ", index)
        }

        onItemPressed: {
            console.log("(onItemPressed) index: ", index)

            focusGroup.moveFocusSpecificItem("listView2")
        }
    }

    ListModel {
        id: listModel
    }

    Rectangle {
        width: 50
        height: 50
        anchors.right: parent.right
        anchors.bottom: rectIncreaseIndex.top
        color: "green"

        Text {
            anchors.fill: parent
            font.pixelSize: 40
            text: "↑"

            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                listView1.decreaseCurrentIndex()
            }
        }
    }

    Rectangle {
        id: rectIncreaseIndex
        width: 50
        height: 50
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        color: "green"

        Text {
            anchors.fill: parent
            font.pixelSize: 40
            text: "↓"

            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                listView1.increaseCurrentIndex()
            }
        }
    }

    Rectangle {
        id: backButton
        objectName: "BackButton"
        width: 50
        height: 50

        anchors.right: parent.right
        anchors.top: parent.top

        signal clicked

        Text {
            anchors.centerIn: parent
            font.pixelSize: 40
            text: "←"
        }

        MouseArea {
            anchors.fill: parent
            onClicked:
            {
                console.log("onCLicked")
                backButton.clicked()
            }
        }
    }

    Component.onCompleted: {
        var type

        for (var i = 0 ; i < 10 ; i ++)
        {
//            type = Math.ceil(Math.random() * 10) % 4
            type = 1
            listModel.append ({"name": "temp", "myEnabled": true, "myExpanded": false, "type": type, "category": "category"})
        }

        listModel.append ({"name": "temp", "myEnabled": true, "myExpanded": false, "type": 0, "category": "category"})
        listModel.append ({"name": "temp", "myEnabled": true, "myExpanded": false, "type": 1, "category": "category"})
        listModel.append ({"name": "temp", "myEnabled": true, "myExpanded": false, "type": 2, "category": "category"})
        listModel.append ({"name": "temp", "myEnabled": true, "myExpanded": false, "type": 4, "category": "category1"})
        listModel.append ({"name": "temp", "myEnabled": true, "myExpanded": false, "type": 3, "category": "category1"})
        listModel.append ({"name": "temp", "myEnabled": true, "myExpanded": false, "type": 3, "category": "category1"})
        listModel.append ({"name": "temp", "myEnabled": true, "myExpanded": false, "type": 1, "category": "category1"})
        listModel.append ({"name": "temp", "myEnabled": true, "myExpanded": false, "type": 2, "category": "category1"})
        listModel.append ({"name": "temp", "myEnabled": false, "myExpanded": false, "type": 4, "category": "category1"})
        listModel.append ({"name": "temp", "myEnabled": true, "myExpanded": false, "type": 3, "category": "category1"})
        listModel.append ({"name": "temp", "myEnabled": true, "myExpanded": false, "type": 3, "category": "category2"})
        listModel.append ({"name": "temp", "myEnabled": true, "myExpanded": false, "type": 2, "category": "category2"})
        listModel.append ({"name": "temp", "myEnabled": true, "myExpanded": false, "type": 1, "category": "category2"})
        listModel.append ({"name": "temp", "myEnabled": true, "myExpanded": false, "type": 2, "category": "category2"})
        listModel.append ({"name": "temp", "myEnabled": true, "myExpanded": false, "type": 2, "category": "category2"})
        listModel.append ({"name": "temp", "myEnabled": true, "myExpanded": false, "type": 3, "category": "category2"})
        listModel.append ({"name": "temp", "myEnabled": true, "myExpanded": false, "type": 1, "category": "category2"})
    }

    Component.onDestruction: {
        FocusGroupManager.unregisterFocusGroupByID(focusGroup)
    }
}

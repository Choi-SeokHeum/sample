import QtQuick 2.6
//import QtQuick.Window 2.2
import IVIS.Component 1.0
import "./ListView"

Item {
    id: root
    objectName: "root"
    width: 443
    height: 624
    visible: true

    Rectangle {
        anchors.fill: parent
        color: "black"
    }

    PopupMenu {
        id: listView
        objectName: "listView"
        width: 443
        height: 624
        clip: true
        snapMode: ListView.SnapToItem
        pageChangePolicy: false
        countInView: 5

        model: listModel
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
                listView.decreaseCurrentIndex()
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
                listView.increaseCurrentIndex()
            }
        }
    }

    Component.onCompleted: {
        var type

//        for (var i = 0 ; i < 10 ; i ++)
//        {
//            type = Math.ceil(Math.random() * 10) % 4
//            listModel.append ({"name": "temp", "myEnabled": true, "myExpanded": false, "type": type, "category": "category"})
//        }
        listModel.append ({"name": "temp", "myEnabled": false, "myExpanded": false, "type": 4, "category": "category1"})
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

        listView.currentIndex = 1
    }
}

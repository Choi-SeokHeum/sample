import QtQuick 2.6
//import QtQuick.Window 2.2
import IVIS.Component 1.0
import "./ListView"

Item {
    id: root
    objectName: "root"
    width: 1205
    height: 110 * 5
    visible: true

    Rectangle {
        anchors.fill: parent
        color: "black"
    }

    List {
        id: listView
        objectName: "listView"
        width: 1205
        height: 110 * 5
        clip: true
        snapMode: ListView.SnapToItem
        pageChangePolicy: true
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

        for (var i = 0 ; i < 2000 ; i ++)
        {
            type = Math.ceil(Math.random() * 10) % 5
            listModel.append ({"name": "temp", "myEnabled": true, "myExpanded": false, "type": type})
        }

        //FocusGroupManager.moveGroupFocusByObjectName("wef")
    }
}

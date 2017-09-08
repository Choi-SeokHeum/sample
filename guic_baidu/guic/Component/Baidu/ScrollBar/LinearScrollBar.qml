import QtQuick 2.0
import IVIS.Component 1.0

TScrollBar {
    id: linearScrollBar
    objectName: "LinearScrollBar"

    width: 4
    height: 100

    Rectangle {
        id: background
        anchors.fill: parent
        color: "#ebeced"
    }

    Rectangle {
        id: handle

        y: parent.position

        width: !linearScrollBar.pressed ? parent.width : parent.width*1.05
        height: parent.size
        anchors.horizontalCenter: parent.horizontalCenter

        radius: 1
//        color: linearScrollBar.pressed ? "#cacaca" : "white"
        color: !linearScrollBar.pressed ? "#343435" : "#e5021a"
    }
}

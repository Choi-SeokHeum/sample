import QtQuick 2.0
import Qt.labs.controls 1.0
//import IVIS.Component 1.0

Item {
    id: layoutLauncher
    objectName: "LayoutLauncher"
    visible: true
    width: (720 * 1.2)
    height: 720

    signal clicked(int index)

    property bool skipIntro: false
    property int index: -1
    property bool componentHelperVisible: false

    Rectangle {
        anchors.fill: parent
        color: "gray"

        opacity: drawer.position / 1
    }

    Item {
        id: drawer
        width: 260-8//0.30 * layoutLauncher.width
        height: layoutLauncher.height
        parent: layoutLauncher

        anchors.horizontalCenter: parent.horizontalCenter

        ListView {
            id: listView
            width: drawer.width
            height: drawer.height
            snapMode: ListView.SnapOneItem
            orientation: Qt.Vertical

            Rectangle {
                z: -1
                width: drawer.width
                height: drawer.height
                color: "white"
            }

            model: ListModel {
                ListElement {name: "List"}
                ListElement {name: "Focus Button"}
            }

            delegate: Component {
                Item {
                    width: listView.width
                    height: listView.height/10

                    Rectangle {
                        id: rect
                        anchors.fill: parent
                        color: mouseArea.pressed? "red" : "white"
//                        color: (listView.currentIndex === index) ? DemoAppDefine.color_Disabled :
//                                                                   mouseArea.pressed ? DemoAppDefine.color_Pressed :
//                                                                                       DemoAppDefine.color_white

                        Behavior on color {
                            enabled: true
                            ColorAnimation { duration: 150 }
                        }
                        Behavior on opacity {
                            enabled: true
                            NumberAnimation { duration: 150 }
                        }
                    }

                    Text {
                        anchors.fill: parent
                        font.pixelSize: 20
                        text: model.name

                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter

                        anchors.leftMargin: 15

                        font.family: "SpoqaHanSans"
                    }

                    MouseArea {
                        id: mouseArea
                        anchors.fill: parent
                        onClicked: {
                            layoutLauncher.clicked(index)
                            listView.currentIndex = index

                            console.log("name: ", name)
                        }

                    }
                }
            }
        }
    }
}

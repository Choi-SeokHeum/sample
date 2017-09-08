import QtQuick 2.0
import IVIS.Component 1.0

TScrollBar {
    id :curvedScrollBar
    width: 46
    height: 491

//    property int size: 30
//    property int position: 60

    property url image_BackGround
    property url image_Active

    Image {
        anchors.fill: curvedScrollBar
        source: image_BackGround //"scroll_menu_bg.png"
    }

    Item {
        width: curvedScrollBar.width
        height: curvedScrollBar.size
        clip: true

        y: curvedScrollBar.position

        Image {
            width: curvedScrollBar.width
            height: curvedScrollBar.height

            source: image_Active //"scroll_menu.png"

            y: -curvedScrollBar.position
        }
    }
}

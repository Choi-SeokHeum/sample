import QtQuick 2.0
import IVIS.Component 1.0

Component {
    AbstractDelegate {
        id: delegateMenuIconText

        width: listView.width //443
        height: listView.height/listView.countInView //104

        property string text_color_normal: "#CCCCCC"
        property string text_color_focused: "#FAFAFA"
        property string text_color_selected: "#FE7E00"
        property string text_color_disabled: "#414141"
        property string text_color_subtitle: "#999999"

        Image {
            width: delegateMenuIconText.width

            source: "qrc:///image/line_menu_list.png"

            anchors.top: delegateMenuIconText.top
            anchors.left: delegateMenuIconText.left
            anchors.right: delegateMenuIconText.right
        }

        Image {
            width: delegateMenuIconText.width

            source: "qrc:///image/line_menu_list.png"

            anchors.bottom: delegateMenuIconText.bottom
            anchors.left: delegateMenuIconText.left
            anchors.right: delegateMenuIconText.right

        }

//        Image {
//            source: "qrc:///imagebtn_mapmenu_f.9.png"
//            anchors.fill: parent
//            visible: (delegateMenuIconText.state === "PRESSED") || (delegateMenuIconText.state === "FOCUSED")
//        }

        BorderImage {
            source: "qrc:///image/btn_mapmenu_f.9.png"
            anchors.fill: parent
            //visible: (delegateMenuIconText.state === "FOCUSED")
            visible: delegateMenuIconText.myFocus && delegateMenuIconText.state !== "PRESSED"

            border.left: 2
            border.right: 2
            border.top: 2
            border.bottom: 2
        }

        BorderImage {
            source: "qrc:///image/btn_mapmenu_p.9.png"
            anchors.fill: parent
            visible: (delegateMenuIconText.state === "PRESSED")

            border.left: 2
            border.right: 2
            border.top: 2
            border.bottom: 2
        }

        Image {
            id: imgIcon

            source: imageIconPath

            anchors.left: delegateMenuIconText.left
            anchors.leftMargin: 20

            anchors.verticalCenter: delegateMenuIconText.verticalCenter
            asynchronous: true
        }

        Text {
            id: txtFirstLine

            width: 343
            height: 44

            anchors.left: parent.left
            anchors.leftMargin: 101

            anchors.top: parent.top
            anchors.topMargin: txtSecondLine.text ? 20 : 38

            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter

            font.pixelSize: 40
            font.family: "CubeR"

            text: textFirstLine

            color: delegateMenuIconText.myFocus ? delegateMenuIconText.text_color_focused : (delegateMenuIconText.mySelected ? delegateMenuIconText.text_color_selected : delegateMenuIconText.text_color_normal)
            font.bold: delegateMenuIconText.mySelected || delegateMenuIconText.myFocus
        }

        Text {
            id: txtSecondLine

            width: 343
            height: 44

            anchors.left: parent.left
            anchors.leftMargin: 101

            anchors.top: parent.top
            anchors.topMargin: 57

            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter

            font.pixelSize: 40
            font.family: "CubeR"


            color: delegateMenuIconText.text_color_subtitle
            font.bold: delegateMenuIconText.mySelected || delegateMenuIconText.myFocus

            text: textSecondLine
        }
    }
}

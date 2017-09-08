import QtQuick 2.0
import IVIS.Component 1.0

Component {
    AbstractDelegate {
        id: delegateMenuTextMore

        width: listView.width //595
        height: listView.height/listView.countInView //107

        property string text_color_normal: "#CCCCCC"
        property string text_color_focused: "#FAFAFA"
        property string text_color_selected: "#FE7E00"
        property string text_color_disabled: "#414141"
        property string text_color_subtitle: "#999999"

        Image {
            source: "qrc:///image/line_menu_list.png"

            anchors.top: delegateMenuTextMore.top
            anchors.left: delegateMenuTextMore.left
            anchors.right: delegateMenuTextMore.right
        }

        Image {
            source: "qrc:///image/line_menu_list.png"

            anchors.bottom: delegateMenuTextMore.bottom
            anchors.left: delegateMenuTextMore.left
            anchors.right: delegateMenuTextMore.right
        }

//        Image {
//            source: "qrc:///imagebtn_mapmenu_f.9.png"
//            anchors.fill: parent
//            visible: (delegateMenuTextMore.state === "PRESSED") || (delegateMenuTextMore.state === "FOCUSED")
//            //visible: delegateMenuTextMore.myFocus || delegateMenuTextMore.mySelected
//        }

        BorderImage {
            source: "qrc:///image/btn_mapmenu_f.9.png"
            anchors.fill: parent
            //visible: (delegateMenuTextMore.state === "FOCUSED")
            visible: delegateMenuTextMore.myFocus && delegateMenuTextMore.state !== "PRESSED"

            border.left: 2
            border.right: 2
            border.top: 2
            border.bottom: 2
        }

        BorderImage {
            source: "qrc:///image/btn_mapmenu_p.9.png"
            anchors.fill: parent
            visible: (delegateMenuTextMore.state === "PRESSED")

            border.left: 2
            border.right: 2
            border.top: 2
            border.bottom: 2
        }

        Text {
            id: txtFirstLine

            width: 479
            height: 46

            anchors.left: parent.left
            anchors.leftMargin: 14

            anchors.top: parent.top
            anchors.topMargin: txtSecondLine.text ? 13 : 32

            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter

            font.pixelSize: 40
            font.family: "CubeR"

            text: textFirstLine

            color: delegateMenuTextMore.myFocus ? delegateMenuTextMore.text_color_focused : (delegateMenuTextMore.mySelected ? delegateMenuTextMore.text_color_selected : delegateMenuTextMore.text_color_normal)
            font.bold: delegateMenuTextMore.mySelected || delegateMenuTextMore.myFocus
        }

        Text {
            id: txtSecondLine

            width: 479
            height: 46

            anchors.left: parent.left
            anchors.leftMargin: 14

            anchors.top: parent.top
            anchors.topMargin: 51

            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter

            font.pixelSize: 40
            font.family: "CubeR"

            text: textSecondLine

            color: delegateMenuTextMore.text_color_subtitle
            font.bold: delegateMenuTextMore.mySelected || delegateMenuTextMore.myFocus
        }

        Image {
            source: enabled ? "qrc:///image/icon_go_n.png" : "qrc:///image/icon_go_d.png"

            anchors.verticalCenter: delegateMenuTextMore.verticalCenter
            anchors.right: delegateMenuTextMore.right
            anchors.rightMargin: 3
        }
    }
}

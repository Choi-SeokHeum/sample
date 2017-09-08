import QtQuick 2.0
import IVIS.Component 1.0

Component {
    AbstractDelegate {
        id: delegateMenuSubTitle

        width: listView.width //595
        height: listView.height/listView.countInView //107

        property string text_color_normal: "#CCCCCC"
        property string text_color_focused: "#FAFAFA"
        property string text_color_selected: "#FE7E00"
        property string text_color_disabled: "#414141"
        property string text_color_subtitle: "#999999"

        Image {
            source: "qrc:///image/line_menu_list.png"

            anchors.top: delegateMenuSubTitle.top
            anchors.left: delegateMenuSubTitle.left
            anchors.right: delegateMenuSubTitle.right
        }

        Image {
            source: "qrc:///image/line_menu_list.png"

            anchors.bottom: delegateMenuSubTitle.bottom
            anchors.left: delegateMenuSubTitle.left
            anchors.right: delegateMenuSubTitle.right
        }

//        Image {
//            source: "qrc:///imagebtn_mapmenu_f.9.png"
//            anchors.fill: parent
//            visible: (delegateMenuSubTitle.state === "PRESSED") || (delegateMenuSubTitle.state === "FOCUSED")
//            //visible: delegateMenuSubTitle.myFocus || delegateMenuSubTitle.mySelected
//        }

//        BorderImage {
//            source: "qrc:///image/btn_mapmenu_f.9.png"
//            anchors.fill: parent
//            //visible: (delegateMenuSubTitle.state === "FOCUSED")
//            visible: delegateMenuSubTitle.myFocus && delegateMenuSubTitle.state !== "PRESSED"

//            border.left: 2
//            border.right: 2
//            border.top: 2
//            border.bottom: 2
//        }

//        BorderImage {
//            source: "qrc:///image/btn_mapmenu_p.9.png"
//            anchors.fill: parent
//            visible: (delegateMenuSubTitle.state === "PRESSED")

//            border.left: 2
//            border.right: 2
//            border.top: 2
//            border.bottom: 2
//        }

        Text {
            id: txtFirstLine

            width: 479
            height: 46

            anchors.left: parent.left
            anchors.leftMargin: 14

            anchors.top: parent.top
            anchors.topMargin: 32

            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter

            font.pixelSize: 40
            font.family: "CubeR"

            text: textFirstLine

            color: delegateMenuSubTitle.myFocus ? delegateMenuSubTitle.text_color_focused : (delegateMenuSubTitle.mySelected ? delegateMenuSubTitle.text_color_selected : delegateMenuSubTitle.text_color_normal)
            font.bold: delegateMenuSubTitle.mySelected || delegateMenuSubTitle.myFocus
        }
    }
}

import QtQuick 2.0
import IVIS.Component 1.0

Component {
    AbstractDelegate {
        id: delegateMenuCheckText

        width: listView.width //443
        height: listView.height/listView.countInView //104

        property string text_color_normal: "#CCCCCC"
        property string text_color_focused: "#FAFAFA"
        property string text_color_selected: "#FE7E00"
        property string text_color_disabled: "#414141"
        property string text_color_subtitle: "#999999"

        Image {
            width: delegateMenuCheckText.width

            source: "qrc:///image/line_menu_list.png"

            anchors.top: delegateMenuCheckText.top
            anchors.left: delegateMenuCheckText.left
            anchors.right: delegateMenuCheckText.right
        }

        Image {
            width: delegateMenuCheckText.width

            source: "qrc:///image/line_menu_list.png"

            anchors.bottom: delegateMenuCheckText.bottom
            anchors.left: delegateMenuCheckText.left
            anchors.right: delegateMenuCheckText.right
        }

//        Image {
//            source: "qrc:///imagebtn_mapmenu_f.9.png"
//            anchors.fill: parent
//            visible: (delegateMenuCheckText.state === "PRESSED") || delegateMenuCheckText.state === "FOCUSED"
//        }

        BorderImage {
            source: "qrc:///image/btn_mapmenu_f.9.png"
            anchors.fill: parent
            //visible: (delegateMenuText.state === "FOCUSED")
            visible: delegateMenuCheckText.myFocus && delegateMenuCheckText.state !== "PRESSED"

            border.left: 2
            border.right: 2
            border.top: 2
            border.bottom: 2
        }

        BorderImage {
            source: "qrc:///image/btn_mapmenu_p.9.png"
            anchors.fill: parent
            visible: (delegateMenuCheckText.state === "PRESSED")

            border.left: 2
            border.right: 2
            border.top: 2
            border.bottom: 2
        }

        Image {
            id: imgCheck

            source: checked ? "qrc:///image/ico_check_s.png" : "qrc:///image/ico_check_n.png"

            anchors.left: delegateMenuCheckText.left
            anchors.verticalCenter: delegateMenuCheckText.verticalCenter
        }

        Text {
            id: txtFirstLine

            width: 343
            height: 44

            anchors.left: parent.left
            anchors.leftMargin: 72

            anchors.top: parent.top
            anchors.topMargin: txtSecondLine.text ? 20 : 38

            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter

            font.pixelSize: 40
            font.family: "CubeR"

            text: textFirstLine

            color: delegateMenuCheckText.myFocus ? delegateMenuCheckText.text_color_focused : (delegateMenuCheckText.mySelected ? delegateMenuCheckText.text_color_selected : delegateMenuCheckText.text_color_normal)
            font.bold: delegateMenuCheckText.mySelected || delegateMenuCheckText.myFocus
        }

        Text {
            id: txtSecondLine

            width: 343
            height: 44

            anchors.left: parent.left
            anchors.leftMargin: 72

            anchors.top: parent.top
            anchors.topMargin: 57

            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter

            font.pixelSize: 40
            font.family: "CubeR"

            text: textSecondLine

            color: delegateMenuCheckText.text_color_normal
            font.bold: delegateMenuCheckText.mySelected || delegateMenuCheckText.myFocus
        }
    }
}

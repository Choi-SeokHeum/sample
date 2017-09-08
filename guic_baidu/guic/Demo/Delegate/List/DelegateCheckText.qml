import QtQuick 2.0
import IVIS.Component 1.0

Component {
    AbstractDelegate {
        id: delegateCheckText

        width: listView.width //1205
        height: listView.height/listView.countInView //110

        property string text_color_normal: "#CCCCCC"
        property string text_color_focused: "#FAFAFA"
        property string text_color_selected: "#FE7E00"
        property string text_color_disabled: "#414141"
        property string text_color_subtitle: "#999999"

        Image {
            source: "qrc:///image/line_menu_list.png"

            anchors.top: delegateCheckText.top
            anchors.left: delegateCheckText.left
            anchors.right: delegateCheckText.right
        }

        Image {
            source: "qrc:///image/line_menu_list.png"

            anchors.bottom: delegateCheckText.bottom
            anchors.left: delegateCheckText.left
            anchors.right: delegateCheckText.right
        }

//        Image {
//            source: "btn_mapmenu_f.9.png"
//            anchors.fill: parent
//            visible: (delegateCheckText.state === "PRESSED") || delegateCheckText.state === "FOCUSED"
//        }

        BorderImage {
            source: "qrc:///image/btn_mapmenu_f.9.png"
            anchors.fill: parent
            //visible: (delegateCheckText.state === "FOCUSED")
            visible: delegateCheckText.myFocus && delegateCheckText.state !== "PRESSED"

            border.left: 2
            border.right: 2
            border.top: 2
            border.bottom: 2
        }

        BorderImage {
            source: "qrc:///image/btn_mapmenu_p.9.png"
            anchors.fill: parent
            visible: (delegateCheckText.state === "PRESSED")

            border.left: 2
            border.right: 2
            border.top: 2
            border.bottom: 2
        }

        Image {
            id: imgCheck

            source: checked ? "qrc:///image/ico_check_s.png" : "qrc:///image/ico_check_n.png"

            anchors.left: delegateCheckText.left
            anchors.leftMargin: 20

            anchors.verticalCenter: delegateCheckText.verticalCenter
        }

        Text {
            id: txtFirstLine

            //width: 462
            height: 46

            anchors.left: parent.left
            anchors.leftMargin: 74

            anchors.right: parent.right
            anchors.rightMargin: 50

            anchors.top: parent.top
            anchors.topMargin: txtSecondLine.text ? 14 : 32

            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter

            font.pixelSize: 40
            font.family: "CubeR"

            text: textFirstLine

            color: delegateCheckText.myFocus ? delegateCheckText.text_color_focused : (delegateCheckText.mySelected ? delegateCheckText.text_color_selected : delegateCheckText.text_color_normal)
            font.bold: delegateCheckText.mySelected || delegateCheckText.myFocus
        }

        Text {
            id: txtSecondLine

            //width: 462
            height: 46

            anchors.left: parent.left
            anchors.leftMargin: 74

            anchors.right: parent.right
            anchors.rightMargin: 50

            anchors.top: parent.top
            anchors.topMargin: 51

            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter

            font.pixelSize: 40
            font.family: "CubeR"

            text: textSecondLine

            color: delegateCheckText.text_color_subtitle
            font.bold: delegateCheckText.mySelected || delegateCheckText.myFocus
        }
    }
}

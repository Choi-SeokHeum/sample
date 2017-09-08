import QtQuick 2.0
import IVIS.Component 1.0

Component {
    AbstractDelegate {
        id: delegateMenuText

        width: listView.width //443
        height: listView.height/listView.countInView //104

        property string text_color_normal: "#CCCCCC"
        property string text_color_focused: "#FAFAFA"
        property string text_color_selected: "#FE7E00"
        property string text_color_disabled: "#414141"
        property string text_color_subtitle: "#999999"

        Image {
            width: delegateMenuText.width

            source: "qrc:///image/line_menu_list.png"

            anchors.top: delegateMenuText.top
            anchors.left: delegateMenuText.left
            anchors.right: delegateMenuText.right
        }

        Image {
            width: delegateMenuText.width

            source: "qrc:///image/line_menu_list.png"

            anchors.bottom: delegateMenuText.bottom
            anchors.left: delegateMenuText.left
            anchors.right: delegateMenuText.right
        }

//        Image {
//            source: "qrc:///imagebtn_mapmenu_f.9.png"
//            anchors.fill: parent
//            visible: (delegateMenuText.state === "PRESSED") || (delegateMenuText.state === "FOCUSED")
//            //visible: delegateMenuText.myFocus || delegateMenuText.mySelected
//        }

        BorderImage {
            source: "qrc:///image/btn_mapmenu_f.9.png"
            anchors.fill: parent
            //visible: (delegateMenuText.state === "FOCUSED")
            visible: delegateMenuText.myFocus && delegateMenuText.state !== "PRESSED"

            border.left: 2
            border.right: 2
            border.top: 2
            border.bottom: 2
        }

        BorderImage {
            source: "qrc:///image/btn_mapmenu_p.9.png"
            anchors.fill: parent
            visible: (delegateMenuText.state === "PRESSED")

            border.left: 2
            border.right: 2
            border.top: 2
            border.bottom: 2
        }

        Text {
            id: txtFirstLine

            width: 364
            height: 44

            anchors.left: parent.left
            anchors.leftMargin: 14

            anchors.top: parent.top
            anchors.topMargin: txtSecondLine.text ? 22 : 40

            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter

            font.pixelSize: 40
            font.family: "CubeR"

            text: textFirstLine

            color: delegateMenuText.myFocus ? delegateMenuText.text_color_focused : (delegateMenuText.mySelected ? delegateMenuText.text_color_selected : delegateMenuText.text_color_normal)
            font.bold: delegateMenuText.mySelected || delegateMenuText.myFocus
        }

        Text {
            id: txtSecondLine

            width: 364
            height: 44

            anchors.left: parent.left
            anchors.leftMargin: 14

            anchors.top: parent.top
            anchors.topMargin: 59

            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter

            font.pixelSize: 40
            font.family: "CubeR"

            text: textSecondLine

            color: delegateMenuText.text_color_normal
            font.bold: delegateMenuText.mySelected || delegateMenuText.myFocus
        }
    }
}

import QtQuick 2.0
import IVIS.Component 1.0

Component {
    AbstractDelegate {
        id: delegateCheckIconText

        width: listView.width //1205
        height: listView.height/listView.countInView //110

        property string text_color_normal: "#CCCCCC"
        property string text_color_focused: "#FAFAFA"
        property string text_color_selected: "#FE7E00"
        property string text_color_disabled: "#414141"
        property string text_color_subtitle: "#999999"

        Image {
            source: "qrc:///image/line_menu_list.png"

            anchors.top: delegateCheckIconText.top
            anchors.left: delegateCheckIconText.left
            anchors.right: delegateCheckIconText.right
        }

        Image {
            source: "qrc:///image/line_menu_list.png"

            anchors.bottom: delegateCheckIconText.bottom
            anchors.left: delegateCheckIconText.left
            anchors.right: delegateCheckIconText.right
        }

//        Image {
//            source: "btn_mapmenu_f.9.png"
//            anchors.fill: parent
//            visible: (delegateCheckIconText.state === "PRESSED") || (delegateCheckIconText.state === "FOCUSED")
//        }

        BorderImage {
            source: "qrc:///image/btn_mapmenu_f.9.png"
            anchors.fill: parent
            //visible: (delegateCheckIconText.state === "FOCUSED")
            visible: delegateCheckIconText.myFocus && delegateCheckIconText.state !== "PRESSED"

            border.left: 2
            border.right: 2
            border.top: 2
            border.bottom: 2
        }

        BorderImage {
            source: "qrc:///image/btn_mapmenu_p.9.png"
            anchors.fill: parent
            visible: (delegateCheckIconText.state === "PRESSED")

            border.left: 2
            border.right: 2
            border.top: 2
            border.bottom: 2
        }

        Image {
            id: imgCheck

            source: checked ? "qrc:///image/ico_check_s.png" : "qrc:///image/ico_check_n.png"

            anchors.left: delegateCheckIconText.left
            anchors.leftMargin: 20

            anchors.verticalCenter: delegateCheckIconText.verticalCenter
        }

        Image {
            id: imgIcon

            source: imageIconPath //"qrc:///image/icon_sign_01.png"

            anchors.left: delegateCheckIconText.left
            anchors.leftMargin: 101

            anchors.verticalCenter: imgCheck.verticalCenter
        }

        Text {
            id: txtFirstLine

            //width: 391
            height: 46

            anchors.left: parent.left
            anchors.leftMargin: 182

            anchors.right: parent.right
            anchors.rightMargin: 50

            anchors.top: parent.top
            //anchors.topMargin: txtSecondLine.text ? 13 : 32
            anchors.topMargin: txtSecondLine.text ? 14 : 32

            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter

            font.pixelSize: 40
            font.family: "CubeR"

            text: textFirstLine

            color: delegateCheckIconText.myFocus ? delegateCheckIconText.text_color_focused : (delegateCheckIconText.mySelected ? delegateCheckIconText.text_color_selected : delegateCheckIconText.text_color_normal)
            font.bold: delegateCheckIconText.mySelected || delegateCheckIconText.myFocus
        }

        Text {
            id: txtSecondLine

            //width: 394
            height: 46

            anchors.left: parent.left
            anchors.leftMargin: 182

            anchors.right: parent.right
            anchors.rightMargin: 50

            anchors.top: parent.top
            //anchors.topMargin: 51
            anchors.topMargin: 51

            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter

            font.pixelSize: 40
            font.family: "CubeR"

            text: textSecondLine

            color: delegateCheckIconText.text_color_subtitle
            font.bold: delegateCheckIconText.mySelected || delegateCheckIconText.myFocus
        }
    }
}

import QtQuick 2.0
import IVIS.Component 1.0

Component {
    AbstractDelegate {
        id: delegateIconText

        width: listView.width //1205
        height: listView.height/listView.countInView //110

        property string text_color_normal: "#CCCCCC"
        property string text_color_focused: "#FAFAFA"
        property string text_color_selected: "#FE7E00"
        property string text_color_disabled: "#414141"
        property string text_color_subtitle: "#999999"

        Image {
            source: "qrc:///image/line_menu_list.png"

            anchors.top: delegateIconText.top
            anchors.left: delegateIconText.left
            anchors.right: delegateIconText.right
        }

        Image {
            source: "qrc:///image/line_menu_list.png"

            anchors.bottom: delegateIconText.bottom
            anchors.left: delegateIconText.left
            anchors.right: delegateIconText.right
        }

//        Image {
//            source: "btn_mapmenu_f.9.png"
//            anchors.fill: parent
//            visible: (delegateIconText.state === "PRESSED") || (delegateIconText.state === "FOCUSED")
//        }

        BorderImage {
            source: "qrc:///image/btn_mapmenu_f.9.png"
            anchors.fill: parent
            //visible: (delegateIconText.state === "FOCUSED")
            visible: delegateIconText.myFocus && delegateIconText.state !== "PRESSED"

            border.left: 2
            border.right: 2
            border.top: 2
            border.bottom: 2
        }

        BorderImage {
            source: "qrc:///image/btn_mapmenu_p.9.png"
            anchors.fill: parent
            visible: (delegateIconText.state === "PRESSED")

            border.left: 2
            border.right: 2
            border.top: 2
            border.bottom: 2
        }

        Image {
            id: imgIcon

            source: imageIconPath

            anchors.left: delegateIconText.left
            anchors.leftMargin: 20

            anchors.verticalCenter: delegateIconText.verticalCenter
        }

        Text {
            id: txtFirstLine

            //width: 462
            height: 46

            anchors.left: parent.left
            anchors.leftMargin: 101

            anchors.right: parent.right
            anchors.rightMargin: 50

            anchors.top: parent.top
            anchors.topMargin: txtSecondLine.text ? 14 : 32

            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter

            font.pixelSize: 40
            font.family: "CubeR"

            text: textFirstLine

            color: delegateIconText.myFocus ? delegateIconText.text_color_focused : (delegateIconText.mySelected ? delegateIconText.text_color_selected : delegateIconText.text_color_normal)
            font.bold: delegateIconText.mySelected || delegateIconText.myFocus
        }

        Text {
            id: txtSecondLine

            //width: 462
            height: 35

            anchors.left: parent.left
            anchors.leftMargin: 101

            anchors.right: parent.right
            anchors.rightMargin: 50

            anchors.top: parent.top
            anchors.topMargin: 51

            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter

            font.pixelSize: 30
            font.family: "CubeR"


            color: delegateIconText.text_color_subtitle
            font.bold: delegateIconText.mySelected || delegateIconText.myFocus

            text: textSecondLine
        }
    }
}

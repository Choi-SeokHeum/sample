import QtQuick 2.0
import IVIS.Component 1.0

Component {
    AbstractDelegate {
        id: delegateMenuCheckIconText

        width: listView.width //595
        height: listView.height/listView.countInView //107

        property string text_color_normal: "#CCCCCC"
        property string text_color_focused: "#FAFAFA"
        property string text_color_selected: "#FE7E00"
        property string text_color_disabled: "#414141"
        property string text_color_subtitle: "#999999"

        Image {
            source: "qrc:///image/line_menu_list.png"

            anchors.top: delegateMenuCheckIconText.top
            anchors.left: delegateMenuCheckIconText.left
            anchors.right: delegateMenuCheckIconText.right
        }

        Image {
            source: "qrc:///image/line_menu_list.png"

            anchors.bottom: delegateMenuCheckIconText.bottom
            anchors.left: delegateMenuCheckIconText.left
            anchors.right: delegateMenuCheckIconText.right
        }

//        Image {
//            source: "qrc:///imagebtn_mapmenu_f.9.png"
//            anchors.fill: parent
//            visible: (delegateMenuCheckIconText.state === "PRESSED") || (delegateMenuCheckIconText.state === "FOCUSED")
//        }

        BorderImage {
            source: "qrc:///image/btn_mapmenu_f.9.png"
            anchors.fill: parent
            //visible: (delegateMenuCheckIconText.state === "FOCUSED")
            visible: delegateMenuCheckIconText.myFocus && delegateMenuCheckIconText.state !== "PRESSED"

            border.left: 2
            border.right: 2
            border.top: 2
            border.bottom: 2
        }

        BorderImage {
            source: "qrc:///image/btn_mapmenu_p.9.png"
            anchors.fill: parent
            visible: (delegateMenuCheckIconText.state === "PRESSED")

            border.left: 2
            border.right: 2
            border.top: 2
            border.bottom: 2
        }

        Image {
            id: imgCheck

            source: checked ? "qrc:///image/CB_Checkedr.png" : "qrc:///image/CB_Enable.png"

            anchors.left: delegateMenuCheckIconText.left
            anchors.leftMargin: 20

            anchors.verticalCenter: delegateMenuCheckIconText.verticalCenter
        }

        Image {
            id: imgIcon

            source: imageIconPath

            anchors.left: delegateMenuCheckIconText.left
            anchors.leftMargin: 69

            anchors.verticalCenter: imgCheck.verticalCenter
        }

        Text {
            id: txtFirstLine

            width: 391
            height: 46

            anchors.left: parent.left
            anchors.leftMargin: 145

            anchors.top: parent.top
            anchors.topMargin: txtSecondLine.text ? 13 : 32

            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter

            font.pixelSize: 40
            font.family: "CubeR"

            text: textFirstLine

            color: delegateMenuCheckIconText.myFocus ? delegateMenuCheckIconText.text_color_focused : (delegateMenuCheckIconText.mySelected ? delegateMenuCheckIconText.text_color_selected : delegateMenuCheckIconText.text_color_normal)
            font.bold: delegateMenuCheckIconText.mySelected || delegateMenuCheckIconText.myFocus
        }

        Text {
            id: txtSecondLine

            width: 394
            height: 46

            anchors.left: parent.left
            anchors.leftMargin: 145

            anchors.top: parent.top
            anchors.topMargin: 51

            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter

            font.pixelSize: 40
            font.family: "CubeR"

            text: textSecondLine

            color: delegateMenuCheckIconText.text_color_subtitle
            font.bold: delegateMenuCheckIconText.mySelected || delegateMenuCheckIconText.myFocus
        }
    }
}

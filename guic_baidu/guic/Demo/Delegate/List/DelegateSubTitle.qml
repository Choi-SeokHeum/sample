import QtQuick 2.0
import IVIS.Component 1.0

Component {
    AbstractDelegate {
        id: delegateSubTitle

        width: listView.width //1205
        height: listView.height/listView.countInView //110

        property string text_color_normal: "#CCCCCC"
        property string text_color_focused: "#FAFAFA"
        property string text_color_selected: "#FE7E00"
        property string text_color_disabled: "#414141"
        property string text_color_subtitle: "#999999"

        Image {
            source: "qrc:///image/line_menu_list.png"

            anchors.top: delegateSubTitle.top
            anchors.left: delegateSubTitle.left
            anchors.right: delegateSubTitle.right
        }

        Image {
            source: "qrc:///image/line_menu_list.png"

            anchors.bottom: delegateSubTitle.bottom
            anchors.left: delegateSubTitle.left
            anchors.right: delegateSubTitle.right
        }

//        BorderImage {
//            source: "qrc:///image/btn_mapmenu_f.9.png"
//            anchors.fill: parent
//            //visible: (delegateSubTitle.state === "FOCUSED")
//            visible: delegateSubTitle.myFocus && delegateSubTitle.state !== "PRESSED"

//            border.left: 2
//            border.right: 2
//            border.top: 2
//            border.bottom: 2
//        }

//        BorderImage {
//            source: "qrc:///image/btn_mapmenu_p.9.png"
//            anchors.fill: parent
//            visible: (delegateSubTitle.state === "PRESSED")

//            border.left: 2
//            border.right: 2
//            border.top: 2
//            border.bottom: 2
//        }

        Text {
            id: txtFirstLine

            //width: 1125
            height: 46

            anchors.left: parent.left
            anchors.leftMargin: 69

            anchors.right: parent.right
            anchors.rightMargin: 50

            anchors.top: parent.top
            anchors.topMargin: 32

            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter

            font.pixelSize: 40
            font.family: "CubeR"

            text: textFirstLine

            color: delegateSubTitle.text_color_subtitle

            //font.bold: delegateSubTitle.mySelected || delegateSubTitle.myFocus
        }
    }
}

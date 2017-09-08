import QtQuick 2.0
import IVIS.Component 1.0

Component {
    AbstractDelegate {
        id: delegateText

        width: listView.width //1205
        height: listView.height/listView.countInView //110

        property string text_color_normal: "#CCCCCC"
        property string text_color_focused: "#FAFAFA"
        property string text_color_selected: "#FE7E00"
        property string text_color_disabled: "#414141"
        property string text_color_subtitle: "#999999"

        Image {
            source: "qrc:///image/line_menu_list.png"

            anchors.top: delegateText.top
            anchors.left: delegateText.left
            anchors.right: delegateText.right
        }

        Image {
            source: "qrc:///image/line_menu_list.png"

            anchors.bottom: delegateText.bottom
            anchors.left: delegateText.left
            anchors.right: delegateText.right
        }

        BorderImage {
            source: "qrc:///image/btn_mapmenu_f.9.png"
            anchors.fill: parent
            //visible: (delegateText.state === "FOCUSED")
            visible: delegateText.myFocus && delegateText.state !== "PRESSED"

            border.left: 2
            border.right: 2
            border.top: 2
            border.bottom: 2
        }

        BorderImage {
            source: "qrc:///image/btn_mapmenu_p.9.png"
            anchors.fill: parent
            visible: (delegateText.state === "PRESSED")

            border.left: 2
            border.right: 2
            border.top: 2
            border.bottom: 2
        }

        Text {
            id: txtFirstLine

            //width: 1125
            height: 46

            anchors.left: parent.left
            anchors.leftMargin: 69

            anchors.right: parent.right
            anchors.rightMargin: 50

            anchors.top: parent.top
            anchors.topMargin: txtSecondLine.text ? 13 : 32

            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter

            font.pixelSize: 40
            font.family: "CubeR"

            text: textFirstLine

            color: delegateText.myFocus ? delegateText.text_color_focused
                                            : (delegateText.mySelected ? delegateText.text_color_selected
                                                                           : delegateText.text_color_normal)
            font.bold: delegateText.mySelected || delegateText.myFocus
        }

        Text {
            id: txtSecondLine

            //width: 1125
            height: 46

            anchors.left: parent.left
            anchors.leftMargin: 69

            anchors.right: parent.right
            anchors.rightMargin: 50

            anchors.top: parent.top
            anchors.topMargin: 51

            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter

            font.pixelSize: 40
            font.family: "CubeR"

            text: textSecondLine

            color: delegateText.text_color_subtitle
            font.bold: delegateText.mySelected || delegateText.myFocus
        }
    }
}

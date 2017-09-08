import QtQuick 2.0
import IVIS.Component 1.0

Component {
    AbstractDelegate {
        id: delegateGroupTwoButton

        width: 270
        height: 213

        property string text_color_normal: "#CCCCCC"
        property string text_color_focused: "#FAFAFA"
        property string text_color_selected: "#FE7E00"
        property string text_color_disabled: "#414141"
        property string text_color_subtitle: "#999999"

        Image {
            width: delegateGroupTwoButton.width

            source: "qrc:///image/line_menu_list.png"

            anchors.top: delegateGroupTwoButton.top
            anchors.left: delegateGroupTwoButton.left
        }

        Image {
            width: delegateGroupTwoButton.width

            source: "qrc:///image/line_menu_list.png"

            anchors.bottom: delegateGroupTwoButton.bottom
            anchors.left: delegateGroupTwoButton.left
        }

//        Image {
//            source: "qrc:///image/btn_mapmenu_f.9.png"
//            anchors.fill: parent
//            visible: (delegateGroupTwoButton.state === "PRESSED") || (delegateGroupTwoButton.state === "FOCUSED")
//            //visible: delegateGroupTwoButton.myFocus || delegateGroupTwoButton.mySelected
//        }

        BorderImage {
            source: "qrc:///image/btn_mapmenu_f.9.png"
            anchors.fill: parent
            //visible: (delegateMenuCheckIconText.state === "FOCUSED")
            visible: delegateGroupTwoButton.myFocus && delegateGroupTwoButton.state !== "PRESSED"

            border.left: 2
            border.right: 2
            border.top: 2
            border.bottom: 2
        }

        BorderImage {
            source: "qrc:///image/btn_mapmenu_p.9.png"
            anchors.fill: parent
            visible: (delegateGroupTwoButton.state === "PRESSED")

            border.left: 2
            border.right: 2
            border.top: 2
            border.bottom: 2
        }

        Text {
            id: txtFirstLine

            width: 205
            height: txtThirdLine ? 36 : 46

            anchors.left: parent.left
            anchors.leftMargin: 30

            anchors.top: parent.top
            anchors.topMargin: txtThirdLine.text ? 52 : (txtSecondLine.text ? 61 : 84)

            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter

            font.pixelSize: txtThirdLine.text ? 30 : 40
            font.family: "CubeR"

            text: textFirstLine

            color: delegateGroupTwoButton.myFocus ? delegateGroupTwoButton.text_color_focused : (delegateGroupTwoButton.mySelected ? delegateGroupTwoButton.text_color_selected : delegateGroupTwoButton.text_color_normal)
            font.bold: delegateGroupTwoButton.mySelected || delegateGroupTwoButton.myFocus
        }

        Text {
            id: txtSecondLine

            width: 205
            height: txtThirdLine ? 36 : 46

            anchors.left: parent.left
            anchors.leftMargin: 30

            anchors.top: parent.top
            anchors.topMargin: txtThirdLine.text ? 88 : 109

            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter

            font.pixelSize: txtThirdLine.text ? 30 : 40
            font.family: "CubeR"

            text: textSecondLine

            color: delegateGroupTwoButton.text_color_normal
            font.bold: delegateGroupTwoButton.mySelected || delegateGroupTwoButton.myFocus
        }

        Text {
            id: txtThirdLine

            width: 205
            height: 36

            anchors.left: parent.left
            anchors.leftMargin: 30

            anchors.top: parent.top
            anchors.topMargin: 124

            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter

            font.pixelSize: 30
            font.family: "CubeR"

            text: textThirdLine

            color: delegateGroupTwoButton.text_color_normal
            font.bold: delegateGroupTwoButton.mySelected || delegateGroupTwoButton.myFocus
        }
    }
}

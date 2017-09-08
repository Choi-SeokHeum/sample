import QtQuick 2.0
import IVIS.Component 1.0

Component {
    AbstractDelegate {
        id: delegateGroupFiveButton

        width: 270
        height: 85

        property string text_color_normal: "#CCCCCC"
        property string text_color_focused: "#FAFAFA"
        property string text_color_selected: "#FE7E00"
        property string text_color_disabled: "#414141"
        property string text_color_subtitle: "#999999"

        Image {
            width: delegateGroupFiveButton.width

            source: "qrc:///image/line_menu_list.png"

            anchors.top: delegateGroupFiveButton.top
            anchors.left: delegateGroupFiveButton.left
        }

        Image {
            width: delegateGroupFiveButton.width

            source: "qrc:///image/line_menu_list.png"

            anchors.bottom: delegateGroupFiveButton.bottom
            anchors.left: delegateGroupFiveButton.left
        }

//        Image {
//            source: "qrc:///image/btn_mapmenu_f.9.png"
//            anchors.fill: parent
//            visible: (delegateGroupFiveButton.state === "PRESSED") || (delegateGroupFiveButton.state === "FOCUSED")
//            //visible: delegateGroupFiveButton.myFocus || delegateGroupFiveButton.mySelected
//        }

        BorderImage {
            source: "qrc:///image/btn_mapmenu_f.9.png"
            anchors.fill: parent
            //visible: (delegateMenuCheckIconText.state === "FOCUSED")
            visible: delegateGroupFiveButton.myFocus && delegateGroupFiveButton.state !== "PRESSED"

            border.left: 2
            border.right: 2
            border.top: 2
            border.bottom: 2
        }

        BorderImage {
            source: "qrc:///image/btn_mapmenu_p.9.png"
            anchors.fill: parent
            visible: (delegateGroupFiveButton.state === "PRESSED")

            border.left: 2
            border.right: 2
            border.top: 2
            border.bottom: 2
        }

        Text {
            id: txtFirstLine

            width: 205
            height: txtSecondLine.text ? 36 : 46

            anchors.left: parent.left
            anchors.leftMargin: 14

            anchors.top: parent.top
            anchors.topMargin: txtSecondLine.text ? 6 : 21

            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter

            font.pixelSize: txtSecondLine.text ? 30 : 40
            font.family: "CubeR"

            text: textFirstLine

            color: delegateGroupFiveButton.myFocus ? delegateGroupFiveButton.text_color_focused : (delegateGroupFiveButton.mySelected ? delegateGroupFiveButton.text_color_selected : delegateGroupFiveButton.text_color_normal)
            font.bold: delegateGroupFiveButton.mySelected || delegateGroupFiveButton.myFocus
        }

        Text {
            id: txtSecondLine

            width: 205
            height: 36

            anchors.left: parent.left
            anchors.leftMargin: 14

            anchors.top: parent.top
            anchors.topMargin: 42

            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter

            font.pixelSize: 30
            font.family: "CubeR"

            text: textSecondLine

            color: delegateGroupFiveButton.text_color_normal
            font.bold: delegateGroupFiveButton.mySelected || delegateGroupFiveButton.myFocus
        }
    }
}

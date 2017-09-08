import QtQuick 2.0
import IVIS.Component 1.0

Component {
    AbstractDelegate {
        id: delegateGroupFourButton

        width: 270
        height: 106

        property string text_color_normal: "#CCCCCC"
        property string text_color_focused: "#FAFAFA"
        property string text_color_selected: "#FE7E00"
        property string text_color_disabled: "#414141"
        property string text_color_subtitle: "#999999"

        Image {
            width: delegateGroupFourButton.width

            source: "qrc:///image/line_menu_list.png"

            anchors.top: delegateGroupFourButton.top
            anchors.left: delegateGroupFourButton.left
        }

        Image {
            width: delegateGroupFourButton.width

            source: "qrc:///image/line_menu_list.png"

            anchors.bottom: delegateGroupFourButton.bottom
            anchors.left: delegateGroupFourButton.left
        }

//        Image {
//            source: "qrc:///image/btn_mapmenu_f.9.png"
//            anchors.fill: parent
//            visible: (delegateGroupFourButton.state === "PRESSED") || (delegateGroupFourButton.state === "FOCUSED")
//            //visible: delegateGroupFourButton.myFocus || delegateGroupFourButton.mySelected
//        }

        BorderImage {
            source: "qrc:///image/btn_mapmenu_f.9.png"
            anchors.fill: parent
            //visible: (delegateMenuCheckIconText.state === "FOCUSED")
            visible: delegateGroupFourButton.myFocus && delegateGroupFourButton.state !== "PRESSED"

            border.left: 2
            border.right: 2
            border.top: 2
            border.bottom: 2
        }

        BorderImage {
            source: "qrc:///image/btn_mapmenu_p.9.png"
            anchors.fill: parent
            visible: (delegateGroupFourButton.state === "PRESSED")

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
            anchors.topMargin: txtSecondLine.text ? 17 : 31

            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter

            font.pixelSize: txtSecondLine.text ? 30 : 40
            font.family: "CubeR"

            text: textFirstLine

            color: delegateGroupFourButton.myFocus ? delegateGroupFourButton.text_color_focused : (delegateGroupFourButton.mySelected ? delegateGroupFourButton.text_color_selected : delegateGroupFourButton.text_color_normal)
            font.bold: delegateGroupFourButton.mySelected || delegateGroupFourButton.myFocus
        }

        Text {
            id: txtSecondLine

            width: 205
            height: 36

            anchors.left: parent.left
            anchors.leftMargin: 14

            anchors.top: parent.top
            anchors.topMargin: 53

            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter

            font.pixelSize: 30
            font.family: "CubeR"

            text: textSecondLine

            color: delegateGroupFourButton.text_color_normal
            font.bold: delegateGroupFourButton.mySelected || delegateGroupFourButton.myFocus
        }
    }
}

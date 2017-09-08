import QtQuick 2.0
import IVIS.Component 1.0

Component {
    AbstractDelegate {
        id: delegateGroupThreeButton

        width: 270
        height: 142

        property string text_color_normal: "#CCCCCC"
        property string text_color_focused: "#FAFAFA"
        property string text_color_selected: "#FE7E00"
        property string text_color_disabled: "#414141"
        property string text_color_subtitle: "#999999"

        Image {
            width: delegateGroupThreeButton.width

            source: "qrc:///image/line_menu_list.png"

            anchors.top: delegateGroupThreeButton.top
            anchors.left: delegateGroupThreeButton.left
        }

        Image {
            width: delegateGroupThreeButton.width

            source: "qrc:///image/line_menu_list.png"

            anchors.bottom: delegateGroupThreeButton.bottom
            anchors.left: delegateGroupThreeButton.left
        }

//        Image {
//            source: "qrc:///image/btn_mapmenu_f.9.png"
//            anchors.fill: parent
//            visible: (delegateGroupThreeButton.state === "PRESSED") || (delegateGroupThreeButton.state === "FOCUSED")
//            //visible: delegateGroupThreeButton.myFocus || delegateGroupThreeButton.mySelected
//        }

        BorderImage {
            source: "qrc:///image/btn_mapmenu_f.9.png"
            anchors.fill: parent
            //visible: (delegateMenuCheckIconText.state === "FOCUSED")
            visible: delegateGroupThreeButton.myFocus && delegateGroupThreeButton.state !== "PRESSED"

            border.left: 2
            border.right: 2
            border.top: 2
            border.bottom: 2
        }

        BorderImage {
            source: "qrc:///image/btn_mapmenu_p.9.png"
            anchors.fill: parent
            visible: (delegateGroupThreeButton.state === "PRESSED")

            border.left: 2
            border.right: 2
            border.top: 2
            border.bottom: 2
        }

        Text {
            id: txtFirstLine

            width: 205
            height: 46

            anchors.left: parent.left
            anchors.leftMargin: 30

            anchors.top: parent.top
            anchors.topMargin: txtThirdLine.text ? 14 : (txtSecondLine.text ? 22 : 51)

            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter

            font.pixelSize: txtThirdLine.text ? 30 : 40
            font.family: "CubeR"

            text: textFirstLine

            color: delegateGroupThreeButton.myFocus ? delegateGroupThreeButton.text_color_focused : (delegateGroupThreeButton.mySelected ? delegateGroupThreeButton.text_color_selected : delegateGroupThreeButton.text_color_normal)
            font.bold: delegateGroupThreeButton.mySelected || delegateGroupThreeButton.myFocus
        }

        Text {
            id: txtSecondLine

            width: 205
            height: 46

            anchors.left: parent.left
            anchors.leftMargin: 30

            anchors.top: parent.top
            anchors.topMargin: txtThirdLine.text ? 50 : 70

            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter

            font.pixelSize: txtThirdLine.text ? 30 : 40
            font.family: "CubeR"

            text: textSecondLine

            color: delegateGroupThreeButton.text_color_normal
            font.bold: delegateGroupThreeButton.mySelected || delegateGroupThreeButton.myFocus
        }

        Text {
            id: txtThirdLine

            width: 205
            height: 46

            anchors.left: parent.left
            anchors.leftMargin: 30

            anchors.top: parent.top
            anchors.topMargin: 86

            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter

            font.pixelSize: 30
            font.family: "CubeR"

            text: textThirdLine

            color: delegateGroupThreeButton.text_color_normal
            font.bold: delegateGroupThreeButton.mySelected || delegateGroupThreeButton.myFocus
        }
    }
}

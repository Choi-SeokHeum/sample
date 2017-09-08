import QtQuick 2.0
import IVIS.Component 1.0

Component {
    AbstractDelegate {
        id: delegateDirectionDistanceIconText

        width: listView.width //1205
        height: listView.height/listView.countInView //110

        property string text_color_normal: "#CCCCCC"
        property string text_color_focused: "#FAFAFA"
        property string text_color_selected: "#FE7E00"
        property string text_color_disabled: "#414141"
        property string text_color_subtitle: "#999999"

        Image {
            source: "qrc:///image/line_menu_list.png"

            anchors.top: delegateDirectionDistanceIconText.top
            anchors.left: delegateDirectionDistanceIconText.left
            anchors.right: delegateDirectionDistanceIconText.right
        }

        Image {
            source: "qrc:///image/line_menu_list.png"

            anchors.bottom: delegateDirectionDistanceIconText.bottom
            anchors.left: delegateDirectionDistanceIconText.left
            anchors.right: delegateDirectionDistanceIconText.right
        }

//        Image {
//            source: "btn_mapmenu_f.9.png"
//            anchors.fill: parent
//            visible: (delegateDirectionDistanceIconText.state === "PRESSED") || (delegateDirectionDistanceIconText.state === "FOCUSED")
//        }

        BorderImage {
            source: "qrc:///image/btn_mapmenu_f.9.png"
            anchors.fill: parent
            //visible: (delegateDirectionDistanceIconText.state === "FOCUSED")
            visible: delegateDirectionDistanceIconText.myFocus && delegateDirectionDistanceIconText.state !== "PRESSED"

            border.left: 2
            border.right: 2
            border.top: 2
            border.bottom: 2
        }

        BorderImage {
            source: "qrc:///image/btn_mapmenu_p.9.png"
            anchors.fill: parent
            visible: (delegateDirectionDistanceIconText.state === "PRESSED")

            border.left: 2
            border.right: 2
            border.top: 2
            border.bottom: 2
        }

        Image {
            id: imgDirection

            source: imageDirectionPath //"qrc:///image/icon_arrow_yellow_01.png"

            anchors.left: delegateDirectionDistanceIconText.left
            anchors.leftMargin: 20

            anchors.verticalCenter: delegateDirectionDistanceIconText.verticalCenter
        }

        Text {
            id: txtDistance

            width: 178
            height: 46

            anchors.left: parent.left
            anchors.leftMargin: 101

            anchors.top: parent.top
            anchors.topMargin: 32

            horizontalAlignment: Text.AlignRight
            verticalAlignment: Text.AlignVCenter

            font.pixelSize: 36
            font.family: "CubeR"

            text: textDistance //"Menu 01"

            color: delegateDirectionDistanceIconText.myFocus ? delegateDirectionDistanceIconText.text_color_focused : (delegateDirectionDistanceIconText.mySelected ? delegateDirectionDistanceIconText.text_color_selected : delegateDirectionDistanceIconText.text_color_normal)
            font.bold: delegateDirectionDistanceIconText.mySelected || delegateDirectionDistanceIconText.myFocus
        }

        Image {
            id: imgIcon

            source: imageIconPath //"qrc:///image/icon_sign_01.png"

            anchors.left: delegateDirectionDistanceIconText.left
            anchors.leftMargin: 296

            anchors.verticalCenter: delegateDirectionDistanceIconText.verticalCenter
        }

        Text {
            id: txtFirstLine

            //width: 462
            height: 46

            anchors.left: parent.left
            anchors.leftMargin: 377

            anchors.right: parent.right
            anchors.rightMargin: 50

            anchors.top: parent.top
            anchors.topMargin: txtSecondLine.text ? 14 : 32

            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter

            font.pixelSize: 40
            font.family: "CubeR"

            text: textFirstLine

            color: delegateDirectionDistanceIconText.myFocus ? delegateDirectionDistanceIconText.text_color_focused : (delegateDirectionDistanceIconText.mySelected ? delegateDirectionDistanceIconText.text_color_selected : delegateDirectionDistanceIconText.text_color_normal)
            font.bold: delegateDirectionDistanceIconText.mySelected || delegateDirectionDistanceIconText.myFocus
        }

        Text {
            id: txtSecondLine

            //width: 462
            height: 35

            anchors.left: parent.left
            anchors.leftMargin: 377

            anchors.right: parent.right
            anchors.rightMargin: 50

            anchors.top: parent.top
            anchors.topMargin: 51

            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter

            font.pixelSize: 30
            font.family: "CubeR"


            color: delegateDirectionDistanceIconText.text_color_subtitle
            font.bold: delegateDirectionDistanceIconText.mySelected || delegateDirectionDistanceIconText.myFocus

            text: textSecondLine
        }
    }
}


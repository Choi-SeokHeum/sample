import QtQuick 2.0
import IVIS.Component 1.0

Component {
    AbstractDelegate {
        id: delegatePopupMenuSubtitle

        width: listView.width //443
        height: listView.height/listView.countInView //104

        property string text_color_normal: "#CCCCCC"
        property string text_color_focused: "#FAFAFA"
        property string text_color_selected: "#FE7E00"
        property string text_color_disabled: "#414141"
        property string text_color_subtitle: "#999999"

        Image {
            anchors.fill: parent

            source: "qrc:///image/img_subtitle.9.png"
        }

        Text {
            id: txtFirstLine

            width: 364
            height: 44

            anchors.left: parent.left
            anchors.leftMargin: 14

            anchors.top: parent.top
            anchors.topMargin: 40

            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter

            font.pixelSize: 40
            font.family: "CubeR"

            text: textFirstLine

            color: text_color_subtitle
            //font.bold: delegatePopupMenuSubtitle.mySelected || delegatePopupMenuSubtitle.myFocus
        }
    }
}

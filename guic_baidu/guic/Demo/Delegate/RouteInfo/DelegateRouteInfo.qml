import QtQuick 2.0
import IVIS.Component 1.0

Component {
    AbstractDelegate {
        id: delegateRouteInfo
        objectName: "delegateRouteInfo"

        width: 443
        height: 208

        property string text_color_normal: "#CCCCCC"
        property string text_color_focused: "#FAFAFA"
        property string text_color_selected: "#FE7E00"
        property string text_color_disabled: "#414141"
        property string text_color_sub: "#999999"

        Image {
            width: delegateRouteInfo.width

            source: "qrc:///image/line_menu_list.png"

            anchors.top: delegateRouteInfo.top
            anchors.left: delegateRouteInfo.left
        }

        Image {
            width: delegateRouteInfo.width

            source: "qrc:///image/line_menu_list.png"

            anchors.bottom: delegateRouteInfo.bottom
            anchors.left: delegateRouteInfo.left
        }

        Image {
            source: "qrc:///image/btn_mapmenu_f.9.png"
            anchors.fill: parent
            //visible: (delegateRouteInfo.state === "FOCUSED")
            visible: delegateRouteInfo.myFocus && delegateRouteInfo.state !== "PRESSED"
        }

        Image {
            source: "qrc:///image/btn_mapmenu_p.9.png"
            anchors.fill: parent
            visible: (delegateRouteInfo.state === "PRESSED")
        }

        Image {
            source: "qrc:///image/bar_routeoption_blue.9.png"

            x: 14
            y: 28

            width: 15
            height: 148
        }

        Text {
            id: txtFirstLine

            width: 338
            height: 44

            x: 40
            y: 33

            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter

            font.pixelSize: 40
            font.family: "CubeR"

            text: "Faster Time"

            color: delegateRouteInfo.text_color_focused
            //font.bold: delegateRouteInfo.mySelected || delegateRouteInfo.myFocus
        }

        Text {
            id: txtSecondLine

            width: 338
            height: 34

            x: 40
            y: 98

            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter

            font.pixelSize: 32
            font.family: "CubeR"

            text: "Faster Time"

            color: delegateRouteInfo.text_color_focused
            //font.bold: delegateRouteInfo.mySelected || delegateRouteInfo.myFocus
        }

        Text {
            id: txtThirdLine

            width: 338
            height: 34

            x: 40
            y: 138

            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter

            font.pixelSize: 32
            font.family: "CubeR"

            text: "Faster Time"

            color: delegateRouteInfo.text_color_focused
            //font.bold: delegateRouteInfo.mySelected || delegateRouteInfo.myFocus
        }
    }
}

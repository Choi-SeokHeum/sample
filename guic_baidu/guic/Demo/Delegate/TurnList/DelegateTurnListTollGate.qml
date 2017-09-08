import QtQuick 2.0
import IVIS.Component 1.0


Component {
    AbstractDelegate {
        id: delegateRouteInfo

        width: 483
        height: 197

        enabled: false

        property string text_color_normal: "#CCCCCC"
        property string text_color_focused: "#FAFAFA"
        property string text_color_selected: "#FE7E00"
        property string text_color_disabled: "#414141"
        property string text_color_sub: "#999999"

        BorderImage {
            width: 483
            height: 197 - 2

            source: "qrc:///image/box_turn_list_b.9.png"

            border.left: 20; border.top: 100
            border.right: 20; border.bottom: 20

            anchors.centerIn: parent
        }

        BorderImage {
            width: 483
            height: 197 - 2

            source: "qrc:///image/box_turn_list_bw.9.png"

            border.left: 20; border.top: 100
            border.right: 20; border.bottom: 20

            anchors.centerIn: parent

            visible: listView.currentIndex === index //myFocus
        }

//        BorderImage {
//            width: 483
//            height: 197 - 2

//            source: "qrc:///image/box_turn_list_b_p.png"

//            border.left: 20; border.top: 100
//            border.right: 20; border.bottom: 20

//            anchors.centerIn: parent

//            visible: (delegateRouteInfo.state === "PRESSED")
//        }

        Text {
            id: txtBifurcation

            width: 250
            height: 50

            anchors.left: parent.left
            anchors.leftMargin: 18

            anchors.top: parent.top
            anchors.topMargin: 10

            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter

            font.pixelSize: 33
            font.family: "CubeR"

            text: textBifurcation //"천안 톨게이트"

            color: "#ffffff"
            //font.bold: delegateRouteInfo.mySelected || delegateRouteInfo.myFocus
        }

        Text {
            id: txtDistance

            width: 130
            height: 44

            anchors.left: parent.left
            anchors.leftMargin: 288

            anchors.top: parent.top
            anchors.topMargin: 11

            horizontalAlignment: Text.AlignRight
            verticalAlignment: Text.AlignVCenter

            font.pixelSize: 42
            font.family: "CubeR"

            text: textDistance //"2.5"

            color: "#ffffff"
            //font.bold: delegateRouteInfo.mySelected || delegateRouteInfo.myFocus
        }

        Text {
            //id: txtDistance

            width: 45
            height: 37

            anchors.left: parent.left
            anchors.leftMargin: 418

            anchors.top: parent.top
            anchors.topMargin: 20

            horizontalAlignment: Text.AlignRight
            verticalAlignment: Text.AlignVCenter

            font.pixelSize: 26
            font.family: "CubeR"

            text: "km"

            color: "#ffffff"
            //font.bold: delegateRouteInfo.mySelected || delegateRouteInfo.myFocus
        }

        Image {
            id: imgTollGate

            width: 130
            height: 126

            fillMode: Image.PreserveAspectFit

            source: imageIcon //"qrc:///image/kor_r3_88.png"

            anchors.left: parent.left
            anchors.leftMargin: 9

            anchors.top: parent.top
            anchors.topMargin: 65
        }

        Text {
            id: txtPrice

            width: 319
            height: 42

            anchors.left: parent.left
            anchors.leftMargin: 139

            anchors.top: parent.top
            anchors.topMargin: 85

            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter

            font.pixelSize: 33
            font.family: "SourceHanSans"

            text: textPrice //"3000"

            color: "#d6d6d6"
            //font.bold: delegateRouteInfo.mySelected || delegateRouteInfo.myFocus
        }
    }
}

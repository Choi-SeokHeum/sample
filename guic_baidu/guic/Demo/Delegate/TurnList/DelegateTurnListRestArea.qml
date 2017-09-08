import QtQuick 2.0
import IVIS.Component 1.0


Component {
    AbstractDelegate {
        id: delegateTurnListRestArea

        width: 483
        height: 197

        enabled: false

        property string text_color_normal: "#CCCCCC"
        property string text_color_focused: "#FAFAFA"
        property string text_color_selected: "#FE7E00"
        property string text_color_disabled: "#414141"
        property string text_color_sub: "#999999"

        property var images: imageIconList//[]

        onImagesChanged: {
            setRepeaterModel()
        }

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

//            visible: (delegateTurnListRestArea.state === "PRESSED")
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

            text: textBifurcation //"용인 휴게소"

            color: "#ffffff"
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

            text: textDistance //"5"

            color: "#ffffff"
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
        }

        Image {
            id: imgTollGate

            width: 130
            height: 126

            fillMode: Image.PreserveAspectFit

            source: imageIcon //"qrc:///image/kor_r1_29.png"

            anchors.left: parent.left
            anchors.leftMargin: 9

            anchors.top: parent.top
            anchors.topMargin: 65
        }

        Repeater {
            id: repeaterIcon

            Image {
                width: 48
                height: 48

                anchors.left: parent.left
                anchors.leftMargin: 410 - 48 * (repeaterIcon.model - 1) + 48 * index

                anchors.top: parent.top
                anchors.topMargin: 128

                source: images[index]
            }
        }

        function setRepeaterModel()
        {
            repeaterIcon.model = images.length
        }

        Component.onCompleted: {
//            images = ["qrc:///image/icon_fastfood_02.png", "qrc:///image/icon_oil_hd.png", "qrc:///image/icon_parking_02.png"
//                    , "qrc:///image/icon_poi_gasstation.png", "qrc:///image/icon_poi_lpg.png"]
//            images = ["icon_fastfood_02.png"]
//            images = ["icon_fastfood_02.png", "icon_oil_hd.png"]
//            images = ["icon_fastfood_02.png", "icon_oil_hd.png", "icon_parking_02.png"]
//            images = ["icon_fastfood_02.png", "icon_oil_hd.png", "icon_parking_02.png"
//                    , "con_poi_gasstation.png"]
//            images = ["icon_fastfood_02.png", "icon_oil_hd.png", "icon_parking_02.png"
//                    , "icon_poi_gasstation.png", "icon_poi_lpg.png", "icon_restaurant.png"]
        }
    }
}

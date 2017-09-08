import QtQuick 2.0
import IVIS.Component 1.0

Item {
    id : testScreen
    width: 800
    height: 440

    FocusGroup{
        id : focusGroup
        objectName: "focusGroup"

        Component.onCompleted: {
            focusGroup.registerItem(homeBtn, 0, 0)
            focusGroup.registerItem(naviMuteOnOff, 1, 0)
            focusGroup.registerItem(compassBtn, 2, 0)
            focusGroup.registerItem(scaleBtn, 3, 0)
            focusGroup.registerItem(textBtn, 4, 0)
            FocusGroupManager.registerFocusGroup(focusGroup, 5, 0)
            FocusGroupManager.moveGroupFocusByObjectName("focusGroup")
        }
    }

    Item{
        focus: true

        Keys.onPressed: {
            if ( event.key === Qt.Key_Down)
            {
                console.log("Down")
                focusGroup.moveFocusDown()
            }
            else if ( event.key === Qt.Key_Up)
            {
                console.log("Up")
                focusGroup.moveFocusUp()
            }
            else if ( event.key === Qt.Key_Enter)
            {
                console.log("Enter")
                console.log(focusGroup.getCurrentItem())
                focusGroup.getCurrentItem().pressed = true
            }
        }
        Keys.onReleased: {
            if ( event.key === Qt.Key_Enter)
            {
                console.log("Enter")
                console.log(focusGroup.getCurrentItem())
                focusGroup.getCurrentItem().pressed = false
                focusGroup.getCurrentItem().clicked()
            }
        }

    }


    Button_1Image_Type{
        id : homeBtn

        onClicked: {
            console.log("homeBtn")
        }
    }

    Button_CheckedType{
        id : naviMuteOnOff
        anchors.top: homeBtn.bottom
    }

    Button_CompassType{
        id : compassBtn
        anchors.top: naviMuteOnOff.bottom
    }

    Button_ScaleType{
        id : scaleBtn
        anchors.top: compassBtn.bottom
        zoomValue: 1600
    }

    Button_TextType{
        id : textBtn
        anchors.top: scaleBtn.bottom
    }










//    // StateButton Example=========================================
//    TStateButton{
//        id : stateButton
//        width: 111
//        height: 88
//        anchors.right: parent.right
//        currentState: 3                           // default button state 를 결정하는 변수

//        Rectangle{
//            width: parent.width
//            height: parent.height
//            color : "gray"
//            opacity: 0.3
//        }
////        Text{
////            id : text
////            anchors.verticalCenter: parent.verticalCenter
////            anchors.horizontalCenter: parent.horizontalCenter
////            text : stateButton.iconPath
////            font.pixelSize: 35
////        }
////        buttonStateArr: [
////            " 1X ",
////            " 2X ",
////            " 4X ",
////            " 8X ",
////            " 16X ",
////            " 32X ",
////        ]

//        Image {
//            id: image
//            anchors.verticalCenter: parent.verticalCenter
//            anchors.horizontalCenter: parent.horizontalCenter
//            source: stateButton.iconPath  // buttonStateArr 배열의 값을 , 출력하려는 Component 와 연결된 property
//        }
//        buttonStateArr: [
//            "../Flyer/Image/Compass/compass_00_d.png",
//            "",
//            "../Flyer/Image/Compass/icon_compass_north_n.png"
//        ]

//    }
//    // StateButton Example=========================================end













//    Item{
//        id : radioArea
//        width: 111
//        height: 172
//        anchors.top : stateButton.bottom
//        anchors.right: parent.right

//        RadioButton{
//            id : radioBtn
//            width : 111
//            height : 88

//            Rectangle{
//                width: parent.width
//                height: parent.height
//                color : "black"
//                opacity: 0.3
//            }

//            checked : false
//            animationEnabled: true
//        }

//        RadioButton{
//            id : radioBtn2
//            width : 111
//            height : 88
//            anchors.top: radioBtn.bottom
//            animationEnabled: true

//            Rectangle{
//                width: parent.width
//                height: parent.height
//                color : "black"
//                opacity: 0.2
//            }

//        }
//    }



}

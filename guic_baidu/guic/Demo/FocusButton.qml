import QtQuick 2.0
import IVIS.Component 1.0



Item {
    id : testScreen
    width: 800
    height: 440
    objectName: "testScreen"

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
            else if ( event.key === Qt.Key_Shift)
            {
                console.log("Enter")
                console.log(focusGroup.getCurrentItem())
                focusGroup.getCurrentItem().pressed = true
            }
        }
        Keys.onReleased: {
            if ( event.key === Qt.Key_Shift)
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
        objectName: "homeBtn"

        onPressedChanged: {
            if (pressed)
                focusGroup.moveFocusSpecificItem("homeBtn")
        }
    }

    Button_CheckedType{
        id : naviMuteOnOff
        objectName: "naviMuteOnOff"
        anchors.top: homeBtn.bottom

        onPressedChanged: {
            if (pressed)
                focusGroup.moveFocusSpecificItem("naviMuteOnOff")
        }
    }

    Button_CompassType{
        id : compassBtn
        objectName: "compassBtn"
        anchors.top: naviMuteOnOff.bottom

        onPressedChanged: {
            if (pressed)
                focusGroup.moveFocusSpecificItem("compassBtn")
        }
    }

    Button_ScaleType{
        id : scaleBtn
        objectName: "scaleBtn"
        anchors.top: compassBtn.bottom
        zoomValue: 1600

        onPressedChanged: {
            if (pressed)
                focusGroup.moveFocusSpecificItem("scaleBtn")
        }
    }

    Button_TextType{
        id : textBtn
        objectName: "textBtn"
        anchors.top: scaleBtn.bottom

        onPressedChanged: {
            if (pressed)
                focusGroup.moveFocusSpecificItem("textBtn")
        }

    }

    Component.onDestruction: {
        FocusGroupManager.unregisterFocusGroupByID(focusGroup)
    }
}

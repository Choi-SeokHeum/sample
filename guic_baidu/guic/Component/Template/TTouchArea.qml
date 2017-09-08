import QtQuick 2.0

MouseArea {
    id : tTouchArea
    objectName: "tTouchArea"

    width: 50
    height: 50

    property alias tTouchArea : tTouchArea
    property int valueX : 0
    property int valueY : 0

    onMouseXChanged: {
        valueX = mouseX
    }
    onMouseYChanged: {
        valueY = mouseY
    }
    onReleased: {
        console.log("TTouchArea Mouse X is ", valueX)
        console.log("TTouchArea Mouse Y is ", valueY)
    }

}

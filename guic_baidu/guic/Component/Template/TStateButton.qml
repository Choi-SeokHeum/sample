import QtQuick 2.0

TButton {
    id : tStateButton
    objectName: "tStateButton"
    width: 50
    height: 50

    checked: false
    checkable: true
    autoExclusive: false

    property var buttonStateArr: []
    property int currentState: 0
    property string iconPath : buttonStateArr[currentState]

    signal stateChange(int currentState)

    onClicked: {
        privateObject.onRotateCurrentIndex()
    }

    QtObject {
        id : privateObject
        objectName: "privateObject"

        function onReleased (mouseX,mouseY)
        {
            if ( tStateButton.pressed)
            {
                if ( tStateButton.checkable && tStateButton.autoExclusive )
                    tStateButton.toggle()
            }
        }

        function onRotateCurrentIndex()
        {
            currentState = (currentState + 1) % buttonStateArr.length
            tStateButton.stateChange(currentState)
            console.log("signal : ", currentState)
        }
    }
}

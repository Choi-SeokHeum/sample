import QtQuick 2.0

TButton {
    id: checkButton
    objectName: "checkButton"

    checked: false
    checkable: true
    autoExclusive: false

    onClicked: {
        privateObject.onClicked()
    }

    onCheckableChanged: {
        checkButton.autoRepeat = false
    }

    QtObject {
        id: privateObject
        objectName: "PrivateObject"

        function onClicked ()
        {
            if (checkButton.checkable && !checkButton.autoExclusive )
                checkButton.toggle()
        }
    }
}

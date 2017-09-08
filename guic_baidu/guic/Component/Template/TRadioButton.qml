import QtQuick 2.0

TButton {
    id: radioButton
    objectName: "RadioButton"

    checked: false
    checkable: true
    autoExclusive: true

    onPressedChanged: {
        console.log("radiobtn sample pressed changed")
    }

    onClicked: {
        privateObject.onClicked()
    }

    onAutoExclusiveChanged: {
        radioButton.autoRepeat = false
    }

    onCheckedChanged: {
        if (checked)
        {
            if (radioButton.chekable !== undefined && radioButton.autoExclusive !== undefined
                    && radioButton.checkable && radioButton.autoExclusive)
            {
                var exclusiveButton = privateObject.findExclusiveButton()

                if (exclusiveButton !== radioButton)
                {
                    exclusiveButton.toggle()
                }
            }
        }
    }

    QtObject {
        id: privateObject
        objectName: "PrivateObject"

        function onClicked ()
        {
            console.log("onreleased TRadioButtonSample")
            if (radioButton.checkable && radioButton.autoExclusive)
            {
                var exclusiveButton = privateObject.findExclusiveButton()
                exclusiveButton.toggle()
                radioButton.toggle()
            }

        }

        function findExclusiveButton()
        {
            var parent = radioButton.parent

            for (var i = 0; i < parent.children.length; i++)
            {
                if (parent.children[i].autoExclusive && parent.children[i].checked)
                {
                    console.log("findExclusiveButton", i, parent.children[i].objectName)
                    return parent.children[i]
                }
            }
        }
    }
}

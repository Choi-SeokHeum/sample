import QtQuick 2.0

TButton {
    id: tabButton
    objectName: "tabButton"

    checked: false
    checkable: true
    autoExclusive: true

    onPressedChanged: {
        console.log("tabbtn sample pressed changed")
    }

    onClicked: {
        privateObject.onClicked()
    }

    onAutoExclusiveChanged: {
        tabButton.autoRepeat = false
    }

    onCheckedChanged: {
        if (checked)
        {
            if (tabButton.chekable !== undefined && tabButton.autoExclusive !== undefined
                    && tabButton.checkable && tabButton.autoExclusive)
            {
                var exclusiveButton = privateObject.findExclusiveButton()

                if (exclusiveButton !== tabButton)
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
            console.log("onreleased TTabButtonSample")
            if (tabButton.checkable && tabButton.autoExclusive)
            {
                var exclusiveButton = privateObject.findExclusiveButton()
                exclusiveButton.toggle()
                tabButton.toggle()
            }

        }

        function findExclusiveButton()
        {
            var parent = tabButton.parent

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

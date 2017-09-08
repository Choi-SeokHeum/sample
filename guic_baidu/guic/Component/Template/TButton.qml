import QtQuick 2.0

TControl {
    id: button
    objectName: "Button"

    property string text: button.objectName

    property bool checked: false
    property bool checkable: false
    property bool autoExclusive: false

    property bool pressed: false
    property bool highlighted: false
    property bool autoRepeat: false
    property bool animationEnabled: false

    property int autoRepeatDelay: 100 //msec
    property int autoRepeatInterval: 800 //msec

    signal released(int mouseX, int mouseY)
    signal clicked
    signal canceled
    signal exited

    signal autoRepeated(int count)
    signal autoRepeatStarted
    signal autoRepeatEnded

    property bool myFocus : false

    state: "NORMAL"

    onPressedChanged: {
        if(!pressed)
        {
            if (button.autoRepeat)
            {
                console.log("timer stop")
                autoRepeatTimer.stop()

                if (privateObject.autoRepeatCount)
                {
                    autoRepeatEnded()
                    privateObject.autoRepeatCount = 0
                }
            }
        }

        setState()
    }

    onEnabledChanged: {
        setState()
    }

    onMyFocusChanged: {
        setState()
    }

    states: [
        State {
            name: "NORMAL"
        },
        State {
            name: "PRESSED"
        },
        State {
            name: "FOCUSED"
        },
        State {
            name: "DISABLED"
        }
    ]

    function setState()
    {
        if ( !button.enabled )
        {
            state = "DISABLED"
        }
        else
        {
           if ( button.myFocus  )
           {
               if (button.pressed )
               {
                   state = "PRESSED"
               }
               else
               {
                   state = "FOCUSED"
               }
           }
           else if (!button.myFocus)
           {
               if( button.pressed )
               {
                   state = "PRESSED"
               }
               else
               {
                   state = "NORMAL"
               }
           }
        }
    }

    function resetState()
    {
        privateObject.onExited()
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        objectName: "ButtonMouseArea"

        onPressed: {
            //console.log("onPressed")
            privateObject.onPressed(mouseX, mouseY)
        }

        onPositionChanged: {
            privateObject.onPositionChanged(mouseX, mouseY)
        }

        onReleased: {
            //console.log("onReleased")
            privateObject.onReleased(mouseX, mouseY)
        }

        onExited: {
            //console.log("onExited")
            privateObject.onExited()
        }

        onCanceled: {
            //console.log("onCanceled")
            privateObject.onCanceled(mouseX, mouseY)
        }

        onClicked: {
            //console.log("onCanceled")
            privateObject.onClicked()
        }
    }

    Timer {
        id: autoRepeatTimer
        objectName: "AutoRepeatTimer"
        interval: button.autoRepeatInterval
        repeat: true

        onTriggered: {
            privateObject.autoRepeatCount++

            if (privateObject.autoRepeatCount == 1)
                button.autoRepeatStarted()

            button.autoRepeated(privateObject.autoRepeatCount)
        }
    }

    function toggle()
    {
        if (button.checkable)
        {
            button.checked = !button.checked
            console.log(button.objectName, "toggle", button.checked)
        }
        else
        {
            console.log(button.objectName, "toggle", "buttton.checkable is false.")
        }
    }

    //private functions, properties
    QtObject {
        id: privateObject
        objectName: "PrivateObject"

        property bool exited: false
        property int autoRepeatCount: 0

        onAutoRepeatCountChanged: {
            console.log(objectName, autoRepeatCount)
        }

        function onPressed (mouseX, mouseY)
        {
            button.pressed = true
            privateObject.exited = false

            if (button.autoRepeat)
                autoRepeatTimer.restart()
        }

        function onPositionChanged (mouseX, mouseY)
        {
            if (!privateObject.exited)
            {

            }
        }

        function onCanceled (mouseX, mouseY)
        {
//            if (button.autoRepeat)
//            {
//                //console.log("timer stop")
//                autoRepeatTimer.stop()
//                privateObject.autoRepeatCount = 0
//                button.autoRepeatEnded()
//            }

            if (button.pressed)
            {
                button.pressed = false
                privateObject.exited = true
                button.canceled()
            }
        }

        function onExited ()
        {
            //button.pressed = false

            if (button.pressed)
            {
                button.pressed = false
                privateObject.exited = true
                button.exited()
            }
        }

        function onReleased (mouseX, mouseY)
        {
            //console.log("onreleased TButton")

            button.released(mouseX, mouseY)
        }

        function onClicked (mouseX, mouseY)
        {
            //console.log("onclicked TButton")

            if(button.pressed && !privateObject.exited)
            {
                button.pressed = false
                button.clicked()
            }
        }
    }  
}

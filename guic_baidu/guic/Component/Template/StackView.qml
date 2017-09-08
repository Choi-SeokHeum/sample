import QtQuick 2.0

Item {
    id: stackView
    objectName: "stackView"

    signal topViewChanged()

    property var enterItem: stackView
    property var exitItem: stackView

    property int padding: 25
    property int animStartPos: 25

    property int orientation: Qt.Horizontal
    property int direction: Qt.LeftToRight
    property int anchor: 1

    property bool animationEnabled: true
    property int viewCount: 0

    readonly property bool busy: (stackView.state === "IDLE") ? false : true

    state: "IDLE"

    property StackViewTransition pushTransition
    property StackViewTransition popTransition

    onPushTransitionChanged: {
        pushTransition.animationStarted.connect(privateObject.animationStarted)
        pushTransition.animationStopped.connect(privateObject.animationStopped)
    }

    onPopTransitionChanged: {
        popTransition.animationStarted.connect(privateObject.animationStarted)
        popTransition.animationStopped.connect(privateObject.animationStopped)
    }

    states: [
        State {
            name: "PUSH"
        },
        State {
            name: "POP"
        },
        State {
            name: "IDLE"
        }
    ]

    function push(viewSource, animationEnabled)
    {
        privateObject.push(viewSource, animationEnabled)
    }

    function pop()
    {
        privateObject.pop()
    }

    function clear()
    {
        privateObject.clear()
    }

    function getCurrentView()
    {
        return privateObject.getCurrentView()
    }

    function getView(index)
    {
        return privateObject.getView(index)
    }

    function isForegroundView(view)
    {
        return privateObject.isForegroundView(view)
    }

    QtObject {
        id: privateObject

        property var idContainer: []
        property var objectNameContainer: []

        property var topView

        function push(viewSource, animationEnabled)
        {
            if (state !== "IDLE")
                return

            if (idContainer.length)
            {
                var foregroundView = idContainer[idContainer.length - 1]
                foregroundView.enabled = false

                exitItem = foregroundView
            }

            var viewComponent = Qt.createComponent(viewSource)
            var viewObject

            var xPos
            var yPos

            viewObject = viewComponent.createObject(stackView)

            // set view position
            if (stackView.orientation === Qt.Horizontal)
            {
                if (anchor === 0)
                    viewObject.x = stackView.x + stackView.padding * idContainer.length
                else
                    viewObject.x = (stackView.x + stackView.width - viewObject.width) - (stackView.padding * idContainer.length)

                viewObject.y = stackView.y
                viewObject.z = stackView.z
            }
            else if (stackView.orientation === Qt.Vertical)
            {
                viewObject.x = stackView.x
                viewObject.y = stackView.padding * (idContainer.length)
            }

            //save view to container
            idContainer.push(viewObject)
            objectNameContainer.push(viewObject.objectName)
            stackView.viewCount++

            //set enter item
            stackView.enterItem = viewObject

            //show animation
            if (pushTransition === null)
            {
                var transitionComponent = Qt.createComponent("PushTransition.qml")
                var transitionObject

                transitionObject = transitionComponent.createObject(stackView)

                pushTransition = transitionObject
            }

            if (animationEnabled === undefined/* && stackView.animationEnabled === false*/)
            {
                if (stackView.animationEnabled)
                    privateObject.startAnimation(pushTransition)
                else
                    stackView.topViewChanged()

                //return
            }
            else if (animationEnabled)
                privateObject.startAnimation(pushTransition)
        }

        function pop(animationEnabled)
        {
            if (state !== "IDLE" || !idContainer.length)
                return

            var object = idContainer[idContainer.length - 1]
            stackView.exitItem = object

            if (animationEnabled === undefined/* && stackView.animationEnabled === false*/)
            {
                if (stackView.animationEnabled)
                {
                    if (popTransition === null)
                    {
                        var transitionComponent = Qt.createComponent("PopTransition.qml")
                        var transitionObject

                        transitionObject = transitionComponent.createObject(stackView)

                        popTransition = transitionObject

                        popTransition.animationStarted.connect(privateObject.animationStarted)
                        popTransition.animationStopped.connect(privateObject.animationStopped)
                    }

                    privateObject.startAnimation(popTransition)
                }
                else
                {
                    object = privateObject.idContainer[idContainer.length - 1]
                    var prevObject = privateObject.idContainer[idContainer.length - 2]

                    if (prevObject !== undefined)
                    {
                        exitItem = prevObject
                        enterItem = prevObject
                    }
                    else
                    {
                        exitItem = stackView
                        enterItem = stackView
                    }

                    object.destroy()
                    privateObject.idContainer.pop()

                    if (privateObject.idContainer.length)
                    {
                        object = privateObject.idContainer[idContainer.length - 1]
                        object.enabled = true
                    }

                    console.log(idContainer.length)

                    stackView.topViewChanged()
                }
            }
            else if (animationEnabled)
                privateObject.startAnimation(popTransition)

//            if (animationEnabled === undefined && stackView.animationEnabled === false)
//                return
//            else
//                privateObject.startAnimation(popTransition)
        }

        function clear()
        {
            var object

            stackView.enterItem = stackView
            stackView.exitItem = stackView

            for (var i = idContainer.length - 1 ; i >= 0 ; i--)
            {
                object = idContainer[i]
                object.destroy()

                idContainer.pop()
            }
        }

        function getCurrentView()
        {
            var object = privateObject.idContainer[idContainer.length - 1]

            return object
        }

        function getView(index)
        {
            var object = privateObject.idContainer[index]

            return object
        }

        function isForegroundView(view)
        {
            if (!idContainer.length)
                return false

            var object = privateObject.idContainer[idContainer.length - 1]

            if (view.objectName === object.objectName)
                return true
            else
                return false
        }

        function animationStopped()
        {
            console.log("animationStopped")

            if (stackView.state === "POP")
            {
                var object = privateObject.idContainer[idContainer.length - 1]
                var prevObject = privateObject.idContainer[idContainer.length - 2]

                if (prevObject !== undefined)
                {
                    exitItem = prevObject
                    enterItem = prevObject
                }
                else
                {
                    exitItem = stackView
                    enterItem = stackView
                }

                object.destroy()
                privateObject.idContainer.pop()

                if (privateObject.idContainer.length)
                {
                    object = privateObject.idContainer[idContainer.length - 1]
                    object.enabled = true
                }
            }

            stackView.topViewChanged()
            stackView.state = "IDLE"
        }

        function animationStarted()
        {
            console.log("animationStarted")

            //stackView.state = "PUSH"
        }

        function startAnimation(transition)
        {
            if (transition === pushTransition)
                stackView.state = "PUSH"
            else if (transition === popTransition)
                stackView.state = "POP"

            transition.start()
            //transition.running = true
        }
    }
}

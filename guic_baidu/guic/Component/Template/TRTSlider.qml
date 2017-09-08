import QtQuick 2.0

TControl {
    id: tRTSlider
    objectName: "tRTSlider"

    property real from: 0
    property real to: 1
    property real value: 0
    property real position: 0
    property real stepSize: 0
    property bool pressed: false
    property bool moving: false
    property bool snapMode: false
    property bool animationEnabled: false

    property var handle
    property var track

    signal realTime_valueChange

    onFromChanged: {
        if (from > to)
        {
            from = to
        }

        if (from > value)
        {
            value = from
        }
    }

    onToChanged: {
        if (from > to)
        {
            from = to
        }

        if (from > value)
        {
            value = from
        }
    }

    onValueChanged: {
        if (value > to)
            value = to

        if (from > value)
            value = from

        privateObject.updatePosition()
        console.log("TRealtimeSlider value : ", value)
        realTime_valueChange()
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        objectName: "SliderMouseArea"

        onPressed: privateObject.onPressed(mouseX, mouseY)
        onPositionChanged: privateObject.onPositionChanged(mouseX, mouseY)
        onReleased: privateObject.onReleased(mouseX, mouseY)
    }

    function increase()
    {
        var tempValue = tRTSlider.value

        if (tRTSlider.stepSize === 0)
            tempValue += 0.1
        else
            tempValue += tRTSlider.stepSize

        if (tempValue <= to)
        {
            tRTSlider.value = tempValue
        }
    }

    function decrease()
    {
        var tempValue = tRTSlider.value

        if (tRTSlider.stepSize === 0)
            tempValue -= 0.1
        else
            tempValue -= tRTSlider.stepSize

        if (tempValue >= from)
        {
            tRTSlider.value = tempValue
        }
    }


    QtObject {
        id: privateObject

        function onPressed (mouseX, mouseY)
        {
            tRTSlider.position = positionAt(mouseX, mouseY)
            tRTSlider.pressed = true
        }

        function onPositionChanged (mouseX, mouseY)
        {
            tRTSlider.position = positionAt(mouseX, mouseY)

            if (tRTSlider.snapMode)
            {
                if(tRTSlider.value === snapValue(valueAt(tRTSlider.position)))
                    privateObject.updatePosition()
                else
                    tRTSlider.value = snapValue(valueAt(tRTSlider.position))
            }
            else
                tRTSlider.value = valueAt(tRTSlider.position)

            tRTSlider.pressed = true
            tRTSlider.moving = true
        }

        function onReleased (mouseX, mouseY)
        {
            tRTSlider.position = positionAt(mouseX, mouseY)

            if (tRTSlider.snapMode)
            {
                if(tRTSlider.value === snapValue(valueAt(tRTSlider.position)))
                    privateObject.updatePosition()
                else
                    tRTSlider.value = snapValue(valueAt(tRTSlider.position))
            }
            else
                tRTSlider.value = valueAt(tRTSlider.position)

            tRTSlider.pressed = false
            tRTSlider.moving = false
        }

        function valueAt(position)
        {
            return tRTSlider.from + (tRTSlider.to - tRTSlider.from) * position;
        }

        function snapValue(value)
        {
            if (tRTSlider.stepSize === 0)
                return value

            return Math.round(value / tRTSlider.stepSize) * tRTSlider.stepSize;
        }

        function updatePosition()
        {
            var pos = 0;
            pos = (tRTSlider.value - tRTSlider.from) / (tRTSlider.to - tRTSlider.from);
            tRTSlider.position = pos
        }

        function positionAt(x, y)
        {
            var pos = x / tRTSlider.width

            if (pos < 0)
                pos = 0
            else if (pos > 1)
                pos = 1

            return pos
        }
    }
}

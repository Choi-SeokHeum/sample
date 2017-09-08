import QtQuick 2.0

TControl {
    id: slider
    objectName: "Slider"

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
        var tempValue = slider.value

        if (slider.stepSize === 0)
            tempValue += 0.1
        else
            tempValue += slider.stepSize

        if (tempValue <= to)
        {
            slider.value = tempValue
        }
    }

    function decrease()
    {
        var tempValue = slider.value

        if (slider.stepSize === 0)
            tempValue -= 0.1
        else
            tempValue -= slider.stepSize

        if (tempValue >= from)
        {
            slider.value = tempValue
        }
    }


    QtObject {
        id: privateObject

        function onPressed (mouseX, mouseY)
        {
            slider.position = positionAt(mouseX, mouseY)
            slider.pressed = true
        }

        function onPositionChanged (mouseX, mouseY)
        {
            slider.position = positionAt(mouseX, mouseY)
            slider.moving = true
        }

        function onReleased (mouseX, mouseY)
        {
            slider.position = positionAt(mouseX, mouseY)

            if (slider.snapMode)
            {
                if(slider.value === snapValue(valueAt(slider.position)))
                    privateObject.updatePosition()
                else
                    slider.value = snapValue(valueAt(slider.position))
            }
            else
                slider.value = valueAt(slider.position)

            slider.pressed = false
            slider.moving = false
        }

        function valueAt(position)
        {
            return slider.from + (slider.to - slider.from) * position;
        }

        function snapValue(value)
        {
            if (slider.stepSize === 0)
                return value

            return Math.round(value / slider.stepSize) * slider.stepSize;
        }

        function updatePosition()
        {
            var pos = 0;
            pos = (slider.value - slider.from) / (slider.to - slider.from);
            slider.position = pos
        }

        function positionAt(x, y)
        {
            var pos = x / slider.width

            if (pos < 0)
                pos = 0
            else if (pos > 1)
                pos = 1

            return pos
        }
    }
}

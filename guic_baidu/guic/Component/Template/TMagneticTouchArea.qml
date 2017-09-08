import QtQuick 2.0

TTouchArea {
    id : tMagneticTouchArea
    objectName: "tMagneticTouchArea"

    width: 300
    height: 300

    property int magneticValueX
    property int magneticValueY

    valueX: magneticValueX
    valueY: magneticValueY

    property int centerX : width / 2
    property int centerY : height / 2

    property double checkingX : tMagneticTouchArea.width/2
    property double checkingY : tMagneticTouchArea.height/2

    property int maxX : 10
    property int maxY : 10
    property int minX : -10
    property int minY : -10

    property int stepSize : width / (maxX+maxY)
    property double halfStep : stepSize/2

    onMouseXChanged: checkX(valueX)
    onMouseYChanged: checkY(valueY)

    function checkX(xMouseVal)
    {
        var temp = Math.round(xMouseVal - checkingX ) / stepSize

        if ( temp > maxX )
            valueX = maxX
        else if ( (xMouseVal-checkingX)/stepSize < minX )
            valueX = minX
        else
            setX(valueX)
        return valueX
    }

    function checkY(yMouseVal)
    {
        var temp = Math.round(yMouseVal - checkingY ) / stepSize

        if ( temp > maxY )
            valueY = maxY
        else if ( (yMouseVal-checkingY)/stepSize < minY )
            valueY = minY
        else
            setY(valueY)
        return valueY
    }

    function setX(xMouseVal)
    {
        var temp = Math.round(xMouseVal - checkingX) / stepSize

        if ( minX <= temp && maxX >= temp )
        {
            if ( xMouseVal > checkingX )
            {
                if ( (Math.round(xMouseVal - checkingX)%stepSize) > halfStep )
                {
                    valueX = temp+1
                }
                else
                {
                    valueX = temp
                }
            }
            else if ( xMouseVal < checkingX )
            {
                if ( ((xMouseVal - checkingX)%stepSize) < (halfStep*-1) )
                {
                    valueX = temp-1
                }
                else
                {
                    valueX = temp
                }
            }
        }
        console.log("TMagneticTouchArea setX is", valueX)
        console.log("TMagneticTouchArea width is ", tMagneticTouchArea.width)
        return valueX
    }

    function setY(yMouseVal)
    {
        var temp = Math.round(yMouseVal - checkingY) / stepSize

        if ( minY <= temp && maxY >= temp )
        {
            if ( yMouseVal > checkingY )
            {
                if ( (Math.round(yMouseVal - checkingY)%stepSize) > halfStep )
                {
                    valueY = temp+1
                }
                else
                {
                    valueY = temp
                }
            }
            else if ( yMouseVal < checkingY )
            {
                if ( (yMouseVal - checkingY)%stepSize < (halfStep*-1))
                {
                    valueY = temp-1
                }
                else
                {
                    valueY = temp
                }
            }
        }
        console.log("TMagneticTouchArea setY is ", valueY)
        console.log("TMagneticTouchArea height is", tMagneticTouchArea.height)
        return valueY
    }

    //Increase () X, Y
    function increaseX()
    {
        var tempValue = tMagneticTouchArea.valueX
        if ( tempValue === minX )
            tempValue += 1
        else if ( tempValue === maxX )
            tempValue = maxX
        else
            tempValue += 1
        tMagneticTouchArea.valueX = tempValue
        return tMagneticTouchArea.valueX
    }
    function increaseY()
    {
        var tempValue = tMagneticTouchArea.valueY
        if ( tempValue === minY )
            tempValue = minY
        else if ( tempValue === maxY )
            tempValue -= 1
        else
            tempValue -= 1
        tMagneticTouchArea.valueY = tempValue
        return tMagneticTouchArea.valueY
    }

    //Decrease () X, Y
    function decreaseX()
    {
        var tempValue = tMagneticTouchArea.valueX
        if ( tempValue === minX )
            tempValue = minX
        else if ( tempValue === maxX )
            tempValue -= 1
        else
            tempValue -= 1
        tMagneticTouchArea.valueX = tempValue
        return tMagneticTouchArea.valueX
    }
    function decreaseY()
    {
        var tempValue = tMagneticTouchArea.valueY
        if ( tempValue === minY )
            tempValue += 1
        else if ( tempValue === maxY )
            tempValue = maxY
        else
            tempValue += 1
        tMagneticTouchArea.valueY = tempValue
        return tMagneticTouchArea.valueY
    }
}

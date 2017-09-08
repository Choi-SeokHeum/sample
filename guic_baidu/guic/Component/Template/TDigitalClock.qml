import QtQuick 2.0

Item {
    id : tDigitalClock
    objectName: "tDigitalClock"

    property url tenCurrentHour
    property url oneCurrentHour
    property url tenCurrentMin
    property url oneCurrentMin

    property int hour : -1
    property int min  : -1

    property url imagePath : ""// "../../Component/IVIS-A/Navigation/Image/SpeedNumber/normalSpeed/id_under_"
    /*
        imagePath 는 digitalClock 에 표시될 숫자이미지 경로를 가지고 있는 property 입니다.
         사용자께서는 프로젝트에 맞는 이미지 경로를 imagePath 라는 property 에 설정하신 후 사용하시기 바랍니다.
    */

    property bool time24
    property bool amPm

    onHourChanged: {
        private_Class.checkingAMPM(hour)
        private_Class.checkingTime24(hour)
    }

    onTime24Changed: {
        private_Class.checkingTime24(hour)
    }

    onMinChanged: {
        private_Class.minCalculator(min)
    }


    QtObject{
        id : private_Class

        function hourCalculator( hourValue )
        {
            var a = Math.floor(hourValue/10)
            var b = Math.floor(hourValue%10)

            transformHourImage( a, b )
        }

        function transformHourImage(tenValue, oneValue)
        {
            var temp1; var temp2;

            for ( var i=0; i<10; i++ )
            {
                if ( tenValue === i )
                {
                    temp1 = imagePath+i+".png"
                }
            }

            for ( var j=0; j<10; j++ )
            {
                if ( oneValue === j)
                {
                    temp2 = imagePath+j+".png"
                }
            }

            tenCurrentHour = temp1
            oneCurrentHour = temp2
        }

        function minCalculator( minValue )
        {
            var a = Math.floor(minValue/10)
            var b = Math.floor(minValue%10)

            transformMinImage( a, b )
        }

        function transformMinImage(tenValue, oneValue)
        {
            var temp1; var temp2;

            for ( var i=0; i<10; i++ )
            {
                if ( tenValue === i )
                {
                    temp1 = imagePath+i+".png"
                }
            }

            for ( var j=0; j<10; j++ )
            {
                if ( oneValue === j)
                {
                    temp2 = imagePath+j+".png"
                }
            }

            tenCurrentMin = temp1
            oneCurrentMin = temp2
        }

        function checkingTime24(hourValue)
        {
            var timeValue;

            if ( time24 === false )
            {
                if ( hourValue > 12 )
                {
                    timeValue = hourValue - 12
                }
                else
                {
                    timeValue = hourValue
                }
            }
            else if ( time24 === true)
            {
                timeValue = hourValue
            }
            hourCalculator(timeValue)
        }

        function checkingAMPM(hourValue)
        {
            var ampmValue;

            if ( hourValue > 11 )
            {
                ampmValue = false
            }
            else
            {
                ampmValue = true
            }

            amPm = ampmValue
            return amPm
        }
    }
}

import QtQuick 2.0

Item {
    id : tSaftyAlert
    objectName: "tSaftyAlert"

    property url hundredCurrentSpeedPath
    property url tenCurrentSpeedPath
    property url oneCurrentSpeedPath

    property url hundredAverageSpeedPath
    property url tenAverageSpeedPath
    property url oneAverageSpeedPath

    property url hundredDistancePath
    property url tenDistancePath
    property url oneDistancePath

    property url referenceImage

    property int referenceSpeed
    property int distanceValue
    property int currentSpeed
    property int averageSpeed

    property string normalPath    : ""//"../../Component/IVIS-A/Navigation/Image/SpeedNumber/normalSpeed/id_under_"
    property string overPath      : ""//"../../Component/IVIS-A/Navigation/Image/SpeedNumber/overSpeed/id_over_"
    property string averagePath   : ""//"../../Component/IVIS-A/Navigation/Image/SpeedNumber/normalSpeed/id_under_"
    property string distancePath  : ""//"../../Component/IVIS-A/Navigation/Image/SpeedNumber/overSpeed/id_over_"
    property string referencePath : ""//"../../Component/Baidu/Flyer/Image/SaftyAlert/drive_safe_num"

    /*

      상단의 Path 관련된 property 에 대한 설명
      안전경고에 대한 Flyer 에서 속도에 관련된 이미지를 참조하는 property 입니다.
      사용자께서는 프로젝트에 맞게 경로를 설정하여 사용하시기 바랍니다.

    normalPath      : 기본속도 이미지
    overPath        : 과속속도 이미지
    averagePath     : 평균속도 이미지
    distancePath    : 남은거리 이미지
    referencePath   : 기준속도 이미지

      */

    onReferenceSpeedChanged: {
        private_Class.valueCalculator(currentSpeed )
        private_Class.referenceSpeedTransFormImage(referenceSpeed)
    }

    onCurrentSpeedChanged: private_Class.valueCalculator(currentSpeed )

    onAverageSpeedChanged: {
        private_Class.valueCalculator( averageSpeed )
    }
    onDistanceValueChanged: {
        private_Class.valueCalculator( distanceValue )
    }

    QtObject{
        id : private_Class

        function valueCalculator( value )
        {
            var type;
            switch ( value )
            {
            case currentSpeed : type = currentSpeed; break;
            case averageSpeed : type = averageSpeed; break;
            case distanceValue : type = distanceValue; break;
            default: break;
            }

            var a = Math.floor(value / 100)
            var b = Math.floor((value % 100) / 10)
            var c = Math.floor(value % 10)

            numberTransFormImage(type,a,b,c )
            console.log(" valueCalculator " ,type,a,b,c)
        }

        function numberTransFormImage (valueTpye,hundredValue,tenValue,oneValue )
        {
            var temp1; var temp2; var temp3; var path

            switch ( valueTpye )
            {
            case currentSpeed  :
                if ( currentSpeed <= referenceSpeed )
                {
                    path = normalPath ;
                    break;
                }
                else//currentSpeed > referenceSpeed
                {
                    path = overPath;
                    break;
                }
            case averageSpeed                   :
                console.log("averageSpeed")
                path = averagePath;
                break;
            case distanceValue                  :
                path = distancePath;
                break;
            default:                              break;
            }

            for(var i=0; i<10; i++)
            {
                if (hundredValue === i )
                {
                    if ( hundredValue === 0 )
                    {
                        temp1 = ""
                    }
                    else
                    {
                        temp1 = path+i+".png"
                    }
                }
            }
            for ( var j=0; j<10; j++ )
            {
                if (tenValue === j )
                {
                    if ( hundredValue === 0 && tenValue === 0)
                    {
                        temp2 = ""
                    }
                    else
                    {
                        temp2 = path+j+".png"
                    }
                }
            }
            for ( var z=0; z<10; z++ )
            {
                if ( oneValue === z)
                {
                    temp3 = path+z+".png"
                }
            }

            switch ( valueTpye )
            {
            case currentSpeed                   :
                hundredCurrentSpeedPath     = temp1;
                tenCurrentSpeedPath         = temp2;
                oneCurrentSpeedPath         = temp3;
                break;
            case averageSpeed                   :
                hundredAverageSpeedPath     = temp1;
                tenAverageSpeedPath         = temp2;
                oneAverageSpeedPath         = temp3;
                break;
            case distanceValue                  :
                hundredDistancePath         = temp1;
                tenDistancePath             = temp2;
                oneDistancePath             = temp3;
                break;
            default:
                break;
            }
        }

        function referenceSpeedTransFormImage(referenceSpeed)
        {
            var a = Math.floor(referenceSpeed/10)
            referenceImage = referencePath+a+"0"+".png"
        }
    }
}

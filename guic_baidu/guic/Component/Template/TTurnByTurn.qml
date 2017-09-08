import QtQuick 2.0

Item {
    id : tTurnByTurn
    objectName: "tTurnByTurn"

    property int distanceValue                 //첫번째 남은거리를 받아서 저장하는 property
    property url image_Hundred_FirstDistance            //첫번째 백의 자리와 매칭되는 이미지를 저장하는 property
    property url image_Ten_FirstDistance               //첫번째 십의 자리와 매칭되는 이미지를 저장하는 property
    property url image_One_FirstDistance               //첫번째 일의 자리와 매칭되는 이미지를 저장하는 property

    property int secondDistanceValue                 //두번째 남은거리를 받아서 저장하는 property
    property url image_Hundred_SecondDistance            //두번째 백의 자리와 매칭되는 이미지를 저장하는 property
    property url image_Ten_SecondDistance               //두번째 십의 자리와 매칭되는 이미지를 저장하는 property
    property url image_One_SecondDistance               //두번째 일의 자리와 매칭되는 이미지를 저장하는 property

    property string firstImagePath : ""//"../../Component/IVIS-A/Navigation/Image/SpeedNumber/normalSpeed/id_under_"
    property string secondImagePath :""//"../../Component/IVIS-A/Navigation/Image/SpeedNumber/overSpeed/id_over_"

    /*

      상단의 Path 관련된 property 에 대한 설명
      TurnByTurn 에서 남은거리를출력할때 필요한 숫자 이미지를 참조하는 property 입니다.
      사용자께서는 프로젝트에 맞게 경로를 설정하여 사용하시기 바랍니다.

    firstImagePath         : 첫번째 영역 거리 이미지
    secondImagePath        : 두번째 영역 거리  이미지

      */

    onDistanceValueChanged: {
        private_class.valueCalculator(distanceValue)
        console.log(" distanceValue " ,distanceValue)
    }

    onSecondDistanceValueChanged: {
        private_class.valueCalculator(secondDistanceValue)
        console.log(" secondDistanceValue " ,secondDistanceValue)
    }


    QtObject{
        id : private_class

        function valueCalculator( value )
        {
            var type;
            switch( value )
            {
            case distanceValue           : type = distanceValue; break;
            case secondDistanceValue     : type = secondDistanceValue; break;
            default                      : break;
            }

            if ( value > 999 )
            {
                var BigValue = Math.floor(value / 100)
            }
            else
            {
                BigValue = value
            }

            var a = Math.floor(BigValue / 100)
            var b = Math.floor((BigValue % 100) / 10)
            var c = Math.floor(BigValue % 10)

            transformImage(type, a,b,c)
            console.log(" valueCalculator " ,type,a,b,c)
        }



        function transformImage( valueType , hundredValue,tenValue,oneValue)
        {
            var temp1; var temp2; var temp3; var path;

            switch( valueType )
            {
            case distanceValue          : path =firstImagePath; break;
            case secondDistanceValue    : path =secondImagePath; break;
            default                     : break;
            }

            for (var i=0; i<10; i++)
            {
                if ( hundredValue === i )
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
                if ( tenValue === j )
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

            switch( valueType )
            {
            case distanceValue :
                image_Hundred_FirstDistance =temp1;
                image_Ten_FirstDistance = temp2
                image_One_FirstDistance = temp3
                break;
            case secondDistanceValue :
                image_Hundred_SecondDistance = temp1;
                image_Ten_SecondDistance = temp2;
                image_One_SecondDistance = temp3;
                break;
            default :
                break;
            }
        }
    }
}

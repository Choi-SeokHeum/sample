import QtQuick 2.0
import IVIS.Component 1.0

/* ==================== BAIDU HMI NAVIFLYER SAFTYALERT DESCRIPTION =================


  TSaftyAlert 을 상속받아 만든 Component.
  Template 에는 속도, 거리, 등의 숫자 값을 이미지로 변환하는 Logic 을 가지고 있다.


  **************************  Skin property ******************************
  1. subImage_OnOff      : 신호등 , 버스 등의 안전경고 이미지 상단에 추가로 출력해야하는 작은 이미지를 출력시킬지 여부를 판단하는 property
  2. averageArea_OnOff   : 평균 속도값에 대한 정보를 출력시킬지 여부를 판단하는 property
  3. symbolImage         : 안전경고 이미지 ( 속도, 경고, 표지판 등등 )를 받아서 출력시키는 property
  4. subSymbolImage      : 신호등 , 버스 등의 안전경고 이미지 상단에 추가로 출력해야하는 이미지를 받아서 출력시키는 property
  ************************************************************************


  ************************ Template 에서 제공하는 property ****************************************************************************


  +++++++++++++++++++++++++++++ Data 를 받는 property +++++++++++++++++++++++++++++
  1. currentSpeed                : 현재 속도를 받아서 출력시키는 property
  2. referenceSpeed              : 기존 속도를 받아서 출력시키는 property
  3. averageSpeed                : 평균 속도를 받아서 출력시키는 property
  4. distanceValue               : 남은 거리를 받아서 출력시키는 property
  +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


  +++++++++++++++++++++++++++++ Data 값에 매칭되는 이미지를 담아서 Skin 으로 전달하는 property +++++++++++++++++++++++
  5. hundredCurrentSpeedPath     : 현재속도의 100의 자릿수 이미지 파일을 담는 property
  6. tenCurrentSpeedPath         : 현재속도의  10의 자릿수 이미지 파일을 담는 property
  7. oneCurrentSpeedPath         : 현재속도의   1의 자릿수 이미지 파일을 담는 property

  8. undredAverageSpeedPath      : 평균속도의 100의 자릿수 이미지 파일을 담는 property
  9. tenAverageSpeedPath         : 평균속도의  10의 자릿수 이미지 파일을 담는 property
  10.oneAverageSpeedPath         : 평균속도의   1의 자릿수 이미지 파일을 담는 property

  11.hundredDistancePath         : 남은 거리의 100의 자릿수 이미지 파일을 담는 property
  12.tenDistancePath             : 남은 거리의  10의 자릿수 이미지 파일을 담는 property
  13.oneDistancePath             : 남은 거리의   1의 자릿수 이미지 파일을 담는 property
  ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


  +++++++++++++++++++++++++++++++++ 숫자 imagePath property +++++++++++++++++++++++++++++++++++
  14. normalPath                 : 현재 속도가 기준속도보다 같거나 작을때 출력시켜야 하는 이미지 경로를 담은 property
  15. overPath                   : 현재 속도가 기준속도보다 클때 출력시켜야 하는 이미지 경로를 담은 property
  16. averagePath                : 평균 속도 이미지의 경로를 담은 property
  17. distancePath               : 남은 거리 이미지의 경로를 담은 property
  18. referencePath              : 기준 속도 이미지의 경로를 담은 property
  ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

  *************************************************************************************************************************************

  +++++++++++++++   imagePath 사용시 주의 사항 ++++++++++++++++++++++++++++
  1. 숫자 이미지 파일은 대부분 파일명이 아래와 같은 형태로 구성되며, 그렇지 않을 경우 반드시 해당 형태로 구성된 파일명으로
    만들 것을 강제한다.

    일반적인 형태 -  숫자 이미지 파일의 경우 파일 명
      0 - xxxxxxx_0.png
      1 - xxxxxxx_1.png
      2 - xxxxxxx_2.png
      3 - xxxxxxx_3.png
      4 - xxxxxxx_4.png
      5 - xxxxxxx_5.png
      6 - xxxxxxx_6.png
      7 - xxxxxxx_7.png
      8 - xxxxxxx_8.png
      9 - xxxxxxx_9.png

    xxxxxxx_ 까지는 동일하며 뒤에 붙는 "숫자.png" 가 다르다.

    숫자 이미지 파일은 파일명이 같으며 해당 숫자가 마지막에 붙는 형식으로 파일명이 새겨진다.
    이러한 형태의 파일명이 아닐 경우 위와 같은 형태로 파일명을 수정할 것을 강제한다. ( 반드시 지켜야 한다. )

  2. imagePath 에 이미지 소스 경로를 삽입할 때는  "~~~xxxxxx_" 까지만 넣는다.

  3. .png 등의 확장자는 신경쓰지 않아도 된다.

  결론 : 마지막 숫자를 식별하는 file 명의 끝자리를 통해 매칭되는 file 을 찾기 때문에 imagePath 는 공통된 경로까지만
       설정하여 삽입한다.
  +++++++++++++++   imagePath 사용시 주의 사항 ++++++++++++++++++++++++++++

 ==================================================================================*/



TSaftyAlert {
    id : saftyAlert
    objectName: "saftyAlert"
    width: 253
    height: 207


    property url symbolImage         : ""//"Image/SaftyAlert/icon_speedlimit_red.png"
    property url subSymbolImage      : ""//"Image/SaftyAlert/drive_safe_bus.png"
    property bool averageArea_OnOff  : false
    property bool subImage_OnOff     : false

    onAverageArea_OnOffChanged: averageArea_OnOff != averageArea_OnOff
    onSubImage_OnOffChanged: subImage_OnOff != subImage_OnOff

//    Component.onCompleted: {
//        currentSpeed= 90
//        referenceSpeed=120
//        averageSpeed = 80
//        distanceValue = 100
//        subImage_OnOff = true
//        averageArea_OnOff = true
//    }

    Image{
        id : averageBg
        width: 218
        height: 132
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 57
        visible: averageArea_OnOff ? true : false
        source : ""//"Image/SaftyAlert/bg_avr_kr.png"
        /*
          평균속도값에 대한 배경이미지
          사용자께서 프로젝트에 맞게 경로를 설정하여 평균속도 배경 이미지를 넣어주시면 됩니다.

          */

        Item{
            id : averageArea
            width: 130
            height: 80
            anchors.right: parent.right
            anchors.bottom: parent.bottom

            Item{
                id : averageValueArea
                width: 90
                height: 39
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                Image{
                    id : averageHundredImage
                    width: 30
                    height: 39
                    source: saftyAlert.hundredAverageSpeedPath
                }
                Image{
                    id : averageTenImage
                    width: 30
                    height: 39
                    anchors.left: averageHundredImage.right
                    source: saftyAlert.tenAverageSpeedPath
                }
                Image{
                    id : averageOneImage
                    width: 30
                    height: 39
                    anchors.left: averageTenImage.right
                    source: saftyAlert.oneAverageSpeedPath
                }
            }
        }
    }

    Image{
        id : mainSymbolImage
        width: 116
        height: 116
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: 5
        source: symbolImage

        Image{
            id : referenceArea
            width: 90
            height: 90
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            source : saftyAlert.referenceImage
        }
    }

    Image{
        id : distanceBgImage
        width: 116
        height: 89
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 54
        source: ""// "Image/SaftyAlert/icon_speedlimit_bottom.png"

        /*
                제한 속도 배경 이미지
                사용자께서 프로젝트에 맞게 제한속도 배경이미지를 넣어주시면 됩니다.
          */

        Item{
            id : distanceArea
            width: 116
            height: 40
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5

            Item{
                id : distanceValueArea
                width: 66
                height: 32
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                Image{
                    id : distanceHundredImage
                    width: 22
                    height: 32
                    anchors.left: parent.left
                    source: saftyAlert.hundredDistancePath
                }
                Image{
                    id : distanceTenImage
                    width: 22
                    height: 32
                    anchors.left: distanceHundredImage.right
                    source: saftyAlert.tenDistancePath
                }
                Image{
                    id : distanceOneImage
                    width: 22
                    height: 32
                    anchors.left: distanceTenImage.right
                    source: saftyAlert.oneDistancePath
                }
            }

        }
    }

    Image{
        id : subSymbolImageArea
        width: 74
        height: 36
        anchors.left: parent.left
        anchors.leftMargin: 20
        source: subSymbolImage
        visible: subImage_OnOff ? true : false
    }

    Item{
        id : currentSpeedArea
        width: 116
        height: 58
        anchors.left: parent.left
        anchors.bottom: parent.bottom

        Item{
            id : currentSpeedValueArea
            width: 116
            height: 50
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter

            Image{
                id : hundredImage
                width: 37
                height: 50
                anchors.left: parent.left
                source: saftyAlert.hundredCurrentSpeedPath
            }
            Image{
                id : tenImage
                width: 37
                height: 50
                anchors.left: parent.left
                anchors.leftMargin: {
                    if ( currentSpeed < 100)
                        19
                    else
                        37
                }

                source: saftyAlert.tenCurrentSpeedPath
            }
            Image{
                id : oneImage
                width: 37
                height: 50
                anchors.left: tenImage.right
                source: saftyAlert.oneCurrentSpeedPath
            }
        }
    }


}

import QtQuick 2.0
import IVIS.Component 1.0


/* ========================== BAIDU HMI TURNBYTURN ==========================

  턴 정보를 받아서 출력하는 NaviFlyer.
  TTurnByTurn 을 상속 받아 만든 Component

  ( Template ) 에서 제공하는 property ***************************************************************
  ========= Data 를 받는 property =============
  1. distanceValue           :  첫번째 턴방향까지 남은 거리를 받아서 출력하는 property
  2. secondDistanceValue     :  두번째 턴방향까지 남은 거리를 받아서 출력하는 property

  ========= Data 값에 매칭되는 이미지를 담아서 Skin 으로 전달하는 property ============
  3. image_Hundred_FirstDistance        : 첫번째 남은거리의 100의 자릿수 이미지 파일을 담는 property
  4. image_Ten_FirstDistance            : 첫번째 남은거리의  10의 자릿수 이미지 파일을 담는 property
  5. image_One_FirstDistance            : 첫번째 남은거리의   1의 자릿수 이미지 파일을 담는 property
  6. image_Hundred_SecondDistance       : 두번째 남은거리의 100의 자릿수 이미지 파일을 담는 property
  7. image_Ten_SecondDistance           : 두번째 남은거리의  10의 자릿수 이미지 파일을 담는 property
  8. image_One_SecondDistance           : 두번째 남은거리의   1의 자릿수 이미지 파일을 담는 property


  ================= 숫자 imagePath property =========================
  9.  firstImagePath         :  첫번째 턴방향의 이미지를 출력하기 위해 참조하는 이미지 경로 property
  10. secondImagePath        :  두번째 턴방향의 이미지를 출력하기 위해 참조하는 이미지 경로 property

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

  ************************************************************************************************





  Skin proeprty ( 사용자가 구현하기 나름 , BAIDU 의 경우 이미지 사용이 많아서 아래와 같은 property 가 필요 ) ******

  1. firstAreaImage         :  첫번째 턴방향 영역에 출력되어야 할 방향 이미지를 출력하는 property
  2. secondAreaImage        :  두번째 턴방향 영역에 출력되어야 할 방향 이미지를 출력하는 property
  3. roadInfoText           :  현재 도로정보를 받아서 출력하는 property
  4. icon_Dot               :  첫번째 턴방향까지 남은거리가 1.0 km 이상일 경우 . 이미지를 출력하는 property
  5. icon_SecondDot         :  두번째 턴방향까지 남은거리가 1.0 km 이상일 경우 . 이미지를 출력하는 property
  6. icon_Unit              :  첫번째 턴방향까지 남은거리에 대한 거리 단위 이미지를 출력하는 property
  7. icon_SecondUnit        :  두번째 턴방향까지 남은거리에 대한 거리 단위 이미지를 출력하는 property


  ========================================================================== */


TTurnByTurn {
    id : turnByTurn
    objectName: "turnByTurn"
    width: 584
    height: 150

    property url firstAreaImage : ""
    property url secondAreaImage : ""
    property string roadInfoText : ""

    property url icon_Dot : ""        //첫번째 거리 . 이미지 ( ex : 1.5 km 일때 가운데 . ) property
    property url icon_SecondDot : ""  //두번째 거리 . 이미지 ( ex : 2.5 km 일때 가운데 . ) property
    property int icon_Unit //: ""       //첫번째 거리단위 이미지 property
    property url icon_SecondUnit : "" //두번째 거리단위 이미지 property

    onDistanceValueChanged: {
        if ( distanceValue > 999 )
        {
            hundredImage.visible = false
            dotImage.visible = true
        }
    }

    onSecondDistanceValueChanged: {
        if ( secondDistanceValue > 999 )
        {
            second_HundredImage.visible = false
            second_DotImage.visible = true
        }
    }

    // 단위에 대한 이미지 경로를 넣은 부분. 현재는 단위에 대한 이미지가 없음. 단위에 대한 이미지가 생겨서 경로 설정을 해야 할 경우 사용자께서 경로 설정을 넣어주시면 됩니다.
    onIcon_UnitChanged: {
        if ( icon_Unit ===  0 )
            unitImage.source = "../../../Component/IVIS-A/Navigation/Image/SpeedNumber/normalSpeed/id_under_0.png"
        else if ( icon_Unit === 1)
            unitImage.source ="ex)...km.png"
        else if ( icon_Unit === 2)
            unitImage.source ="ex)...mi.png"
        else if ( icon_Unit === 3)
            unitImage.source ="ex)...yd.png"
        else if ( icon_Unit === 4)
            unitImage.source ="ex)...ft.png"
        else
            unitImage.source ="ex)...m.png"
    }

    Image{
        id : bgImage
        anchors.fill: parent
        source: ""//"Image/TurnByTurn/bg_rg.png" // turnByturn  배경 이미지
    }

    Item{
        id : firstDirectionArea
        width: 124
        height: 124
        anchors.left: parent.left
        anchors.leftMargin: 13
        anchors.top: parent.top
        anchors.topMargin: 13

        Image{
            id : firstDirectionImage
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            source: firstAreaImage
        }
    }

    Item{
        id : secondDirectionArea
        width: 74
        height: 74
        anchors.right: parent.right
        anchors.rightMargin: 140
        anchors.top: parent.top
        anchors.topMargin: 24

        Image{
            id : secondDirectionImage
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            source : secondAreaImage
        }
    }

    Item{
        id : firstDistanceArea
        width: 156
        height: 64
        anchors.left: firstDirectionArea.right
        anchors.leftMargin: 20
        anchors.top: parent.top
        anchors.topMargin: 20

        Image{
            id : hundredImage
            width: 38
            height: 64
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            source: turnByTurn.image_Hundred_FirstDistance
        }
        Image{
            id : tenImage
            width: 38
            height: 64
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: {
                if  ( distanceValue > 999 )
                    0
                else if ( distanceValue < 100 )
                    19
                else if ( distanceValue < 1000 && distanceValue > 99)
                    38
            }

            source:turnByTurn.image_Ten_FirstDistance
        }
        Image{
            id : oneImage
            width: 38
            height: 64
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: tenImage.right
            anchors.leftMargin: {
                if ( distanceValue > 999 )
                    16
                else
                    0
            }
            source:turnByTurn.image_One_FirstDistance
        }
        Image{
            id : dotImage
            width: 16
            height: 16
            anchors.bottom: parent.bottom
            anchors.left: tenImage.right
            source: icon_Dot
            visible: false
        }
        Image{
            id : unitImage
            width: 42
            height: 64
            anchors.left: oneImage.right
            anchors.bottom: parent.bottom
//            source : icon_Unit
            source : {
                if ( distanceValue < 1000 )
                    ""         // m 이미지 파일
                else if ( distanceValue > 999 )
                    ""        // km 이미지 파일
            }
        }
    }

    Item{
        id : secondDistanceArea
        width: 116
        height: 45
        anchors.right: parent.right
        anchors.rightMargin: 30
        anchors.top: parent.top
        anchors.topMargin: 40

        Image{
            id : second_HundredImage
            width: 27
            height: 45
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            source : turnByTurn.image_Hundred_SecondDistance
        }
        Image{
            id : second_TenImage
            width: 27
            height: 45
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: {
                if ( secondDistanceValue > 999 )
                    13
                else
                    27
            }
            source : turnByTurn.image_Ten_SecondDistance
        }
        Image{
            id : second_OneImage
            width: 27
            height: 45
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: second_TenImage.right
            anchors.leftMargin: {
                if ( secondDistanceValue > 999 )
                    10
                else
                    0
            }
            source : turnByTurn.image_One_SecondDistance
        }
        Image{
            id : second_DotImage
            width: 10
            height: 10
            anchors.bottom: parent.bottom
            anchors.left: second_TenImage.right
            source: second_DotImage
            visible: false
        }
        Image{
            id : second_UnitImage
            width: 31
            height: 45
            anchors.left: second_OneImage.right
            anchors.bottom: parent.bottom
            source : icon_SecondUnit
        }

    }

    Item {
        id: roadInfoTextArea
        width: 412
        height: 36
        anchors.left: parent.left
        anchors.leftMargin: 160
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10

        Text{
            id : infoText
            font.pixelSize: 30
            color : "#eaeaea"
            text : roadInfoText

        }
    }
}

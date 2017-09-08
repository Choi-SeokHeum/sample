import QtQuick 2.0
import IVIS.Component 1.0


/* ==================== BAIDU NAVI HMI SLIDER DESCRIPTION  ========================

  **** TRTSlider 와 TSlider 는 다른 Logic 을 사용하기때문에 같은 Template 를 가질 수 없다.  ****
  TSlider (Template)는 Release 때, valueChanged 된다.
  TRTSlider(Template)는 Release 이벤트 때가 아닌, onClick , onPressed 일때 valueChanged 이벤트가 발생.

  사용자는 필요한 기능에 맞는 Template 를 상속받아서 성격에 맞는 slider 를 구현 할 수 있다.
  TRTSlider 라는 Template 이 존재하며, TRTSlider 는 RealTimeSlider 가 가져야 할 기본적인 기능을 가진 Template.

  TRealTimeSlider : 기본적인 직선의 Slider 이며, default value 가 0 으로 시작점이 좌측으로 치우친 slider.
  실시간으로 값이 변경되어야 하는 곳에 사용 가능( volume 조절 ) , 음양의 값을 제어하기보단, 0~최대 까지 표현할때 유용함.

  Navigation 에서는 NaviVolume 을 제어할 때 사용하는 것이 효과적.


==================================================================================*/



Item {
    id : testSliderScreen
    objectName: "testSliderScreen"
    width: 300
    height: 100

    RealTimeSlider{
        id : realTimeSlider
        width: 150
        height: 30
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

        from : 0                // slider 의 min 값을 설정하는 property
        to : 45                // slider 의 max 값을 설정하는 property
        value : 0              // slider 의 현재 값을 설정하는 property
        stepSize: 1            // slider value 증감 크기를 설정하는 propert

        icon_BackGroundPressed  : ""
        icon_BackGroundNormal   : ""
        icon_HandlePressed      : ""
        icon_HandleNormal       : ""
        icon_TrackPressed       : ""
        icon_TrackNormal        : ""


    }

    Button_1Image_Type{
        id : minusButton
        width: 50
        height: 40
        anchors.verticalCenter: parent.verticalCenter

        icon_SkinPressed    : ""
        icon_SkinNormal     : ""
        icon_SkinFocus      : ""

        onClicked: {
            realTimeSlider.decrease()           // realTimeSlider 에서 제공하는 감소 함수를 사용하는 코드
        }

    }

    Button_1Image_Type{
        id : plusButton
        width: 50
        height: 40
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right

        icon_SkinPressed    : ""
        icon_SkinNormal     : ""
        icon_SkinFocus      : ""

        onClicked: {
            realTimeSlider.increase()       // realTimeSlider 에서 제공하는 증가 함수를 사용하는 코드
        }

    }


}

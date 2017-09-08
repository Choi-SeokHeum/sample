import QtQuick 2.0

/* ==================== BAIDU NAVI HMI DIGITALCLOCK DESCRIPTION  ========================

  *****  DigitalClock 과 AnalogClock 은 엄연히 다른 component 이다.  ******

  TDigitalClock ( Template ) 에는 GMT 시간을 연산하는 logic 은 없다.
  TDigitalClock 은 Engine 및 ControlLogic ( cpp class ) 에서 오는 시간 값을 시간제에 맞게 출력만 하는 형태.
  시간 Data 와 매칭되는 이미지를 연결하며, AnalogClock 과 달리 12시간 혹은 24시간 제를 표현 할 수 있다.

  TDigitalClock 을 상속 받아 만든 DigitalClock
  DigitalClock  :  12 시간 혹은 24 시간제에 따라 다르게 표출되는 Skin 을 구성하는 Component.
  GMT 시간을 받아 연산하는 형태가 아니기 때문에, 반드시 24시간제 여부를 확인해야 한다.

  사용하려는 이미지경로는 Component 를 제공 받았을때 설정 된 경로와 분명 달라진다.
  imagePath property 에는 사용자가 원하는 이미지 경로를 String 형태로 삽입하면 된다.



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


DigitalClock {
    id : testDigitalClock
    objectName: "testDigitalClock"
    hour: 23                       // 시간을 받는 property
    min: 52                        // 분 을 받는 property
    time24: true                  // 24 시간제 여부를 받는 property
    imagePath: ""//../../../Component/IVIS-A/Navigation/Image/SpeedNumber/overSpeed/id_over_" // 출력될 이미지소스의 경로를 담는 property
}

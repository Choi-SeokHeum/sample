import QtQuick 2.0
import IVIS.Component 1.0

/* ==================== BAIDU NAVI HMI BUTTON DESCRIPTION  ========================


사용자가 필요한 기능에 맞는 Template 를 상속받는다.
TButton 이라는 Template 가 존재하며 TButton 은 Button 의 기본기능을 가진 Template 이다.
TButton 을 상속받아 각각의 기능을 가진 Template 의 종류는 아래와 같다.

TPushButton   :  기본적인 Butto 의 기능을 가진 Component.                    ex : button
TCheckButton  :  Toggle 기능을 가진 check 상태를 제어할 수 있는 Component.     ex : checkbutton
TRadioButton  :  true/false 로 값의 상태를 제어할 수 있는 Component.          ex : radiobutton
TTabButton    :  TRadioButton 과 동일한 기능을 가지지만, TabBar 에서 사용시 가독성을 증대하기 위해 만든 Component.
TStateButton  :  다양한 State 를 제어하고 signal 을 발생 시킬 수 있는 Component.  ex : 한곡재생/전체재생/랜덤재생


==================================================================================*/



// 사용자는 Button 을 사용하기전에 필요한 기능을 먼저 파악 후 , 그에 적절한 Template 를 상속받아 Button 의 Skin 을 붙인다.

TPushButton {    // ex : 기본적인 기능을 하는 PushButton 을 상속
    id : test    // id : id 는 필수로 기입. id 를 통해 Template 에서 제공하는 property 혹은 function, signal 을 손쉽게 불러올 수 있다.
    objectName: "test" // id 와 동일한 형태로 하는 것이 가독성을 위해 좋다. 되도록이면 다른 객체 이름과 겹치지 않는 고유한 명칭을 만든다.
    width: 111
    height: 88


    // ---------------- FocusManager 를 통해 Focus 상태를 확인 후 자신( 해당 Component ) 의 상태를 알아야 한다.

    property url icon_BgPressed  : "./Image/btn_home_p.png"//"../Flyer/Image/Compass/btn_home_p.png"
    property url icon_BgNormal   : "./Image/btn_home_n.png"//"../Flyer/Image/Compass/btn_home_n.png"
    property url icon_BgDisabled : "./Image/btn_home_d.png"//"../Flyer/Image/Compass/btn_home_d.png"
    property url icon_BgFocus    : "./Image/btn_home_f.png"//"../Flyer/Image/Compass/btn_home_f.png"

    Image{
        id : bgImage
        width: parent.width
        height: parent.height
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        source : {
            switch (test.state)                                          // Template 의 state 라는 property 를 사용하기 위해 test( id 이며, Button_Add_Example 의 객체 ) 를 명시하고 state 를 선언함으로써 Template 의 state 라는 property 를 사용할 수 있다.
            {
            case "NORMAL"       : return icon_BgNormal;                  // Component 의 Focus 상태가 NORMAL 일 경우 icon_BgNormal 을 출력.
            case "DISABLED"     : return icon_BgDisabled;                // Component 의 Focus 상태가 DISABLED 일 경우 icon_BgDisabled 을 출력.
            case "PRESSED"      : return icon_BgPressed;                 // Component 의 Focus 상태가 PRESSED 일 경우 icon_BgPressed 을 출력.
            case "FOCUSED"      : return icon_BgFocus;                   // Component 의 Focus 상태가 FOCUSED 일 경우 icon_BgFocus 을 출력.
            default: break;
            }
        }
    }

    // Template 를 상속받아서 기본적인 BackGround 이미지를 삽입하는 모습을 보여주는 코드 이다. 이 후 사용자가 원하는 Skin ( BackGround 및 다양한 Image, text , etc...) 을 코드로 채워 넣으면 된다.







   // BackGround 이 후 Skin Image 를 적용한 모습 ====================================================================================

    property url icon_SkinPressed   : "./Image/icon_home_p_fp_f.png"// "../Flyer/Image/icon_home_p_fp_f.png"
    property url icon_SkinNormal    : "./Image/icon_home_n.png"// "../Flyer/Image/icon_home_n.png"
    property url icon_SkinDisabled  : "./Image/icon_home_d.png"// "../Flyer/Image/icon_home_d.png"
    property url icon_SkinFocus     : "./Image/icon_home_p_fp_f.png"// "../Flyer/Image/icon_home_p_fp_f.png"

    Image{
        id : skinImage
        width: 66
        height: 66
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

        source: {
            switch (test.state)
            {
            case "NORMAL"       : return icon_SkinNormal;
            case "DISABLED"     : return icon_SkinDisabled;
            case "PRESSED"      : return icon_SkinPressed;
            case "FOCUSED"      : return icon_SkinFocus;
            default: break;
            }
        }
    }
    //  Skin 을 적용 할 때는 항상 focus 상태를 생각하고 이미지 source 를 매칭 시켜야 한다.

}

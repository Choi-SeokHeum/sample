import QtQuick 2.0
import IVIS.Component 1.0

TPushButton {
    id : button_1image_Type
    objectName: "button_1image_Type"
    width: 111
    height: 88



    property url icon_SkinPressed : "./Image/icon_home_p_fp_f.png"//"../Flyer/Image/icon_home_p_fp_f.png"
    property url icon_SkinNormal  : "./Image/icon_home_n.png"//"../Flyer/Image/icon_home_n.png"
    property url icon_SkinFocus   : "./Image/icon_home_p_fp_f.png"//"../Flyer/Image/icon_home_p_fp_f.png"
    property url icon_SkinDisabled: "./Image/icon_home_d.png"//"../Flyer/Image/icon_home_d.png"

    property url icon_BgPressed   : "./Image/btn_home_p.png"//"../Flyer/Image/Compass/btn_home_p.png"
    property url icon_BgNormal    : "./Image/btn_home_n.png"//"../Flyer/Image/Compass/btn_home_n.png"
    property url icon_BgFocus     : "./Image/btn_home_f.png"//"../Flyer/Image/Compass/btn_home_f.png"
    property url icon_BgDisabled  : "./Image/btn_home_d.png"//"../Flyer/Image/Compass/btn_home_d.png"

    /*
      icon_ 에 관한 상단의 property 들은 button 의 배경, skin 에 대한 property 입니다.
      button 의 상태 ( pressed, focus, etc...) 에 따라 출력되어야 하는 이미지가 달라야 합니다.

      사용자께서는 프로젝트에 맞게 설정하셔서 사용하시기 바랍니다.

      */

    Image{
        id : bgImage
        width: parent.width
        height: parent.height
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        source : {
            switch (button_1image_Type.state)
            {
            case "NORMAL"       : return icon_BgNormal;
            case "DISABLED"     : return icon_BgDisabled;
            case "PRESSED"      : return icon_BgPressed;
            case "FOCUSED"      : return icon_BgFocus;
            default: break;
            }
        }
    }

    Image{
        id : skinImage
        width: 66
        height: 66
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

        source: {
            switch (button_1image_Type.state)
            {
            case "NORMAL"       : return icon_SkinNormal;
            case "DISABLED"     : return icon_SkinDisabled;
            case "PRESSED"      : return icon_SkinPressed;
            case "FOCUSED"      : return icon_SkinFocus;
            default: break;
            }
        }
    }


}

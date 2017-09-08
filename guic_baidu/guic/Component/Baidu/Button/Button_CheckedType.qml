import QtQuick 2.0
import IVIS.Component 1.0

TCheckButton {
    id : button_CheckedType
    objectName: "button_CheckedType"
    width: 111
    height: 88
    checked: false

    property url icon_BgPressed         :"./Image/btn_home_p.png"// "../Flyer/Image/Compass/btn_home_p.png"
    property url icon_BgNormal          :"./Image/btn_home_n.png"// "../Flyer/Image/Compass/btn_home_n.png"
    property url icon_BgFocus           :"./Image/btn_home_f.png"// "../Flyer/Image/Compass/btn_home_f.png"
    property url icon_BgDisabled        :"./Image/btn_home_d.png"//"../Flyer/Image/Compass/btn_home_d.png"

    property url icon_SkinTrue_Normal   :"./Image/icon_t_volume.png"// "../Flyer/Image/icon_t_volume.png"
    property url icon_SkinTrue_Disabled :"./Image/icon_t_volume_d.png"// "../Flyer/Image/icon_t_volume_d.png"
    property url icon_SkinTrue_Focus    :"./Image/icon_t_volume_p.png"// "../Flyer/Image/icon_t_volume_p.png"
    property url icon_SkinTrue_Pressed  :"./Image/icon_t_volume_p.png"// "../Flyer/Image/icon_t_volume_p.png"

    property url icon_SkinFalse_Normal  :"./Image/icon_t_mute.png"// "../Flyer/Image/icon_t_mute.png"
    property url icon_SkinFalse_Disabled:"./Image/icon_t_mute_d.png"// "../Flyer/Image/icon_t_mute_d.png"
    property url icon_SkinFalse_Focus   :"./Image/icon_t_mute_p.png"// "../Flyer/Image/icon_t_mute_p.png"
    property url icon_SkinFalse_Pressed :"./Image/icon_t_mute_p.png"// "../Flyer/Image/icon_t_mute_p.png"

    Image{
        id : bgImage
        width: parent.width
        height: parent.height
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        source : {
            switch (button_CheckedType.state)
            {
            case "NORMAL"       : return icon_BgNormal;
            case "DISABLED"     : return icon_BgDisabled;
            case "PRESSED"      : return icon_BgPressed;
            case "FOCUSED"      : return icon_BgFocus;
            default: break;
            }
        }
    }

    Image {
        id: skinImage
        width: 89
        height: 72
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        source :{
            if ( button_CheckedType.checked )
            {
                switch (button_CheckedType.state)
                {
                case "NORMAL"       : return icon_SkinTrue_Normal;
                case "DISABLED"     : return icon_SkinTrue_Disabled;
                case "PRESSED"      : return icon_SkinTrue_Pressed;
                case "FOCUSED"      : return icon_SkinTrue_Focus;
                default: break;
                }
            }
            else
            {
                switch (button_CheckedType.state)
                {
                case "NORMAL"       : return icon_SkinFalse_Normal;
                case "DISABLED"     : return icon_SkinFalse_Disabled;
                case "PRESSED"      : return icon_SkinFalse_Pressed;
                case "FOCUSED"      : return icon_SkinFalse_Focus;
                default: break;
                }
            }

        }
    }

}

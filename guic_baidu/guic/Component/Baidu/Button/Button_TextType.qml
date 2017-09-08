import QtQuick 2.0
import IVIS.Component 1.0

TPushButton {
    id : button_TextType
    objectName: "button_TextType"
    width: 111
    height: 88

    property string textString : "Back"
    property int textSize : 20
    property string textFont : "Source Sans Pro"

    property url icon_BgPressed   :"./Image/btn_home_p.png"// "../Flyer/Image/Compass/btn_home_p.png"
    property url icon_BgNormal    :"./Image/btn_home_n.png"// "../Flyer/Image/Compass/btn_home_n.png"
    property url icon_BgFocus     :"./Image/btn_home_f.png"// "../Flyer/Image/Compass/btn_home_f.png"
    property url icon_BgDisabled  :"./Image/btn_home_d.png"//"../Flyer/Image/Compass/btn_home_d.png"

    Image{
        id : bgImage
        width: parent.width
        height: parent.height
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        source : {
            switch (button_TextType.state)
            {
            case "NORMAL"       : return icon_BgNormal;
            case "DISABLED"     : return icon_BgDisabled;
            case "PRESSED"      : return icon_BgPressed;
            case "FOCUSED"      : return icon_BgFocus;
            default: break;
            }
        }
    }


    Text{
        id : btn_Txt
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: textSize
        font.family: textFont
        text : textString
        color:"#ebebeb"
    }


}

import QtQuick 2.0
import IVIS.Component 1.0

TStateButton {
    id : button_CompassType
    objectName: " button_CompassType"
    width: 111
    height: 88

    currentState: 0

    onCurrentStateChanged: {
        if ( currentState === 0 )
        {
            subImage.visible = false
            threeD_Image.visible = false
        }
        else if ( currentState === 1 )
        {
            subImage.visible = true
            threeD_Image.visible = true
        }
        else
        {
            subImage.visible = true
            threeD_Image.visible = false
        }
    }

    Image{
        id : image
        width: source.width
        height: source.height
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        source: iconPath
    }

    buttonStateArr: [
        northImage, //"../../Component/IVIS-A/Navigation/Image/Compass/icon_compass_north_d.png", // North fixed
        "", // 3D View 3DView 는 이미지가 필요하지 않고, 상태는 나타내야하므로 빈 string 을 넣어줍니다.
        "", // RotationView RotationView 는 이미지가 필요하지 않고, 상태는 나타내야하므로 빈 string 을 넣어줍니다.
    ]


    /*
      buttonStateArr 에 관한 설명 .
       이미지는 없지만, 상태를 나타내야 하는 경우 빈 string 을 삽입합니다.
       그 이외에 필요한 이미지는 사용자께서 프로젝트에 맞는 경로를 설정하시기 바랍니다.

      */


    property url focusCompassImage   : "./Image/compass_00_n.png"//"../Flyer/Image/Compass/compass_00_n.png"
    property url normalCompassImage  : "./Image/compass_00_n.png"//"../Flyer/Image/Compass/compass_00_d.png"
    property url disabledCompassImage  : "./Image/compass_00_d.png"//"../Flyer/Image/Compass/compass_00_d.png"
    property url pressedCompassImage  : "./Image/compass_00_n.png"//"../Flyer/Image/Compass/compass_00_d.png"


    property url normal_focus_pressed_NorthImage     : "./Image/icon_compass_north_n.png"
    property url disabledNorthImage  : "./Image/icon_compass_north_d.png"
    property url normalSubImage      : ""//""
    property url threeDImage         : "./Image/symbol_compass_3d.png"//"../Flyer/Image/Compass/symbol_compass_3d.png"

    property url northImage          : {
        if(button_CompassType.state === "DISABLED")
            disabledNorthImage
        else
            normal_focus_pressed_NorthImage
    }




    property url icon_BG_Normal      : "./Image/btn_home_n.png"//"../Flyer/Image/Compass/btn_home_n.png"
    property url icon_BG_Pressed     : "./Image/btn_home_p.png"//"../Flyer/Image/Compass/btn_home_p.png"
    property url icon_BG_Focus       : "./Image/btn_home_f.png"//"../Flyer/Image/Compass/btn_home_f.png"
    property url icon_BG_Disabled    : "./Image/btn_home_d.png"//"../Flyer/Image/Compass/btn_home_d.png"


    property int rotationValue : -1

    onRotationValueChanged: {
        compassImage.rotation = rotationValue
        rotationImageChanged(rotationValue)
    }

    //    Component.onCompleted: rotationValue = 20

    Image{
        id : bgImage
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        z: -2
        source: {
            switch (button_CompassType.state)
            {
            case "NORMAL"       : return icon_BG_Normal;
            case "DISABLED"     : return icon_BG_Disabled;
            case "PRESSED"      : return icon_BG_Pressed;
            case "FOCUSED"      : return icon_BG_Focus;
            default: break;
            }
        }
    }

    Image{
        id : compassImage
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        rotation: 0
        z: -1
        source :{
            switch (button_CompassType.state)
            {
            case "NORMAL"       : return normalCompassImage;
            case "DISABLED"     : return disabledCompassImage;
            case "PRESSED"      : return pressedCompassImage;
            case "FOCUSED"      : return focusCompassImage;
            default: break;
            }
        }
    }

    Image{
        id : subImage
        width: 48
        height: 30
        visible: false

        source :normalSubImage
    }

    Image{
        id : threeD_Image
        width: 42
        height: 24
        anchors.bottom: button_CompassType.bottom
        anchors.right: button_CompassType.right
        source: threeDImage
        visible: false
    }

    function rotationImageChanged(rotation_Value)
    {
        var imagePath = "./Image/symbol_compass_"//"../Flyer/Image/Compass/symbol_compass_"
        /*
          imagePath 지역변수에 대한 설명.
          imagePath 는 나침반 이미지가 저장된 경로를 가진 property 입니다.
          사용자께서 프로젝트에 맞게 나침반 이미지가 저장된 경로로 설정하여 사용하시기 바랍니다.
          */

        if (  rotation_Value <= 23 &&  rotation_Value > 348 && rotation_Value === 0)
        {
            normalSubImage = imagePath+"n.png" // N
        }
        else if ( rotation_Value > 23 && rotation_Value <= 68)
        {
            normalSubImage = imagePath+"ne.png"// NE
        }
        else if ( rotation_Value > 68 && rotation_Value <= 113)
        {
            normalSubImage = imagePath+"e.png"// E
        }
        else if ( rotation_Value > 113 && rotation_Value <= 158)
        {
            normalSubImage = imagePath+"se.png"// SE
        }
        else if ( rotation_Value > 158 && rotation_Value <= 203)
        {
            normalSubImage = imagePath+"s.png"// S
        }
        else if ( rotation_Value > 203 && rotation_Value <= 248)
        {
            normalSubImage = imagePath+"sw.png"// SW
        }
        else if ( rotation_Value > 248 && rotation_Value <= 293)
        {
            normalSubImage = imagePath+"w.png"// W
        }
        else if ( rotation_Value > 293 && rotation_Value <= 348)
        {
            normalSubImage = imagePath+"nw.png"// NW
        }
        else
        {
            normalSubImage = imagePath+"n.png"// N
        }

    }
}



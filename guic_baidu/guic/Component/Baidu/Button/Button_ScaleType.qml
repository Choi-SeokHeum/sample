import QtQuick 2.0
import IVIS.Component 1.0

TCheckButton {
    id : button_ScaleType
    objectName: "button_ScaleType"
    width: 111
    height: 88

    property url icon_BgPressed     :"./Image/btn_home_p.png"// "../Flyer/Image/Compass/btn_home_p.png"
    property url icon_BgNormal      :"./Image/btn_home_n.png"// "../Flyer/Image/Compass/btn_home_n.png"
    property url icon_BgFocus       :"./Image/btn_home_f.png"// "../Flyer/Image/Compass/btn_home_f.png"
    property url icon_BgDisabled    :"./Image/btn_home_d.png"//"../Flyer/Image/Compass/btn_home_d.png"

    property int zoomValue : -1
    property url zoomPath

    onZoomValueChanged: {
        private_class.setZoomImage(zoomValue)
    }

//    Component.onCompleted: zoomValue = 2275

    Image{
        id : bgImage
        width: parent.width
        height: parent.height
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        source : {
            switch (button_ScaleType.state)
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
        id : scaleImage
        anchors.top: parent.top
        anchors.topMargin: 5
        anchors.horizontalCenter: parent.horizontalCenter
        source : "./Image/icon_scale.png"//"../Flyer/Image/Zoom/icon_scale.png"
        /*
            scale 이미지를 프로젝트에 맞는 경로로 설정하여 사용하시기 바랍니다.
          */
    }

    Image{
        id : zoomValueImage
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        source: zoomPath

    }

    Image{
        id : autoImage
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 5
        anchors.horizontalCenter: parent.horizontalCenter
        source: button_ScaleType.checked ? "./Image/img_auto_on.png" : "./Image/img_auto_off.png"
        //../Flyer/Image/Zoom/img_auto_on.png" : "../Flyer/Image/Zoom/img_auto_off.png"

        /*
          button 이 checked 되었을때, check on/off 를 출력할 이미지를
          사용자께서 프로젝트에 맞게 설정하여 사용하시기 바랍니다.
          */
    }

    QtObject{
        id : private_class
        function setZoomImage(value)
        {
            var inputValue
            var pathImage = "./Image/scale_k_"//"../Flyer/Image/Zoom/scale_k_"

            /*
              scale 에 관한 image 를 프로젝트에 맞게 사용자께서 설정하여 경로를 넣어주시면 됩니다.
                 단, 경로에 대한 내용이 같은 부분까지만 넣어주시고, 나머지 거리에 따라 달라지는 명칭은 아래에 inputValue 에 넣어주시기 바랍니다.
              */

            if ( value >= 0 && value < 50 )
            {
                inputValue = "25m.png"
            }
            else if ( value >= 50 && value < 100 )
            {
                inputValue = "50m.png"
            }
            else if ( value >= 100 && value < 200 )
            {
                inputValue = "100m.png"
            }
            else if ( value >= 200 && value < 400 )
            {
                inputValue = "200m.png"
            }
            else if ( value >= 400 && value < 800 )
            {
                inputValue = "400m.png"
            }
            else if ( value >= 800 && value < 1600 )
            {
                inputValue = "800m.png"
            }
            else if ( value >= 1600 && value < 3200 )
            {
                inputValue = "1.6km.png"
            }
            else if ( value >= 3200 && value < 6400 )
            {
                inputValue = "3.2km.png"
            }
            else if ( value >= 6400 && value < 12800 )
            {
                inputValue = "6.4km.png"
            }
            else if ( value >= 12800 && value < 25000 )
            {
                inputValue = "12.8km.png"
            }
            else if ( value >= 25000 && value < 50000 )
            {
                inputValue = "25km.png"
            }
            else if ( value >= 50000 && value < 100000 )
            {
                inputValue = "50km.png"
            }
            else //if ( value >= 100000 )
            {
                inputValue = "100km.png"
            }
            zoomPath = pathImage+inputValue
            return zoomPath
        }
    }



}

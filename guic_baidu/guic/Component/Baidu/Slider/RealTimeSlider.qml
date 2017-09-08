import QtQuick 2.0
import IVIS.Component 1.0

TRealTimeSlider {
    id : realTimeSlider
    objectName: "realTimeSlider"
    width: 200
    height: 50

    track: track_RT
    handle: handle

    from : 0
    to : 150
    value : from
    stepSize: 10
    snapMode: true
    animationEnabled: false

    property url icon_BackGroundPressed  :""// "../../../Demo/image/sliderImage/Slider_normal_bg.png"
    property url icon_BackGroundNormal   :""// "../../../Demo/image/sliderImage/Slider_Activated_bg.png"
    property url icon_HandlePressed      :""// "../../../Demo/image/sliderImage/Slider_Activated.png"
    property url icon_HandleNormal       :""// "../../../Demo/image/sliderImage/Slider_normal.png"
    property url icon_TrackPressed       :""// "../../../Demo/image/sliderImage/Slider_Activated_1px.png"
    property url icon_TrackNormal        :""// "../../../Demo/image/sliderImage/Slider_normal_1px.png"


    Image{
        id : backGround
        width: realTimeSlider.width
        height: 3
        anchors.verticalCenter: realTimeSlider.verticalCenter
        source: realTimeSlider.pressed ? icon_BackGroundPressed : icon_BackGroundNormal
    }

    Image{
        id : track_RT
        width: realTimeSlider.position * realTimeSlider.width
        height: 3
        anchors.verticalCenter: realTimeSlider.verticalCenter
        source: realTimeSlider.pressed ? icon_TrackPressed : icon_TrackNormal

        Behavior on width{
            enabled: realTimeSlider.animationEnabled
            NumberAnimation{ duration : 80 }
        }
        onWidthChanged: {
            if ( realTimeSlider.pressed )
            {
                realTimeSlider.sliderMoving(position * to)
            }
        }
    }

    Image{
        id : handle
        anchors.verticalCenter: realTimeSlider.verticalCenter
        anchors.horizontalCenter: track_RT.right
        source : realTimeSlider.pressed ? icon_HandlePressed : icon_HandleNormal


        Text{
            width: parent.width
            height: parent.height
            color : "blue"
            text : value
        }

    }
}

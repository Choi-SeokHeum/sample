import QtQuick 2.0

TRTSlider{
    id : tRealTimeSlider
    objectName: "tRealTimeSlider"
    width: 200
    height: 50

    track : tRealTimeSlider.isOverHalf ? track_RT : track_RT
    handle: handle


    from: -10
    to: 10
    value: to/2
    stepSize: 1
    snapMode: true
    animationEnabled: false

    readonly property bool isOverHalf: tRealTimeSlider.position > 0.5

    signal sliderPressed
    signal sliderClicked
    signal sliderMoving(int val)

    onPressedChanged:
    {
        if(tRealTimeSlider.pressed)
            tRealTimeSlider.sliderPressed()
        else
            tRealTimeSlider.sliderClicked()
    }
}

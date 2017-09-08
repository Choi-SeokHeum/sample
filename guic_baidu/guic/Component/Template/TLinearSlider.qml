import QtQuick 2.0

TSlider {
    id: tLinearSlider
    objectName: "tLinearSlider"
    width: 200
    height: 50

    track: tLinearSlider.isOverHalf ? trackPlus : trackMinus
    handle: handle

    from: -10
    to: 10
    value: to/2
    stepSize: 1
    snapMode: true
    animationEnabled: false

    readonly property bool isOverHalf: tLinearSlider.position > 0.5

    signal sliderPressed
    signal sliderClicked
    signal sliderMoving(int val)

    onPressedChanged:
    {
        if(tLinearSlider.pressed)
            tLinearSlider.sliderPressed()
        else
            tLinearSlider.sliderClicked()
    }
}

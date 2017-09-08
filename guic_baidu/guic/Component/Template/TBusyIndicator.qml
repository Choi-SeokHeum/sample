import QtQuick 2.0

TIndicator {
    id : tBusyIndicator
    objectName: "tBusyIndicator"

    width : 300
    height: 60

    running: true

    property var icon: []
    property int animationInterval : 300
    property int currentIndex:0

    Timer{
        id : animationTimer
        repeat : true
        running: tBusyIndicator.running
        interval: tBusyIndicator.animationInterval
        onTriggered: {
            if ( currentIndex < icon.length -1 )
                currentIndex++
            else
                currentIndex = 0
        }
    }
}

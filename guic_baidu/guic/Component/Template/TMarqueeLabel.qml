import QtQuick 2.0

Item {
    id: tMarqueeLabel
    objectName: "tMarqueeLabel"
    clip: true
    width: 100
    height: 50

    property string text: "Input text"
    property string fontFamily: "Source Sans Pro"
    property bool fontBold: false
    property int fontSize : 16
    property color color: "#ffffff"
    property bool running: true
    property real scrollingTextMargin: fontSize
    property bool mirrored: false

    property int horizontalAlignment: Text.AlignHCenter
    property real baselineOffset: -tMarqueeLabel.height/3

    Component.onCompleted: setScroll()

    onRunningChanged: setScroll()
    onVisibleChanged: setScroll()
    onTextChanged: {
        originText.text = text
        scrollText.text = text
        setScroll()
    }
    onFontFamilyChanged: setScroll()

    function setScroll()
    {
        scrollStartAni.running = false

        if(tMarqueeLabel.mirrored)
            originText.anchors.rightMargin = 0
        else
            originText.anchors.leftMargin = 0

        if(tMarqueeLabel.running && tMarqueeLabel.visible) {
            originText.elide = Text.ElideNone
            originText.width = scrollText.width

            if(originText.width > tMarqueeLabel.width) {
                scrollStartAni.running = true
            }
            else {
                originText.width = tMarqueeLabel.width
            }

        } else {
            originText.elide = Text.ElideNone
            originText.width = tMarqueeLabel.width
            if(originText.paintedWidth > tMarqueeLabel.width) {
                scrollStartAni.running = false
                if(tMarqueeLabel.mirrored)
                    originText.elide = Text.ElideLeft
                else
                    originText.elide = Text.ElideRight
            }
        }
    }

    Text {
        id: originText
        font.pixelSize: tMarqueeLabel.fontSize
        font.family: tMarqueeLabel.fontFamily
        font.bold: tMarqueeLabel.fontBold
        horizontalAlignment: tMarqueeLabel.horizontalAlignment
        color: tMarqueeLabel.color
        anchors.baseline: parent.bottom
        anchors.baselineOffset: tMarqueeLabel.baselineOffset
        clip: false
    }

    Text {
        id: scrollText
        font.pixelSize: tMarqueeLabel.fontSize
        font.family: tMarqueeLabel.fontFamily
        font.bold: tMarqueeLabel.fontBold
        horizontalAlignment: tMarqueeLabel.horizontalAlignment
        color: tMarqueeLabel.color
        visible: scrollStartAni.running
        anchors.baseline: tMarqueeLabel.bottom
        anchors.baselineOffset: tMarqueeLabel.baselineOffset
        clip: false
    }

    SequentialAnimation {
        id: scrollStartAni
        running: false
        loops: Animation.Infinite
//        PauseAnimation { duration: 2000 }
        PropertyAnimation {
            target: originText
            property: tMarqueeLabel.mirrored ? "anchors.rightMargin" : "anchors.leftMargin"
            to: -(originText.paintedWidth + scrollingTextMargin)
            duration: Math.floor( Math.abs(originText.paintedWidth + scrollingTextMargin) * 30)
            easing.type: Easing.Linear
        }
        PropertyAction { target: originText; property: "anchors.leftMargin"; value: 0 }
    }

    state: mirrored ? "mirrored" : "normal"
    states:[
        State{
            name: "normal"
            AnchorChanges{
                target: originText
                anchors.left: tMarqueeLabel.left
                anchors.right: undefined
            }
            PropertyChanges{
                target: originText
            }

            AnchorChanges{
                target: scrollText
                anchors.left: originText.left
                anchors.right: undefined
            }
            PropertyChanges{
                target: scrollText
                anchors.leftMargin: originText.paintedWidth + tMarqueeLabel.scrollingTextMargin
                anchors.rightMargin: undefined
            }
        },
        State{
            name: "mirrored"
            AnchorChanges{
                target: originText
                anchors.left: undefined
                anchors.right: tMarqueeLabel.right
            }
            PropertyChanges{
                target: originText
            }

            AnchorChanges{
                target: scrollText
                anchors.left: undefined
                anchors.right: originText.right
            }
            PropertyChanges{
                target: scrollText
                anchors.leftMargin: undefined
                anchors.rightMargin: originText.paintedWidth + tMarqueeLabel.scrollingTextMargin
            }
        }
    ]
}

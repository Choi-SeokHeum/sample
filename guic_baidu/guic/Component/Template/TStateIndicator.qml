import QtQuick 2.0
//import "../IVIS-A/Indicator/Image"

TIndicator {
    id: tStateIndicator
    objectName: "tStateIndicator"

    width: 30
    height: 30

    readonly property var iconState: [0, 1, 2, 3, 4, 5, 6, 7]
    property var icons: []
    property int indicatorState: -1
    property int marginImage: 0

    Image {
        id: iconImage
        anchors.horizontalCenter: tStateIndicator.horizontalCenter
        anchors.bottom: tStateIndicator.bottom
        anchors.bottomMargin: marginImage

        visible: tStateIndicator.icons.length// !(tStateIndicator.icon)

        state: tStateIndicator.indicatorState

        states: [
            State{
                name: tStateIndicator.iconState[0]
                PropertyChanges{
                    target: iconImage
                    source: tStateIndicator.icons[0]
                }
            },
            State{
                name: tStateIndicator.iconState[1]
                PropertyChanges{
                    target: iconImage
                    source: tStateIndicator.icons[1]
                }
            },
            State{
                name: tStateIndicator.iconState[2]
                PropertyChanges{
                    target: iconImage
                    source: tStateIndicator.icons[2]
                }
            },
            State{
                name: tStateIndicator.iconState[3]
                PropertyChanges{
                    target: iconImage
                    source: tStateIndicator.icons[3]
                }
            },
            State{
                name: tStateIndicator.iconState[4]

                PropertyChanges{
                    target: iconImage
                    source: tStateIndicator.icons[4]
                }
            },
            State{
                name: tStateIndicator.iconState[5]
                PropertyChanges{
                    target: iconImage
                    source: tStateIndicator.icons[5]
                }
            },
            State{
                name: tStateIndicator.iconState[6]
                PropertyChanges{
                    target: iconImage
                    source: tStateIndicator.icons[6]
                }
            },
            State{
                name: tStateIndicator.iconState[7]
                PropertyChanges{
                    target: iconImage
                    source: tStateIndicator.icons[7]
                }
            }
        ]
    }
}

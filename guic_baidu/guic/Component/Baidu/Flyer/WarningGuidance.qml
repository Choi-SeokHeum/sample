import QtQuick 2.0
import IVIS.Component 1.0

TSaftyAlert {
    id : warningGuidance
    objectName: "warningGuidance"
    width: 116
    height: 187

    property url symbolImage : ""


    Image{
        id : mainSymbolImage
        width: 116
        height: 116
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: 5
        source: symbolImage
    }

    Item{
        id : currentSpeedArea
        width: 116
        height: 58
        anchors.left: parent.left
        anchors.bottom: parent.bottom

        Item{
            id : currentSpeedValueArea
            width: 116
            height: 50
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter

            Image{
                id : hundredImage
                width: 37
                height: 50
                anchors.left: parent.left
                source: warningGuidance.hundredCurrentSpeedPath
            }
            Image{
                id : tenImage
                width: 37
                height: 50
                anchors.left: parent.left
                anchors.leftMargin: {
                    if ( currentSpeed < 100)
                        19
                    else
                        37
                }

                source: warningGuidance.tenCurrentSpeedPath
            }
            Image{
                id : oneImage
                width: 37
                height: 50
                anchors.left: tenImage.right
                source: warningGuidance.oneCurrentSpeedPath
            }
        }
    }

}

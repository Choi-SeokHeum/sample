import QtQuick 2.0
import IVIS.Component 1.0

TDigitalClock {
    id : digitalClock
    objectName: "digitalClock"
    width: 230
    height: 73

    hour : 12
    min : 30
    time24 : false
    imagePath:""// "../../../Component/IVIS-A/Navigation/Image/SpeedNumber/normalSpeed/id_under_"
    /*
      imagePath 는  시간을 나타내는 숫자 이미지가 있는 경로를 저장해 놓은 property 입니다.
      사용자께서는 프로젝트에 맞게 설정하여 사용하시기 바랍니다.

      */


//    Component.onCompleted: {
//        hour = 12
//        min = 58
//        time24 = false
//    }

    Item{
        id : timeArea
        width: time24 ? 161 : 214
        height: 43
        anchors.left: parent.left
        anchors.leftMargin: time24 ? 35 : 8
        anchors.top: parent.top
        anchors.topMargin: 15

        Item{
            id : tenSeat_hour
            width: 38
            height: 43
            anchors.left: timeArea.left

            Image{
                id : tenSeat_hour_image
                width: parent.width
                height: parent.height
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                source: tenCurrentHour
            }
        }
        Item{
            id : oneSeat_hour
            width: 38
            height: 43
            anchors.left: tenSeat_hour.right

            Image{
                id : oneSeat_hour_image
                width: parent.width
                height: parent.height
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                source: oneCurrentHour
            }
        }


        Text{
            id : center_colon
            width: 9
            height: 43
            anchors.left: oneSeat_hour.right
            anchors.bottom:parent.bottom
            text : ":"
            font.pixelSize: 25
        }

        Item{
            id : tenSeat_Min
            width: 38
            height: 43
            anchors.left: center_colon.right

            Image{
                id : tenSeat_Min_image
                width: parent.width
                height: parent.height
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                source: tenCurrentMin
            }
        }

        Item{
            id : oneSeat_Min
            width: 38
            height: 43
            anchors.left: tenSeat_Min.right

            Image{
                id : oneSeat_Min_image
                width: parent.width
                height: parent.height
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                source: oneCurrentMin
            }
        }


        Item{
            id : ampmArea
            width: 53
            height: 43
            anchors.left: oneSeat_Min.right
            visible: time24 ? false : true

            Text{
                id : amPmText
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                text : amPm ? "AM" : "PM"
                font.pixelSize: 25
                font.family: "Source Sans Pro"

            }
        }
    }
}

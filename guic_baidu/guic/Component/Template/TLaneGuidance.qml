import QtQuick 2.0
Item{
    id : tLaneGuidance
    objectName: "tLaneGuidance"
    width: 63
    height: 62

    property var laneInfoArr: []
    property var laneArr :[]
    property var sample: []
    property int distanceValue : 500

    onDistanceValueChanged: {

        if (distanceValue === 0 ){
            tLaneGuidance.visible = false
            tLaneArea.destoryObject()
        }
    }

    onLaneInfoArrChanged: {
        private_class.drawLane(laneInfoArr)
    }

    Component.onDestruction: {
        tLaneArea.destoryObject()
    }

    Image{
        id : distanceBg
        width: 113
        height: 62
        anchors.top: parent.top
        anchors.left: parent.left
        source: ""//"qrc:/Component/Navigation/Image/LaneGuidance/lane_bg_original.png"

        /*
          source :  에 들어갈 이미지는 LaneGuidance 의 거리 출력부분의 배경을 설정하는 부분 입니다.
            사용자께서는 프로젝트에 맞는 이미지 경로를 source 에 설정하신 후 사용하시기 바랍니다.
          */


        Text{
            id : distanceText
            objectName: "distanceText"
            text: distanceValue+"M"
            font.family: "Source Sans Pro"
            font.pixelSize: 19
            font.bold: true
            color: "#ffffff"
            anchors.verticalCenter: distanceBg.verticalCenter
            anchors.horizontalCenter: distanceBg.horizontalCenter
        }

        Image{
            id : linelaneLeft
            height: parent.height
            anchors.left: parent.left
            source: ""//"qrc:/Component/Navigation/Image/LaneGuidance/line_lane.png"
            /*
              source :  에 들어갈 이미지는 거리 출력부분의 좌측 테두리 배경 입니다.
                사용자께서는 프로젝트에 맞는 이미지 경로를 source 에 설정하신 후 사용하시기 바랍니다.
              */
        }

        Image{
            id : linelaneRight
            height: parent.height
            anchors.right: parent.right
            source: ""//"qrc:/Component/Navigation/Image/LaneGuidance/line_lane.png"
            /*
              source :  에 들어갈 이미지는 거리 출력부분의 우측 테두리 배경 입니다.
                사용자께서는 프로젝트에 맞는 이미지 경로를 source 에 설정하신 후 사용하시기 바랍니다.
              */
        }
    }

    Item {
        id : tLaneArea
        objectName: "tLaneArea"
        anchors.right: distanceBg.left
        anchors.top: parent.top

        Image{
            id : background
            width: tLaneArea.width
            height: tLaneArea.height
            anchors.fill: parent
            source: ""//"qrc:/Component/Navigation/Image/LaneGuidance/lane_bg_original.png"

            /*
              source :  에 들어갈 이미지는 LaneGuidance 전체배경을 설정하는 부분 입니다.
                사용자께서는 프로젝트에 맞는 이미지 경로를 source 에 설정하신 후 사용하시기 바랍니다.
              */

        }


        QtObject{
            id : private_class
            function drawLane(laneInfoArr)// 입력받은 차선과 출력할 이미지를 동적으로 생성하는 함수
            {
                if ( laneInfoArr.length !== 0)
                {
                    for (var i = 0 ; i < laneInfoArr.length ; i++)
                    {
                        for (var j = 0 ; j < laneInfoArr[i].length ; j++)
                        {
                            var component = Qt.createComponent("TLaneImageArea.qml");
                            var object = component.createObject(tLaneArea)

                            sample.push(object)
                            object.image = laneInfoArr[i][j]
                            object.x = (object.width)*i
                            tLaneArea.width = (object.width)*(i+1)
                            tLaneArea.height = object.height
                        }

                        laneArr.push(sample)
                    }
                }
            }
        }

        function destoryObject() //drawLane 으로 그려진 차선의 객체를 지우고 참조하던 주소를 삭제하는 함수
        {
            if ( sample.length !== 0 )
            {
                for (var z = 0 ; z < sample.length; z++)
                {
                    sample[z].destroy()
                }

                sample = []

                for(var i=0; i< laneInfoArr.length; i++)
                {
                    for(var j = 0; j<laneInfoArr[i].length; j++)
                    {

                        laneArr[i][j].destroy()
                    }
                }
                laneArr = []
            }
        }
    }
}


import QtQuick 2.0

Item{
    id : laneImageArea
    objectName: "laneImageArea"
    width: 63
    height: 62

    property url image : ""

    Image{
        id : lane
        width: laneImageArea.width
        height: laneImageArea.height
        anchors.centerIn: parent
        source: image
    }

    Image{
        id : linelaneleft
        height: parent.height
        anchors.left: parent.left
        source: ""//"qrc:/Component/Navigation/Image/LaneGuidance/line_lane.png"

        /*
          source :  에 들어갈 이미지는 LaneGuidance 의 하나의 Lane 을 만들때 사용되는 배경을 설정하는 부분 입니다.
            사용자께서는 프로젝트에 맞는 이미지 경로를 source 에 설정하신 후 사용하시기 바랍니다.
          */
    }

    Component.onDestruction: {
        //console.log(objectName, "is desroyed")
    }
}

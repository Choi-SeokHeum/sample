import QtQuick 2.0

Item {
    id : testNaviScreen
    objectName: "testNaviScreen"
    width: 800
    height: 480


    LaneGuidance{
        id : testLaneGuidance
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        distanceValue: 700

        laneInfoArr: [
            ["../../Component/IVIS-A/Navigation/Image/LaneGuidance/lane_arrow_gray_11.png",
            "../../Component/IVIS-A/Navigation/Image/LaneGuidance/lane_arrow_blue_09.png"],

            ["../../Component/IVIS-A/Navigation/Image/LaneGuidance/lane_arrow_blue_01.png"],

            ["../../Component/IVIS-A/Navigation/Image/LaneGuidance/lane_arrow_blue_01.png"],

            ["../../Component/IVIS-A/Navigation/Image/LaneGuidance/lane_arrow_blue_01.png"],

            ["../../Component/IVIS-A/Navigation/Image/LaneGuidance/lane_arrow_gray_18.png",
            "../../Component/IVIS-A/Navigation/Image/LaneGuidance/lane_arrow_blue_16.png"]
        ]
    }



    TurnByTurn{
        id : testTurnByTurn
        anchors.right: parent.right

        distanceValue: 2500
        secondDistanceValue: 7500
        icon_Unit: 0
    }




    SaftyAlert{
        id : testSaftyAlert
        anchors.top: parent.top
        anchors.topMargin: 150

        currentSpeed: 70
        referenceSpeed:80
        averageSpeed : 97
        distanceValue : 800
//        subImage_OnOff : true
//        averageArea_OnOff : true

    }



}

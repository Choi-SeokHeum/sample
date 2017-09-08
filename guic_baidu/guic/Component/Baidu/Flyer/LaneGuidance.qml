import QtQuick 2.0
import IVIS.Component 1.0


/* ============================ LaneGuidance Description =============================

  ******************* LaneGuidance *******************
  TLaneGuidance 를 상속 받아 만든 Component.
  LaneGuidance 는 지도상에 안내해야 할 차선 정보를 출력하고 사라지게 하는 NaviFlyer.


  laneInfoArr   : 차선 정보를 2차원 배열로 받아서 출력시켜주는 배열 .
  distanceValue : 차선 분기점까지 남은 거리를 출력해주는 변수.
  distanceValue 가 0 이 되는 순간, laneGuidance 는 사라지게 된다.



  *********************** laneInfoArr 사용법 *****************************
  1. laneInfoArr 은 반드시 2차원 배열로 데이터를 받아야 한다.
  2. laneInfoArr 은 [ [], [], [], [], [], [] ] 의 형태이며, 데이터는 배열안에 배열속에 데이터를 삽입한다.
  3. laneInfoArr 에 차선 안내 방향 이미지를 조합할 때는 문서를 참조하여 조합한다.
  4. 삽입된 이미지는 마지막에 쌓은 이미지가 가장 상단에 위치하게 되어 있다.
   즉 1번 lane 에 3 가지 이미지가 출력될 경우, 1번째 이미지가 가장 하단에 배치되고,  3번째 이미지가 가장 상단에
   배치된다.  그러므로 추천 차선의 경우 가장 마지막에 삽입하는 것을 원칙으로 한다.

   ex )
   laneInfoArr : [
               ["좌회전차선"],

               ["좌회전차선",
                "직진차선(추천)",],

               [ "직진차선(추천)",],

               [ "직진차선(추천)",],

               [ "우회전차선",]
        ]

  ====================================================================================*/


TLaneGuidance {
    id : laneGuidance
    objectName: "laneGuidance"

    laneInfoArr: [
//        ["../../Component/IVIS-A/Navigation/Image/LaneGuidance/icon_lane_bus.png"],
//        ["../../Component/IVIS-A/Navigation/Image/LaneGuidance/icon_lane_bus.png"],
//        ["../../Component/IVIS-A/Navigation/Image/LaneGuidance/icon_lane_bus.png"],
    ]

}

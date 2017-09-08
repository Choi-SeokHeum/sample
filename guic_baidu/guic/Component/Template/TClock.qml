import QtQuick 2.0

TControl {
    id: clock
    objectName: "Clock"

    property int gmtHour
    property int gmtMinute
    property int gmtSecond

    property int hour: (clock.gmtHour + timeShift) >= 0 ? (clock.gmtHour + timeShift) % 24
                                                        : 24 + (clock.gmtHour + timeShift)
    property int minute: clock.gmtMinute + (timeShift % 1) * 60
    property int second: clock.gmtSecond

    readonly property bool meridiem: clock.hour >= 12 ? true : false

    property int autoRefreshInterval: 1000
    property bool autoRefresh: false

    readonly property var timeShift: (timeZoneLocation != "" && timeZoneAbbreviation != "")
                                     && (privateObject.locationIndex != -1)
                                     ? privateObject.findTimeShift() : 0

    property string timeZoneLocation//: "Asia"
    property string timeZoneAbbreviation//: "KST"

    onAutoRefreshChanged: {
        if ( autoRefresh )
            autoRefreshTimer.start()
        else
            autoRefreshTimer.stop()
    }

    onGmtHourChanged: {
        if (clock.gmtHour > 23)
        {
            clock.gmtHour = 23
        }
        else if (gmtHour < 0)
        {
            clock.gmtHour = 0
        }
    }

    onGmtMinuteChanged: {
        if (clock.gmtMinute > 59)
        {
            clock.gmtMinute = 59
        }
        else if (clock.gmtMinute < 0)
        {
            clock.gmtMinute = 0
        }
    }

    onGmtSecondChanged: {
        if (clock.gmtSecond > 59)
        {
            clock.gmtSecond = 59
        }
        else if (clock.gmtSecond < 0)
        {
            clock.gmtSecond = 0
        }
    }

    Timer {
        id: autoRefreshTimer
        objectName: "AutoRefreshTimer"
        interval: clock.autoRefreshInterval
        repeat: true

        onTriggered: {
            privateObject.updateCurrentTime()
        }
    }

    QtObject {
        id: privateObject

        property int locationIndex: timeZoneLocationName.indexOf(timeZoneLocation)
        property var currentAbbreviation: timeZoneAbbreviationArr[locationIndex]

        property var timeZoneLocationName: ["Asia",
                                            "Atlantic",
                                            "Australia",
                                            "SouthAmerica",
                                            "NorthAmerica",
                                            "Caribbean",
                                            "Europe",
                                            "Antarctica",
                                            "IndianOcean",
                                            "Africa",
                                            "Pacific",
                                            "Worldwide"]


        property var timeZoneAbbreviationArr: [timeZoneAsiaAbbreviation,
                                               timeZoneAtlanticAbbreviation,
                                               timeZoneAustraliaAbbreviation,
                                               timeZoneSouthAmericaAbbreviation,
                                               timeZoneNorthAmericaAbbreviation,
                                               timeZoneCaribbeanAbbreviation,
                                               timeZoneEuropeAbbreviation,
                                               timeZoneAntarcticaAbbreviation,
                                               timeZoneIndianOceanAbbreviation,
                                               timeZoneAfricaAbbreviation,
                                               timeZonePacificAbbreviation,
                                               timeZoneWorldwideAbbreviation]

        property var timeZoneOffsetArr:  [timeZoneAsiaOffset,
                                          timeZoneAtlanticOffset,
                                          timeZoneAustraliaOffset,
                                          timeZoneSouthAmericaOffset,
                                          timeZoneNorthAmericaOffset,
                                          timeZoneCaribbeanOffset,
                                          timeZoneEuropeOffset,
                                          timeZoneAntarcticaOffset,
                                          timeZoneIndianOceanOffset,
                                          timeZoneAfricaOffset,
                                          timeZonePacificOffset,
                                          timeZoneWorldwideOffset]

        // Define Asia
        property var timeZoneAsiaAbbreviation: [["ADT", "AST"],    //3
                                                ["AFT"],
                                                ["ALMT"],   //6
                                                ["KST", "YAKT"]]    //9
        property var timeZoneAsiaOffset: [3, 4.5, 6, 9]

        // Define Atlantic
        property var timeZoneAtlanticAbbreviation: []
        property var timeZoneAtlanticOffset: []

        // Define Australia
        property var timeZoneAustraliaAbbreviation: []
        property var timeZoneAustraliaOffset: []

        // Define SouthAmerica
        property var timeZoneSouthAmericaAbbreviation: []
        property var timeZoneSouthAmericaOffset: []

        // Define NorthAmerica
        property var timeZoneNorthAmericaAbbreviation: [["EGST"], //0
                                                        ["EGT"], //-1
                                                        ["PMDT", "WGST"], //-2
                                                        ["NDT"], //-2.5
                                                        ["ADT", "PMST", "WGT"], //-3
                                                        ["NST"], //-3.5
                                                        ["AKDT", "EDT"],//-4
                                                        ["CDT", "EST", "ET"], //-5
                                                        ["CST", "CT", "MDT"], //-6
                                                        ["MST", "MT", "PDT"], //-7
                                                        ["AST", "AT", "PST", "PT"], //-8
                                                        ["AKST", "HADT"], //-9
                                                        ["HAST"]] //-10
        property var timeZoneNorthAmericaOffset: [0, -1, -2, -2.5, -3, -3.5, -4, -5, -6, -7, -8, -9, -10]

        // Define Caribbean
        property var timeZoneCaribbeanAbbreviation: []
        property var timeZoneCaribbeanOffset: []

        // Define Europe
        property var timeZoneEuropeAbbreviation: [["BST", "CET"], ["EEST"]]
        property var timeZoneEuropeOffset: [1, 3]

        // Define Antartica
        property var timeZoneAntarcticaAbbreviation: []
        property var timeZoneAntarcticaOffset: []

        // Define IndicanOcean
        property var timeZoneIndianOceanAbbreviation: []
        property var timeZoneIndianOceanOffset: []

        // Define Africa
        property var timeZoneAfricaAbbreviation: []
        property var timeZoneAfricaOffset: []

        // Define Pacific
        property var timeZonePacificAbbreviation: []
        property var timeZonePacificOffset: []

        // Define Worldwide
        property var timeZoneWorldwideAbbreviation: []
        property var timeZoneWorldwideOffset: []

        function updateCurrentTime()
        {
            if (clock.gmtSecond < 59 && clock.gmtSecond >= 0)
                clock.gmtSecond += (clock.autoRefreshInterval / 1000)
            else
            {
                if (clock.gmtMinute < 59 && clock.gmtMinute >= 0)
                    gmtMinute += 1
                else
                {
                    clock.gmtMinute = 0

                    if (clock.gmtHour < 23 && clock.gmtHour >= 0)
                        clock.gmtHour += 1
                    else
                        clock.gmtHour = 0
                }

                clock.gmtSecond = 0
            }
        }

        function findTimeShift()
        {
            for (var i = 0 ; i < currentAbbreviation.length ; i++)
            {
                for (var j = 0 ; j < currentAbbreviation[i].length ; j++)
                {
                    if (currentAbbreviation[i][j] === timeZoneAbbreviation)
                    {
                        return timeZoneOffsetArr[locationIndex][i]
                    }
                }
            }
        }
    }

//    ListModel {
//        id: asia
//        ListElement {
//            abbreviation: "Ast"
//            offset: 5
//        }
//    }
}

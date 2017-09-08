import QtQuick 2.0

TLabel {
    id : tPlayTimeLabel
    objectName: "tPlayTimeLabel"
    width: 70
    height: 15

    property int second : 0
    onSecondChanged:secondToText()

    function secondToText()
    {
        var seconds = tPlayTimeLabel.second

        if ( seconds > 0 )
        {
            var hour = Math.floor(seconds/3600);
            var minute = Math.floor(seconds%3600/60);
            var second = Math.floor(seconds%60);

            if ( hour < 10 )
            {
                hour = "0"+hour;
            }
            if ( minute < 10 && hour > 0 )
            {
                minute = "0"+minute;
            }
            if ( second < 10 && minute >=0 )
            {
                second = "0"+second;
            }
            if ( hour > 0 )
            {
                tPlayTimeLabel.text = hour+":"+minute+":"+second;
            }
            else
            {
                tPlayTimeLabel.text = minute+":"+second;
            }
        }
        else
        {
            tPlayTimeLabel.text = "00:00"
        }
    }

    Component.onCompleted: {
        secondToText()
    }

}

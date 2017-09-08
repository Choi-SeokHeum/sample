import QtQuick 2.0

TControl {
    id: progressbar
    objectName: "ProgressBar"

    property real from: 0
    property real to: 100
    property real value: 0
    property real position: 0

    property bool indeterminate: false

    onFromChanged: {
        if (from > to)
        {
            from = to
        }

        if (from > value)
        {
            value = from
        }
    }

    onToChanged: {
        if (from > to)
        {
            from = to
        }

        if (from > value)
        {
            value = from
        }
    }

    onValueChanged: {
        if (value > to)
            value = to

        if (from > value)
            value = from

        position = (value-from) / (to-from)

        //console.log(progressbar.objectName, value)
        //console.log(progressbar.objectName, position)
    }
}

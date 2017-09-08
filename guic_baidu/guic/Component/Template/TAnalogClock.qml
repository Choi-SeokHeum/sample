import QtQuick 2.0

TClock {
    readonly property real hourAngle: (hour % 12 + minute / 60) * 30
    readonly property real minuteAngle: (minute + second / 60) * 6
    readonly property real secondAngle: second * 6
}

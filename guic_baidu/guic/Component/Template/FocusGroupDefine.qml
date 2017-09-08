pragma Singleton
import QtQuick 2.0

QtObject {
    readonly property int undefinedRow: -1
    readonly property int undefinedColumn: -1
    readonly property int undefinedIndex: -1

    readonly property int topDirection: 0
    readonly property int bottomDirection: 1
    readonly property int leftDirection: 2
    readonly property int rightDirection: 3
}

import QtQuick 2.0

Item {
    id: abstractLayout

    property bool shift: false
    property bool capsLock: false
    property bool upperCased: shift || capsLock
    property int length: 0
    property bool inputEnabled: false

    signal requestKeyInput(int keyType, int keyValue)
    signal requestSelectionInput(string candidate)
    property var selectionList:[]

    property alias selectionListModel: selectionListModel

    onSelectionListChanged: {
        selectionListModel.clear()

        for(var i = 0 ; i < selectionList.length ; i++)
        {
            selectionListModel.append({"selection": selectionList[i]})
        }
    }

    function setShift(shift){
        abstractLayout.shift = shift
    }

    function setCapsLock(capsLock){
        abstractLayout.capsLock = capsLock
    }

    function setLength(length){
        abstractLayout.length = length
    }

    function setInputEnabled(inputEnabled){
        abstractLayout.inputEnabled = inputEnabled
    }

    ListModel {
        id: selectionListModel
    }


//    onShiftChanged: {
//        console.log(shift)
//    }
//    onCapsLockChanged: {
//        console.log(capsLock)
//    }
//    onUpperCasedChanged: {
//        console.log(upperCased)
//    }
//    onLengthChanged: {
//        console.log(length)
//    }
}

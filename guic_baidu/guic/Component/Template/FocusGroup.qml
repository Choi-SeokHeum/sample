import QtQuick 2.0
import IVIS.Component 1.0

Item {
    id: focusGroup
    objectName: "FocusGroup"

    property bool focusedGroup: false

    property int defaultRow: 0
    property int defaultColumn: 0

    property bool availableJumpRow: false
    property bool availableJumpColumn: false
    property bool availableJumpDiagonal: false
    property bool availableJumpDisabled: false
    property bool availableGUICPolicy: true

    signal resetFocusFailed(int defaultRow, int defaultColumn)
    signal currentFocusedItemDisabled(int row, int column)

    onEnabledChanged: {
        if (enabled)
        {
            if (privateObject.checkItemExist(privateObject.currentRow, privateObject.currentColumn)
                    && focusedGroup)
            {
                currentItemConnections.target = privateObject.itemArray[privateObject.currentRow][privateObject.currentColumn]
                getCurrentItem().myFocus = true
            }
        }
        else
        {
            if (privateObject.checkItemExist(privateObject.currentRow, privateObject.currentColumn))
            {
                currentItemConnections.target = null
                getCurrentItem().myFocus = false
            }
        }
    }

    onFocusedGroupChanged: {
        if (focusedGroup)
        {
            if (   (privateObject.itemCount > 0)
                && (privateObject.currentRow !== FocusGroupDefine.undefinedRow)
                && (privateObject.currentColumn !== FocusGroupDefine.undefinedColumn)   )
            {
                //console.log("registered item is not exist")
                currentItemConnections.target = privateObject.itemArray[privateObject.currentRow][privateObject.currentColumn]//
                getCurrentItem().myFocus = true
            }
        }
        else
            getCurrentItem().myFocus = false
    }

    function registerItem(item, row, column)
    {
        privateObject.registerItem(item, row, column)
    }

    function moveFocusNextIndexItem()
    {
        var matrix = privateObject.findNextIndexItemMatrix()

        if (matrix !== undefined)
        {
            var nextRow = matrix[0]
            var nextColumn = matrix[1]

            moveFocusSpecificPosition(nextRow, nextColumn)

            return true
        }

        return false
    }

    function moveFocusPreviousIndexItem()
    {
        var matrix = privateObject.findPreviousIndexItemMatrix()

        if (matrix !== undefined)
        {
            var nextRow = matrix[0]
            var nextColumn = matrix[1]

            moveFocusSpecificPosition(nextRow, nextColumn)

            return true
        }

        return false
    }

    function resetFocus()
    {
        if (!privateObject.checkItemExist(defaultRow, defaultColumn))
        {
            resetFocusFailed(defaultRow, defaultColumn)
            console.log("resetFocus(): ", "(", defaultRow, ", ", defaultColumn, ")", " item is not exist")
            return
        }

        if (privateObject.itemArray[defaultRow][defaultColumn].enabled)
        {
            moveFocusSpecificPosition(defaultRow, defaultColumn)
        }
        else
        {
            resetFocusFailed(defaultRow, defaultColumn)
            console.log("resetFocus(): ", "(", defaultRow, ", ", defaultColumn, ")", " item is not enabled")
        }
    }

    function moveFocusUpLeft()
    {
        var nextItemMatrix = privateObject.findPreviousRowsPreviousColumn(focusGroup.availableJumpDiagonal, focusGroup.availableJumpDisabled)

        if (nextItemMatrix !== undefined)
        {
            var nextRow = nextItemMatrix[0]
            var nextColumn = nextItemMatrix[1]

            moveFocusSpecificPosition(nextRow, nextColumn)

            return true
        }

        return false
    }

    function moveFocusDownRight()
    {
        var nextItemMatrix = privateObject.findNextRowsNextColumn(focusGroup.availableJumpDiagonal, focusGroup.availableJumpDisabled)

        if (nextItemMatrix !== undefined)
        {
            var nextRow = nextItemMatrix[0]
            var nextColumn = nextItemMatrix[1]

            moveFocusSpecificPosition(nextRow, nextColumn)

            return true
        }

        return false
    }

    function moveFocusUpRight()
    {
        var nextItemMatrix = privateObject.findPreviousRowsNextColumn(focusGroup.availableJumpDiagonal, focusGroup.availableJumpDisabled)

        if (nextItemMatrix !== undefined)
        {
            var nextRow = nextItemMatrix[0]
            var nextColumn = nextItemMatrix[1]

            moveFocusSpecificPosition(nextRow, nextColumn)

            return true
        }

        return false
    }

    function moveFocusDownLeft()
    {
        var nextItemMatrix = privateObject.findNextRowsPreviousColumn(availableJumpDiagonal, focusGroup.availableJumpDisabled)

        if (nextItemMatrix !== undefined)
        {
            var nextRow = nextItemMatrix[0]
            var nextColumn = nextItemMatrix[1]

            moveFocusSpecificPosition(nextRow, nextColumn)

            return true
        }

        return false
    }

    function moveFocusRight()
    {
        var nextColumn = privateObject.findCurrentRowsNextColumn(focusGroup.availableJumpColumn, focusGroup.availableJumpDisabled)

        if (nextColumn !== FocusGroupDefine.undefinedColumn)
        {
            moveFocusSpecificPosition(privateObject.currentRow, nextColumn)

            return true
        }

        return false
    }

    function moveFocusLeft()
    {
        var previousColumn = privateObject.findCurrentRowsPreviousColumn(focusGroup.availableJumpColumn, focusGroup.availableJumpDisabled)

        if (previousColumn !== FocusGroupDefine.undefinedColumn)
        {
            moveFocusSpecificPosition(privateObject.currentRow, previousColumn)

            return true
        }

        return false
    }

    function moveFocusDown()
    {
        var nextRow = privateObject.findCurrentColumnsNextRow(focusGroup.availableJumpRow, focusGroup.availableJumpDisabled)

        if (nextRow !== FocusGroupDefine.undefinedRow)
        {
            moveFocusSpecificPosition(nextRow, privateObject.currentColumn)

            return true
        }

        return false
    }

    function moveFocusUp()
    {
        var previousRow = privateObject.findCurrentColumnsPreviousRow(focusGroup.availableJumpRow, focusGroup.availableJumpDisabled)

        if (previousRow !== FocusGroupDefine.undefinedRow)
        {
            moveFocusSpecificPosition(previousRow, privateObject.currentColumn)

            return true
        }

        return false
    }

    function isLastEnabledColumn()
    {
        if (privateObject.isLastColumn(privateObject.currentRow, privateObject.currentColumn))
        {
            return true
        }
        else
        {
            var column = privateObject.findLastEnabledColumn(privateObject.currentRow)

            if (column === privateObject.currentColumn)
                return true
            else
                return false
        }
    }

    function isFirstEnabledColumn()
    {
        if (privateObject.isFirstColumn(privateObject.currentRow, privateObject.currentColumn))
        {
            return true
        }
        else
        {
            var column = privateObject.findFirstEnabledColumn(privateObject.currentRow)

            if (column === privateObject.currentColumn)
                return true
            else
                return false
        }
    }

    function isLastEnabledRow()
    {
        if (privateObject.isLastRow(privateObject.currentRow, privateObject.currentColumn))
        {
            return true
        }
        else
        {
            var row = privateObject.findLastEnabledRow(privateObject.currentColumn)

            if (row === privateObject.currentRow)
            {
                return true
            }
            else
                return false
        }
    }

    function isFirstEnabledRow()
    {
        if (privateObject.isFirstRow(privateObject.currentRow, privateObject.currentColumn))
        {
            return true
        }
        else
        {
            var row = privateObject.findFirstEnabledRow(privateObject.currentColumn)

            if (row === privateObject.currentRow)
            {
                return true
            }
            else
                return false
        }
    }

    function moveFocusFirstEnabledColumn()
    {
        if ( !privateObject.isFirstColumn(privateObject.currentRow, privateObject.currentColumn))
        {
            var column = privateObject.findFirstEnabledColumn(privateObject.currentRow)

            if (column !== FocusGroupDefine.undefinedColumn)
            {
                moveFocusSpecificPosition(privateObject.currentRow, column)

                return true
            }
        }

        return false
    }

    function moveFocusLastEnabledColumn()
    {
        if ( !privateObject.isLastColumn(privateObject.currentRow, privateObject.currentColumn) )
        {
            var column = privateObject.findLastEnabledColumn(privateObject.currentRow)

            if (column !== FocusGroupDefine.undefinedColumn)
            {
                moveFocusSpecificPosition(privateObject.currentRow, column)

                return true
            }
        }

        return false
    }

    function moveFocusFirstEnabledRow()
    {
        if ( !privateObject.isFirstRow(privateObject.currentRow, privateObject.currentColumn))
        {
            var row = privateObject.findFirstEnabledRow(privateObject.currentColumn)

            if (row !== FocusGroupDefine.undefinedRow)
            {
                moveFocusSpecificPosition(row, privateObject.currentColumn)

                return true
            }
        }

        return false
    }

    function moveFocusLastEnabledRow()
    {
        if ( !privateObject.isLastRow(privateObject.currentRow, privateObject.currentColumn))
        {
            var row = privateObject.findLastEnabledRow(privateObject.currentColumn)

            if (row !== FocusGroupDefine.undefinedRow)
            {
                moveFocusSpecificPosition(row, privateObject.currentColumn)

                return true
            }
        }

        return false
    }

    function moveFocusSpecificPosition(row, column)
    {
        if (privateObject.checkItemExist(row, column)
                && privateObject.itemArray[row][column].enabled !== false)
        {
            privateObject.itemArray[privateObject.currentRow][privateObject.currentColumn].myFocus = false

            if (focusGroup.focusedGroup)
                privateObject.itemArray[row][column].myFocus = true

            privateObject.currentRow = row
            privateObject.currentColumn = column
            currentItemConnections.target = privateObject.itemArray[privateObject.currentRow][privateObject.currentColumn]

            return true
        }

        return false

//        if (privateObject.itemArray[row] !== undefined)
//        {
//            if (privateObject.itemArray[row][column] !== undefined)
//            {
//                if (privateObject.itemArray[row][column].enabled)
//                {
//                    privateObject.itemArray[privateObject.currentRow][privateObject.currentColumn].myFocus = false
//                    privateObject.itemArray[row][column].myFocus = true
//                    privateObject.currentRow = row
//                    privateObject.currentColumn = column
//                    currentItemConnections.target = privateObject.itemArray[privateObject.currentRow][privateObject.currentColumn]//
//                }
//                else
//                {
//                    console.log("moveFocusSpecificPosition(row, column): ", "(", row, ",", column, ")",
//                                "item is not enabled")
//                }
//            }
//            else
//            {
//                console.log("moveFocusSpecificPosition(row, column): Undefined Column")
//            }
//        }
//        else
//        {
//            console.log("moveFocusSpecificPosition(row, column): Undefined Row")
//        }
    }

    function moveFocusSpecificItem(objectName)
    {
        var objectIndex = privateObject.itemObjectName.indexOf(objectName)
        var object = privateObject.items[objectIndex]

        if (objectIndex === FocusGroupDefine.undefinedIndex)
        {
            console.log("moveFocusSpecificItem(objectName): ", objectName, " is not registered")
            return false
        }
        else
        {
            if (object.enabled)
            {
                var nextRow = privateObject.itemInfo[objectIndex][0]
                var nextColumn = privateObject.itemInfo[objectIndex][1]

                moveFocusSpecificPosition(nextRow, nextColumn)

                return true
            }
            else {
                console.log("moveFocusSpecificItem(objectName): ", objectName, " is not enabled")
                return false
            }
        }
    }

    function moveFocusSpecificItemByID(id)
    {
        var objectIndex = privateObject.items.indexOf(id)
        var object = privateObject.items[objectIndex]

        if (objectIndex === FocusGroupDefine.undefinedIndex)
        {
            console.log("moveFocusSpecificItemByID(id): ", objectName, " is not registered")
            return false
        }
        else
        {
            if (object.enabled)
            {
                var nextRow = privateObject.itemInfo[objectIndex][0]
                var nextColumn = privateObject.itemInfo[objectIndex][1]

                moveFocusSpecificPosition(nextRow, nextColumn)

                return true
            }
            else
            {
                console.log("moveFocusSpecificItemByID(id): ", objectName, " is not enabled")
                return false
            }
        }
    }

    function getCurrentItem()
    {
        if (privateObject.itemArray[privateObject.currentRow] === undefined)
            return false

        if (privateObject.itemArray[privateObject.currentRow][privateObject.currentColumn] !== undefined)
            return privateObject.itemArray[privateObject.currentRow][privateObject.currentColumn]
        else
            return false
    }

    function findItem(row, column)
    {
        if (privateObject.itemArray[row][column] !== undefined)
        {
            //console.log("exist: ", privateObject.itemArray[row][column].objectName)
        }
        else
        {
            //console.log("not exist item the index")
        }
    }

    QtObject {
        id: privateObject
        objectName: "PrivateObject"

        property int currentColumn: focusGroup.defaultColumn
        property int currentRow: focusGroup.defaultRow

        property int enabledItemCount: 0

        property int itemCount: 0 //등록 된 총 아이템의 갯수

        property var itemArray: []

        property var items: []
        property var itemInfo: []
        property var itemObjectName: []

        property var rows: []    //특정 열의 아이템 갯수
        property var columns: [] //특정 행의 아이템 갯수

        property var rowsColumnCount: [] //특정 열의 행 갯수
        property var columnsRowCount: [] //특정 행의 열 갯수

        property var rowsFirstColumn: [] //특정 열의 시작 행에 대한 인덱스
        property var rowsLastColumn: []  //특정 열의 마지막 행에 대한 인덱스
        property var columnsFirstRow: [] //특정 행의 시작 열에 대한 인덱스
        property var columnsLastRow: []  //특정 행의 마지막 열에 대한 인덱스

        onEnabledItemCountChanged: {

        }

        function moveFocusUpLeft()
        {
            var nextItemMatrix = privateObject.findPreviousRowsPreviousColumn(false, false)

            if (nextItemMatrix !== undefined)
            {
                var nextRow = nextItemMatrix[0]
                var nextColumn = nextItemMatrix[1]

                moveFocusSpecificPosition(nextRow, nextColumn)

                return true
            }

            return false
        }

        function moveFocusDownRight()
        {
            var nextItemMatrix = privateObject.findNextRowsNextColumn(false, false)

            if (nextItemMatrix !== undefined)
            {
                var nextRow = nextItemMatrix[0]
                var nextColumn = nextItemMatrix[1]

                moveFocusSpecificPosition(nextRow, nextColumn)

                return true
            }

            return false
        }

        function moveFocusUpRight()
        {
            var nextItemMatrix = privateObject.findPreviousRowsNextColumn(false, false)

            if (nextItemMatrix !== undefined)
            {
                var nextRow = nextItemMatrix[0]
                var nextColumn = nextItemMatrix[1]

                moveFocusSpecificPosition(nextRow, nextColumn)

                return true
            }

            return false
        }

        function moveFocusDownLeft()
        {
            var nextItemMatrix = privateObject.findNextRowsPreviousColumn(false, false)

            if (nextItemMatrix !== undefined)
            {
                var nextRow = nextItemMatrix[0]
                var nextColumn = nextItemMatrix[1]

                moveFocusSpecificPosition(nextRow, nextColumn)

                return true
            }

            return false
        }

        function moveFocusRight()
        {
            var nextColumn = privateObject.findCurrentRowsNextColumn(false, false)

            if (nextColumn !== FocusGroupDefine.undefinedColumn)
            {
                moveFocusSpecificPosition(privateObject.currentRow, nextColumn)

                return true
            }

            return false
        }

        function moveFocusLeft()
        {
            var previousColumn = privateObject.findCurrentRowsPreviousColumn(false, false)

            if (previousColumn !== FocusGroupDefine.undefinedColumn)
            {
                moveFocusSpecificPosition(privateObject.currentRow, previousColumn)

                return true
            }

            return false
        }

        function moveFocusDown()
        {
            var nextRow = privateObject.findCurrentColumnsNextRow(false, false)

            if (nextRow !== FocusGroupDefine.undefinedRow)
            {
                moveFocusSpecificPosition(nextRow, privateObject.currentColumn)

                return true
            }

            return false
        }

        function moveFocusUp()
        {
            var previousRow = privateObject.findCurrentColumnsPreviousRow(false, false)

            if (previousRow !== FocusGroupDefine.undefinedRow)
            {
                moveFocusSpecificPosition(previousRow, privateObject.currentColumn)

                return true
            }

            return false
        }

        function findNextIndexItemMatrix()
        {
            var currentItem = getCurrentItem()
            var currentIndex = privateObject.items.indexOf(currentItem)

            var array = privateObject.items
            var length = array.length;
            var nextItem

            for (var i = currentIndex + 1 ; i < length ; ++i) {
                if (i in array) {
                    nextItem = array[i];

                    if (nextItem.enabled)
                    {
                        var nextRow = privateObject.itemInfo[i][0]
                        var nextColumn = privateObject.itemInfo[i][1]

                        return [nextRow, nextColumn]
                    }
                }
            }

            return undefined
        }

        function findPreviousIndexItemMatrix()
        {
            var currentItem = getCurrentItem()
            var currentIndex = privateObject.items.indexOf(currentItem)

            var array = privateObject.items
            var length = array.length;
            var nextItem

            for (var i = currentIndex - 1 ; i >= 0 ; --i) {
                if (i in array) {
                    nextItem = array[i];

                    if (nextItem.enabled)
                    {
                        var nextRow = privateObject.itemInfo[i][0]
                        var nextColumn = privateObject.itemInfo[i][1]

                        return [nextRow, nextColumn]
                    }
                }
            }

            return undefined
        }

        function checkItemExist(row, column)
        {
            if (privateObject.itemArray[row] !== undefined)
            {
                if (privateObject.itemArray[row][column] !== undefined)
                {
                    return true
                }
                else
                {
                    console.log("checkItemExist(row, column): Undefined Column")
                    return false
                }
            }
            else
            {
                console.log("checkItemExist(row, column): Undefined Row")
                return false
            }
        }

        function findNextRowsNextColumn(availableJumpDiagonal, availableJumpDisabled)
        {
            var currentRow = privateObject.rows.indexOf(privateObject.currentRow)
            var currentColumn = privateObject.columns.indexOf(privateObject.currentColumn)

            var nextRow
            var nextColumn

            while ((nextRow = privateObject.rows[++currentRow]) !== undefined
                   && (nextColumn = privateObject.columns[++currentColumn]) !== undefined)
            {
                if (privateObject.itemArray[nextRow][nextColumn] !== undefined
                    && privateObject.itemArray[nextRow][nextColumn].enabled)
                    return [nextRow, nextColumn]
                else if (privateObject.itemArray[nextRow][nextColumn] === undefined && !availableJumpDiagonal)
                    return undefined
                else if (privateObject.itemArray[nextRow][nextColumn] !== undefined && !availableJumpDisabled)
                    return undefined
            }

            return undefined
        }

        function findNextRowsPreviousColumn(availableJumpDiagonal, availableJumpDisabled)
        {
            var currentRow = privateObject.rows.indexOf(privateObject.currentRow)
            var currentColumn = privateObject.columns.indexOf(privateObject.currentColumn)

            var nextRow
            var nextColumn

            while ((nextRow = privateObject.rows[++currentRow]) !== undefined
                   && (nextColumn = privateObject.columns[--currentColumn]) !== undefined)
            {
                if (privateObject.itemArray[nextRow][nextColumn] !== undefined
                    && privateObject.itemArray[nextRow][nextColumn].enabled)
                    return [nextRow, nextColumn]
                else if (privateObject.itemArray[nextRow][nextColumn] === undefined && !availableJumpDiagonal)
                    return undefined
                else if (privateObject.itemArray[nextRow][nextColumn] !== undefined && !availableJumpDisabled)
                    return undefined
            }

            return undefined
        }

        function findPreviousRowsNextColumn(availableJumpDiagonal, availableJumpDisabled)
        {
            var currentRow = privateObject.rows.indexOf(privateObject.currentRow)
            var currentColumn = privateObject.columns.indexOf(privateObject.currentColumn)

            var nextRow
            var nextColumn

            while ((nextRow = privateObject.rows[--currentRow]) !== undefined
                   && (nextColumn = privateObject.columns[++currentColumn]) !== undefined)
            {
                if (privateObject.itemArray[nextRow][nextColumn] !== undefined
                    && privateObject.itemArray[nextRow][nextColumn].enabled)
                    return [nextRow, nextColumn]
                else if (privateObject.itemArray[nextRow][nextColumn] === undefined && !availableJumpDiagonal)
                    return undefined
                else if (privateObject.itemArray[nextRow][nextColumn] !== undefined && !availableJumpDisabled)
                    return undefined
            }

            return undefined
        }

        function findPreviousRowsPreviousColumn(availableJumpDiagonal, availableJumpDisabled)
        {
            var currentRow = privateObject.rows.indexOf(privateObject.currentRow)
            var currentColumn = privateObject.columns.indexOf(privateObject.currentColumn)

            var nextRow
            var nextColumn

            while ((nextRow = privateObject.rows[--currentRow]) !== undefined
                   && (nextColumn = privateObject.columns[--currentColumn]) !== undefined)
            {
                if (privateObject.itemArray[nextRow][nextColumn] !== undefined
                    && privateObject.itemArray[nextRow][nextColumn].enabled)
                    return [nextRow, nextColumn]
                else if (privateObject.itemArray[nextRow][nextColumn] === undefined && !availableJumpDiagonal)
                    return undefined
                else if (privateObject.itemArray[nextRow][nextColumn] !== undefined && !availableJumpDisabled)
                    return undefined
            }

            return undefined
        }

        function findCurrentRowsNextColumn(availableJumpColumn, availableJumpDisabled)
        {
            var skippedColumnCount = 0

//            if (privateObject.findLastEnabledColumn(privateObject.currentRow)
//                    === privateObject.findNextColumn(privateObject.currentRow))
            if (privateObject.findLastEnabledColumn(privateObject.currentRow) === FocusGroupDefine.undefinedColumn)
                return FocusGroupDefine.undefinedColumn

            if (privateObject.findLastEnabledColumn(privateObject.currentRow) === privateObject.currentColumn)
            {
                return FocusGroupDefine.undefinedColumn
            }

            if (privateObject.currentColumn >= privateObject.rowsLastColumn[privateObject.currentRow])
                return FocusGroupDefine.undefinedColumn

//            if (privateObject.isLastColumn(privateObject.currentRow, privateObject.currentColumn + 1) && !privateObject.itemArray[privateObject.currentRow][currentColumn + 1].enabled)
//                return -1

            for (var i = privateObject.currentColumn + 1 ; i <= privateObject.rowsLastColumn[privateObject.currentRow] ; i++)
            {
                if (privateObject.itemArray[privateObject.currentRow][i] !== undefined
                        && privateObject.itemArray[privateObject.currentRow][i].enabled)
                    break
                else if (privateObject.itemArray[privateObject.currentRow][i] === undefined && availableJumpColumn)
                {
                    continue
                }
                else if (privateObject.itemArray[privateObject.currentRow][i] === undefined && !availableJumpColumn)
                {
                    return FocusGroupDefine.undefinedColumn
                }
                else if (!privateObject.itemArray[privateObject.currentRow][i].enabled && availableJumpDisabled)
                {
                    skippedColumnCount++
                    continue
                }
                else if (!privateObject.itemArray[privateObject.currentRow][i].enabled && !availableJumpDisabled)
                {
                    return FocusGroupDefine.undefinedColumn
                }
                else
                {
                    return FocusGroupDefine.undefinedColumn
                    //break
                    //console.log("findCurrentRowsNextColumn(availableJumpColumn, availableJumpDisabled): Unexpected flow")

                }
            }

            if (i - privateObject.currentColumn - skippedColumnCount == 1)
            {
                return i
            }
            else if (i - privateObject.currentColumn - skippedColumnCount > 1)
            {
                if (availableJumpColumn)
                    return i
                else
                    return FocusGroupDefine.undefinedColumn
            }
        }

        function findCurrentRowsPreviousColumn(availableJumpColumn, availableJumpDisabled)
        {
            var skippedColumnCount = 0

            if (privateObject.findFirstEnabledColumn(privateObject.currentRow) === FocusGroupDefine.undefinedColumn)
                return FocusGroupDefine.undefinedColumn

            if (privateObject.findFirstEnabledColumn(privateObject.currentRow) === privateObject.currentColumn)
                return FocusGroupDefine.undefinedColumn

            if (privateObject.currentColumn <= privateObject.rowsFirstColumn[privateObject.currentRow])
                return FocusGroupDefine.undefinedColumn

//            if (privateObject.isLastColumn(privateObject.currentRow, privateObject.currentColumn - 1) && !privateObject.itemArray[privateObject.currentRow][privateObject.currentColumn - 1].enabled)
//                return -1

            for (var i = privateObject.currentColumn - 1 ; i >= privateObject.rowsFirstColumn[privateObject.currentRow] ; i--)
            {
                if (privateObject.itemArray[privateObject.currentRow][i] !== undefined
                        && privateObject.itemArray[privateObject.currentRow][i].enabled)
                    break
                else if (privateObject.itemArray[privateObject.currentRow][i] === undefined && availableJumpColumn)
                {
                    continue
                }
                else if (privateObject.itemArray[privateObject.currentRow][i] === undefined && !availableJumpColumn)
                {
                    return FocusGroupDefine.undefinedColumn
                }
                else if (!privateObject.itemArray[privateObject.currentRow][i].enabled && availableJumpDisabled)
                {
                    skippedColumnCount++
                    continue
                }
                else if (!privateObject.itemArray[privateObject.currentRow][i].enabled && !availableJumpDisabled)
                {
                    return FocusGroupDefine.undefinedColumn
                }
                else
                {
                    return FocusGroupDefine.undefinedColumn
                    //break
                    //console.log("findCurrentRowsPreviousColumn(availableJumpColumn, availableJumpDisabled): Unexpected flow")

                }
            }

            if (privateObject.currentColumn - i - skippedColumnCount == 1)
            {
                return i
            }
            else if (privateObject.currentColumn - i - skippedColumnCount > 1)
            {
                if (availableJumpColumn)
                    return i
                else
                    return FocusGroupDefine.undefinedColumn
            }
        }

        function findCurrentColumnsNextRow(availableJumpRow, availableJumpDisabled)
        {
            var skippedRowCount = 0

            if (privateObject.findLastEnabledRow(privateObject.currentColumn) === privateObject.currentRow)
                return FocusGroupDefine.undefinedRow

            if (privateObject.currentRow >= privateObject.columnsLastRow[privateObject.currentColumn])
                return FocusGroupDefine.undefinedRow

            if (privateObject.isLastRow(privateObject.currentRow + 1, privateObject.currentColumn) && !privateObject.itemArray[privateObject.currentRow + 1][privateObject.currentColumn].enabled)
                return FocusGroupDefine.undefinedRow


            for (var i = privateObject.currentRow + 1 ; i <= privateObject.columnsLastRow[privateObject.currentColumn] ; i++)
            {
                if (privateObject.itemArray[i][privateObject.currentColumn] !== undefined
                        && privateObject.itemArray[i][privateObject.currentColumn].enabled)
                    break
                else if (privateObject.itemArray[i][privateObject.currentColumn] === undefined && availableJumpRow)
                {
                    continue
                }
                else if (privateObject.itemArray[i][privateObject.currentColumn] === undefined && !availableJumpRow)
                {
                    return FocusGroupDefine.undefinedColumn
                }
                else if (!privateObject.itemArray[i][privateObject.currentColumn].enabled && availableJumpDisabled)
                {
                    skippedRowCount++
                    continue
                }
                else if (!privateObject.itemArray[i][privateObject.currentColumn].enabled && !availableJumpDisabled)
                {
                    return FocusGroupDefine.undefinedColumn
                }
                else
                {
                    return FocusGroupDefine.undefinedColumn
                    //break
                    //console.log("findCurrentColumnsNextRow(availableJumpRow, availableJumpDisabled): Unexpected flow")

                }
            }

            if (i - privateObject.currentRow - skippedRowCount == 1)
            {
                return i
            }
            else if (i - privateObject.currentRow - skippedRowCount > 1)
            {
                if (availableJumpRow)
                    return i
                else
                    return FocusGroupDefine.undefinedRow
            }
        }

        function findCurrentColumnsPreviousRow(availableJumpRow, availableJumpDisabled)
        {
            var skippedRowCount = 0

            if (privateObject.findFirstEnabledRow(privateObject.currentColumn) === privateObject.currentRow)
                return FocusGroupDefine.undefinedRow

            if (privateObject.currentRow <= privateObject.columnsFirstRow[privateObject.currentColumn])
                return FocusGroupDefine.undefinedRow

            if (privateObject.isLastRow(privateObject.currentRow - 1, privateObject.currentColumn) && !privateObject.itemArray[privateObject.currentRow - 1][privateObject.currentColumn].enabled)
                return FocusGroupDefine.undefinedRow

            for (var i = privateObject.currentRow - 1 ; i >= privateObject.columnsFirstRow[privateObject.currentColumn] ; i--)
            {
                if (privateObject.itemArray[i][privateObject.currentColumn] !== undefined
                        && privateObject.itemArray[i][privateObject.currentColumn].enabled)
                    break
                else if (privateObject.itemArray[i][privateObject.currentColumn] === undefined && availableJumpRow)
                {
                    continue
                }
                else if (privateObject.itemArray[i][privateObject.currentColumn] === undefined && !availableJumpRow)
                {
                    return FocusGroupDefine.undefinedColumn
                }
                else if (!privateObject.itemArray[i][privateObject.currentColumn].enabled && availableJumpDisabled)
                {
                    skippedRowCount++
                    continue
                }
                else if (!privateObject.itemArray[i][privateObject.currentColumn].enabled && !availableJumpDisabled)
                {
                    return FocusGroupDefine.undefinedColumn
                }
                else
                {
                    return FocusGroupDefine.undefinedColumn
                    //break
                    //console.log("findCurrentColumnsPreviousRow(availableJumpRow, availableJumpDisabled): Unexpected flow")

                }
            }

            if (privateObject.currentRow - i - skippedRowCount == 1)
            {
                return i
            }
            else if (privateObject.currentRow - i - skippedRowCount > 1)
            {
                if (availableJumpRow)
                    return i
                else
                    return FocusGroupDefine.undefinedRow
            }
        }

        function isFirstColumn(row, column)
        {
            if (column === privateObject.rowsFirstColumn[row])
                return true
            else
                return false
        }

        function isLastColumn(row, column)
        {
            if (column === privateObject.rowsLastColumn[row])
            {
                return true
            }
            else
            {
                return false
            }
        }

        function isFirstRow(row, column)
        {
            if (row === privateObject.columnsFirstRow[column])
                return true
            else
                return false
        }

        function isLastRow(row, column)
        {
            if (row === privateObject.columnsLastRow[column])
                return true
            else
                return false
        }

        function findFirstEnabledRow(column)
        {
            var itemCount = 0
            var i = privateObject.columnsFirstRow[column]

            while (itemCount < privateObject.columnsRowCount[column])
            {
                if (privateObject.itemArray[i][column] !== undefined)
                {
                    itemCount++

                    if (privateObject.itemArray[i][column].enabled)
                    {
                        return i
                    }
                    else
                    {
                        i++
                    }
                }
                else
                {
                    i++
                }
            }

            return FocusGroupDefine.undefinedRow
        }

        function findLastEnabledRow(column)
        {
            var itemCount = 0
            var i = privateObject.columnsLastRow[column]

            while (itemCount < privateObject.columnsRowCount[column])
            {
                if (privateObject.itemArray[i][column] !== undefined)
                {
                    itemCount++

                    if (privateObject.itemArray[i][column].enabled)
                    {
                        return i
                    }
                    else
                    {
                        i--
                    }
                }
                else
                {
                    i--
                }
            }

            return FocusGroupDefine.undefinedRow
        }

        function findFirstEnabledColumn(row)
        {
            var itemCount = 0
            var i = privateObject.rowsFirstColumn[row]

            while (itemCount < privateObject.rowsColumnCount[row])
            {
                if (privateObject.itemArray[row][i] !== undefined)
                {
                    itemCount++

                    if (privateObject.itemArray[row][i].enabled)
                    {
                        return i
                    }
                    else
                    {
                        i++
                    }
                }
                else
                {
                    i++
                }
            }

            return FocusGroupDefine.undefinedColumn
        }

        function findLastEnabledColumn(row)
        {
            var itemCount = 0
            var i = privateObject.rowsLastColumn[row]

            while (itemCount < privateObject.rowsColumnCount[row])
            {
                if (privateObject.itemArray[row][i] !== undefined)
                {
                    itemCount++

                    if (privateObject.itemArray[row][i].enabled)
                    {
                        return i
                    }
                    else
                    {
                        i--
                    }
                }
                else
                {
                    i--
                }
            }

            return FocusGroupDefine.undefinedColumn
        }

        function registerItem(item, row, column)
        {
            if (item === null || undefined
                    || item.myFocus === undefined
                    || item.objectName === undefined)
            {
                return false
                //console.log("item is null")
            }
            else
            {
                //console.log(item.objectName)

                if (privateObject.items.indexOf(item) !== FocusGroupDefine.undefinedIndex)
                {
                    console.log("registerItem(item, row, column): ", item,"An item with the same object name is already registered.!")
                    return false
                }

                if (privateObject.itemObjectName.indexOf(item.objectName) !== FocusGroupDefine.undefinedIndex)
                {
                    console.log("registerItem(item, row, column): ", item.objectName, "same object name item is already added!")
                    return false
                }

                if (privateObject.rows[row] === undefined)
                {
                    privateObject.rows.push(row)
                    privateObject.rows.sort()
                    console.log("rows: ", privateObject.rows)
                }

                if (privateObject.columns[column] === undefined)
                {
                    privateObject.columns.push(column)
                    privateObject.columns.sort()
                    console.log("columns: ", privateObject.columns)
                }

                if (privateObject.itemArray[row] === undefined)
                {
                    privateObject.itemArray[row] = []//new Array
                    //console.log("new Array")
                }

                if (privateObject.itemArray[row][column] === undefined)
                {
                    privateObject.items.push(item)
                    privateObject.itemObjectName.push(item.objectName)
                    privateObject.itemArray[row][column] = item
                    privateObject.itemInfo[itemCount] = [row, column]

                    privateObject.itemCount++

                    //console.log("name:: ", privateObject.items[privateObject.itemCount - 1][0])

                    if (privateObject.rowsColumnCount[row] === undefined)
                        privateObject.rowsColumnCount[row] = 1
                    else
                        privateObject.rowsColumnCount[row] = privateObject.rowsColumnCount[row] + 1

                    if (privateObject.columnsRowCount[column] === undefined)
                        privateObject.columnsRowCount[column] = 1
                    else
                        privateObject.columnsRowCount[column] = privateObject.columnsRowCount[column] + 1

                    if (privateObject.rowsFirstColumn[row] === undefined
                            && privateObject.rowsLastColumn[row] === undefined)
                    {
                        privateObject.rowsFirstColumn[row] = column
                        privateObject.rowsLastColumn[row] = column
                    }
                    else
                    {
                        if (column > privateObject.rowsLastColumn[row])
                            privateObject.rowsLastColumn[row] = column

                        if (column < privateObject.rowsFirstColumn[row])
                            privateObject.rowsFirstColumn[row] = column
                    }

                    if (privateObject.columnsFirstRow[column] === undefined
                            && privateObject.columnsLastRow[column] === undefined)
                    {
                        privateObject.columnsFirstRow[column] = row
                        privateObject.columnsLastRow[column] = row
                    }
                    else
                    {
                        if (row > privateObject.columnsLastRow[column])
                            privateObject.columnsLastRow[column] = row

                        if (row < privateObject.columnsFirstRow[column])
                            privateObject.columnsFirstRow[column] = row
                    }

                    if ( (row === focusGroup.defaultRow
                          && column === focusGroup.defaultColumn)
                          && focusGroup.focusedGroup
                          && privateObject.itemArray[row][column].enabled )
                    {
                        currentItemConnections.target = privateObject.itemArray[row][column]
                        privateObject.itemArray[row][column].myFocus = true
                    }
                    else if ( (row === focusGroup.defaultRow
                          && column === focusGroup.defaultColumn)
                          && !focusGroup.focusedGroup
                          && privateObject.itemArray[row][column].enabled )
                    {
                        currentItemConnections.target = privateObject.itemArray[row][column]
                        privateObject.itemArray[row][column].myFocus = false
                    }
                    else
                        privateObject.itemArray[row][column].myFocus = false

//                    if (privateObject.itemArray[row][column].enabled)
//                        privateObject.enabledItemCount++

                    return true
                }
                else
                {
                    console.log("registerItem(item, row, column)", "already have an item in that row and column.")
                    return false
                }
            }
        }

        function moveFocusByItemDisabled()
        {
            console.log("moveFocusByItemDisabled(), currentRow: ", privateObject.currentRow)
            console.log("moveFocusByItemDisabled(), currentColumn: ", privateObject.currentColumn)

            var currentRow = privateObject.currentRow
            var currentRowIndex// = privateObject.rows.indexOf(currentRow)

            var nextRow
            var nextColumn

            var focusMoved = privateObject.moveFocusLeft()

            if (!focusMoved)
                focusMoved = privateObject.moveFocusRight()

            if (!focusMoved)
                focusMoved = privateObject.moveFocusUp()

            if (!focusMoved)
                focusMoved = privateObject.moveFocusDown()

            if (!focusMoved)
                focusMoved = privateObject.moveFocusUpRight()

            if (!focusMoved)
                focusMoved = privateObject.moveFocusUpLeft()

            if (!focusMoved)
                focusMoved = privateObject.moveFocusDownLeft()

            if (!focusMoved)
                focusMoved = privateObject.moveFocusDownRight()

            if (focusMoved)
                return true

            nextColumn = privateObject.findLastEnabledColumn(currentRow)

            if (nextColumn !== FocusGroupDefine.undefinedColumn)
            {
                moveFocusSpecificPosition(privateObject.currentRow, nextColumn)
                return true
            }

            currentRowIndex = privateObject.rows.indexOf(currentRow)
            nextRow = privateObject.rows[--currentRowIndex]

            while (nextRow !== undefined &&
                   nextRow >= privateObject.rows[nextRow])
            {
                nextColumn = privateObject.findFirstEnabledColumn(nextRow)

                if (nextColumn !== FocusGroupDefine.undefinedColumn)
                {
                    moveFocusSpecificPosition(nextRow, nextColumn)
                    return true
                }
                else
                    nextRow = privateObject.rows[--currentRowIndex]
            }

            currentRowIndex = privateObject.rows.indexOf(currentRow)
            nextRow = privateObject.rows[++currentRowIndex]

            while (nextRow !== undefined &&
                   nextRow >= privateObject.rows[nextRow])
            {
                nextColumn = privateObject.findFirstEnabledColumn(nextRow)

                if (nextColumn !== FocusGroupDefine.undefinedColumn)
                {
                    moveFocusSpecificPosition(nextRow, nextColumn)
                    return true
                }
                else
                    nextRow = privateObject.rows[--currentRowIndex]
            }

            if (nextColumn === undefined)
            {
                privateObject.itemArray[privateObject.currentRow][privateObject.currentColumn].myFocus = false
                privateObject.currentColumn = FocusGroupDefine.undefinedColumn
                privateObject.currentRow = FocusGroupDefine.undefinedRow
                currentItemConnections.target = ""
            }

            return false
        }
    }

    Connections {
        id: currentItemConnections

        onEnabledChanged: {
            if (availableGUICPolicy)
            {
                if (!currentItemConnections.target.enabled)
                {
                    privateObject.moveFocusByItemDisabled()
//                    privateObject.enabledItemCount--
                }
//                else
//                {
//                    privateObject.enabledItemCount++
//                }
            }
            else
            {
                currentFocusedItemDisabled(privateObject.currentRow, privateObject.currentColumn)
            }
        }
    }

    Component.onCompleted: {
        //moveFocusPreviousRowPreviousColumn()
    }
}

pragma Singleton
import QtQuick 2.0
import IVIS.Component 1.0

QtObject {
    id: focusGroupManager
    objectName: "FocusGroupManager"

    signal focusGroupRegistered()

    function getCurrentFocusGroup()
    {
        if (privateObject.currentGroup !== undefined)
            return privateObject.currentGroup
        else
        {
            console.log("getCurrentFocusGroup(): currentFocusGroup is undefined")
            return undefined
        }
    }

    function unregisterFocusGroupByID(groupID)
    {
        var focusGroupIDIndex = privateObject.focusGroupID.indexOf(groupID)
        var focusGroupObjectIndex = privateObject.focusGroupObjectName.indexOf(groupID.objectName)

        if (    focusGroupIDIndex !== FocusGroupDefine.undefinedIndex
            &&  focusGroupObjectIndex !== FocusGroupDefine.undefinedIndex)
        {
            var focusedGroup = findFocusGroupByID(groupID)

            if (focusedGroup === privateObject.currentGroup)
                privateObject.currentGroup = undefined

            privateObject.focusGroupID[focusGroupIDIndex] = undefined
            privateObject.focusGroupObjectName[focusGroupIDIndex] = undefined
        }
    }

    function unregisterFocusGroupByObjectName(groupObjectName)
    {
        var focusGroupObjectIndex = privateObject.focusGroupObjectName.indexOf(groupObjectName)
        var focusGroup = privateObject.focusGroupID[focusGroupObjectIndex]

        if (    focusGroup !== undefined
            &&  focusGroupObjectIndex !== FocusGroupDefine.undefinedIndex   )
        {
            var focusedGroup = findFocusGroupByObjectName(groupObjectName)

            if (focusedGroup === privateObject.currentGroup)
                privateObject.currentGroup = undefined

            privateObject.focusGroupID[focusGroupObjectIndex] = undefined
            privateObject.focusGroupObjectName[focusGroupObjectIndex] = undefined
        }
    }

    function registerFocusGroup(groupID)
    {
        var focusGroupIDIndex = privateObject.focusGroupID.indexOf(groupID)
        var focusGroupObjectIndex = privateObject.focusGroupObjectName.indexOf(groupID.objectName)

        if (    focusGroupIDIndex === FocusGroupDefine.undefinedIndex
            &&  focusGroupObjectIndex === FocusGroupDefine.undefinedIndex)
        {
            privateObject.focusGroupID.push(groupID)
            privateObject.focusGroupObjectName.push(groupID.objectName)

            focusGroupManager.focusGroupRegistered()

//            if (privateObject.focusGroupID.length == 1)
//                privateObject.currentGroup = groupID

            console.log("focusGroupID: ", groupID, " is registered")
        }
        else if (    focusGroupIDIndex !== FocusGroupDefine.undefinedIndex
                 &&  focusGroupObjectIndex === FocusGroupDefine.undefinedIndex  )
        {
            console.log("focusGroupID: ", groupID, " is already registered")
        }
        else if (    focusGroupIDIndex === FocusGroupDefine.undefinedIndex
                 &&  focusGroupObjectIndex !== FocusGroupDefine.undefinedIndex  )
        {
            console.log("focusGroupID.objectName: ", groupID.objectName, " is already registered")
        }
        else
        {
            console.log("focusGroupID: ", groupID, " is already registered")
            console.log("focusGroupID.objectName: ", groupID.objectName, " is already registered")
        }
    }

    function findFocusGroupByID(groupID)
    {
        var focusGroupIndex = privateObject.focusGroupID.indexOf(groupID)

        if (focusGroupIndex !== FocusGroupDefine.undefinedIndex)
            return privateObject.focusGroupID[focusGroupIndex]
        else
        {
            console.log(privateObject.focusGroupID, " is not registered")
            return undefined
        }
    }

    function findFocusGroupByObjectName(groupObjectName)
    {
        var focusGroupIndex = privateObject.focusGroupObjectName.indexOf(groupObjectName)

        if (focusGroupIndex !== FocusGroupDefine.undefinedIndex)
            return privateObject.focusGroupID[focusGroupIndex]
        else
        {
            console.log(privateObject.focusGroupObjectName, " is not registered")
            return undefined
        }
    }

    function moveGroupFocusByObjectName(focusGroupObjectName)
    {
        var nextFocusedGroup = findFocusGroupByObjectName(focusGroupObjectName)

        if (privateObject.currentGroup !== undefined)
            privateObject.currentGroup.focusedGroup = false

        if (nextFocusedGroup !== undefined)
            nextFocusedGroup.focusedGroup = true

        privateObject.currentGroup = nextFocusedGroup
    }

    function moveGroupFocusByID(focusGroupID)
    {
        var nextFocusedGroup = findFocusGroupByID(focusGroupID)

        if (nextFocusedGroup !== undefined)
            nextFocusedGroup.focusedGroup = true

        if (privateObject.currentGroup !== undefined)
            privateObject.currentGroup.focusedGroup = false

        privateObject.currentGroup = nextFocusedGroup
    }

    function moveFocusToRightGroup()
    {
        var focusGroupIndex = privateObject.focusGroupID.indexOf(privateObject.currentGroup)

        if (privateObject.focusGroupRightSide[focusGroupIndex] !== undefined)
        {
            privateObject.focusGroupRightSide[focusGroupIndex].focusedGroup = true
            privateObject.currentGroup.focusedGroup = false
            privateObject.currentGroup = privateObject.focusGroupRightSide[focusGroupIndex]
        }
        else
            console.log("right side not exist")
    }

    function moveFocusToLeftGroup()
    {
        var focusGroupIndex = privateObject.focusGroupID.indexOf(privateObject.currentGroup)

        if (privateObject.focusGroupLeftSide[focusGroupIndex] !== undefined)
        {
            privateObject.focusGroupLeftSide[focusGroupIndex].focusedGroup = true
            privateObject.currentGroup.focusedGroup = false
            privateObject.currentGroup = privateObject.focusGroupLeftSide[focusGroupIndex]
        }
        else
            console.log("left side not exist")
    }

    function moveFocusToTopGroup()
    {
        var focusGroupIndex = privateObject.focusGroupID.indexOf(privateObject.currentGroup)

        if (privateObject.focusGroupTopSide[focusGroupIndex] !== undefined)
        {
            privateObject.focusGroupTopSide[focusGroupIndex].focusedGroup = true
            privateObject.currentGroup.focusedGroup = false
            privateObject.currentGroup = privateObject.focusGroupTopSide[focusGroupIndex]
        }
        else
            console.log("top side not exist")
    }

    function moveFocusToBottomGroup()
    {
        var focusGroupIndex = privateObject.focusGroupID.indexOf(privateObject.currentGroup)

        if (privateObject.focusGroupBottomSide[focusGroupIndex] !== undefined)
        {
            privateObject.focusGroupBottomSide[focusGroupIndex].focusedGroup = true
            privateObject.currentGroup.focusedGroup = false
            privateObject.currentGroup = privateObject.focusGroupBottomSide[focusGroupIndex]
        }
        else
            console.log("bottom side not exist")
    }

    function registerGroupSide(sourceGroupObjectName, direction, destGroupObjectName)
    {
        var sourceGroupIndex = privateObject.focusGroupObjectName.indexOf(sourceGroupObjectName)
        var destGroupIndex = privateObject.focusGroupObjectName.indexOf(destGroupObjectName)

        if (sourceGroupIndex !== FocusGroupDefine.undefinedIndex
            && destGroupIndex !== FocusGroupDefine.undefinedIndex)
        {
            switch (direction)
            {
            case FocusGroupDefine.topDirection:
                privateObject.focusGroupTopSide[sourceGroupIndex] = findFocusGroupByObjectName(destGroupObjectName)
                break
            case FocusGroupDefine.bottomDirection:
                privateObject.focusGroupBottomSide[sourceGroupIndex] = findFocusGroupByObjectName(destGroupObjectName)
                break
            case FocusGroupDefine.leftDirection:
                privateObject.focusGroupLeftSide[sourceGroupIndex] = findFocusGroupByObjectName(destGroupObjectName)
                break
            case FocusGroupDefine.rightDirection:
                privateObject.focusGroupRightSide[sourceGroupIndex] = findFocusGroupByObjectName(destGroupObjectName)
                break
            default:
                console.log("direction: ", direction, "is invalid value")
            }

            return true
        }

        if (sourceGroupIndex === FocusGroupDefine.undefinedIndex)
            console.log("registerGroupSide:", sourceGroupObjectName, "is not registered.")

        if (destGroupIndex === FocusGroupDefine.undefinedIndex)
            console.log("registerGroupSide: ", destGroupObjectName, "is not registered.")

        return false
    }

//    function registerLeftSide(sourceGroupObjectName, destGroupObjectName)
//    {
//        var sourceGroupIndex = privateObject.focusGroupObjectName.indexOf(sourceGroupObjectName)

//        focusGroupLeftSide[sourceGroupIndex] = findFocusGroupByObjectName(destGroupObjectName)
//    }

//    function registerRightSide(sourceGroupObjectName, destGroupObjectName)
//    {
//        var sourceGroupIndex = privateObject.focusGroupObjectName.indexOf(sourceGroupObjectName)

//        privateObject.focusGroupRightSide[sourceGroupIndex] = findFocusGroupByObjectName(destGroupObjectName)
//    }

//    function registerTopSide(sourceGroupObjectName, destGroupObjectName)
//    {
//        var sourceGroupIndex = privateObject.focusGroupObjectName.indexOf(sourceGroupObjectName)
//        var destGroupIndex = privateObject.focusGroupObjectName.indexOf(destGroupObjectName)

//        if (sourceGroupIndex === -1)
//            console.log(sourceGroupObjectName, "is not registered.")
//        else if (destGroupIndex === -1)
//            console.log(destGroupObjectName, "is not registered.")
//        else
//        {
//            privateObject.focusGroupTopSide[sourceGroupIndex] = findFocusGroupByObjectName(destGroupObjectName)
//            return true
//        }

//        return false
//    }

//    function registerBottomSide(sourceGroupObjectName, destGroupObjectName)
//    {
//        var sourceGroupIndex = privateObject.focusGroupObjectName.indexOf(sourceGroupObjectName)
//        var destGroupIndex = privateObject.focusGroupObjectName.indexOf(destGroupObjectName)

//        if (sourceGroupIndex === FocusGroupDefine.undefinedIndex)
//            console.log(sourceGroupObjectName, "is not registered.")
//        else if (destGroupIndex === FocusGroupDefine.undefinedIndex)
//            console.log(destGroupObjectName, "is not registered.")
//        else
//        {
//            focusGroupBottomSide[sourceGroupIndex] = findFocusGroupByObjectName(destGroupObjectName)
//            return true
//        }

//        return false
//    }

    property QtObject private_object:QtObject{
        id: privateObject

        property var focusGroupID: []
        property var focusGroupObjectName: []

        property var focusGroupLeftSide: []
        property var focusGroupRightSide: []
        property var focusGroupTopSide: []
        property var focusGroupBottomSide: []

        property var currentGroup
    }
}

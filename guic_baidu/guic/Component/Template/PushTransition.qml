import QtQuick 2.0

StackViewTransition {
    PropertyAnimation {
        target: stackView.enterItem
        property: (stackView.orientation === Qt.Horizontal) ? "x" : "y"
        from: (stackView.orientation === Qt.Horizontal) ? ((stackView.direction === Qt.LeftToRight) ?
                                                    stackView.enterItem.x - stackView.animStartPos
                                                  : stackView.enterItem.x + stackView.animStartPos)
                                              : (stackView.enterItem.y + stackView.animStartPos)
        to: (stackView.orientation === Qt.Horizontal) ? stackView.enterItem.x : stackView.enterItem.y
        duration: 300
    }
    PropertyAnimation {
        target: stackView.enterItem
        property: "opacity"
        from: 0
        to: 1
        duration: 300
    }
}

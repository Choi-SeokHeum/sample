import QtQuick 2.0

StackViewTransition {
    PropertyAnimation {
        target: stackView.exitItem
        property: (stackView.orientation === Qt.Horizontal) ? "x" : "y"
        from: (stackView.orientation === Qt.Horizontal) ? stackView.exitItem.x : stackView.exitItem.y
        to: (stackView.orientation === Qt.Horizontal) ?
                  ((stackView.direction === Qt.LeftToRight) ? stackView.exitItem.x - stackView.animStartPos
                                                  : stackView.exitItem.x + stackView.animStartPos)
                : (stackView.exitItem.y + stackView.animStartPos)
        duration: 300
    }
    PropertyAnimation {
        target: stackView.exitItem
        property: "opacity"
        from: 1
        to: 0
        duration: 300
    }
}

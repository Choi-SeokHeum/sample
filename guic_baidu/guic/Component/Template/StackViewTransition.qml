import QtQuick 2.0

ParallelAnimation {
    signal animationStarted()
    signal animationStopped()

    onRunningChanged: {
        if (running)
            animationStarted()
        else
            animationStopped()
    }
}

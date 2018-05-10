import QtQuick 2.3

Rectangle {
    id: page
    width: 320; height: 480
    color: "lightgray"
    
    Rectangle {
        id: textWrapper
        color: "lightgray"
        anchors.centerIn: page
        width: helloText.width + 16
        height: helloText.height + 16
        border.width: 2
        border.color: "black"

        Text {
            id: helloText
            anchors.centerIn: parent
            font.pointSize: 24; font.bold: true
            Component.onCompleted: {
                text = new Date().toLocaleTimeString(Qt.locale(), "hh:mm:ss A")
                updateTimer.running = true
            }
        }
    }

    Timer {
        id: updateTimer
        interval: 1000; repeat: true;
        onTriggered: helloText.text = new Date().toLocaleTimeString(Qt.locale(), "hh:mm:ss A")
    }
}

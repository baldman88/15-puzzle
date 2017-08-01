import QtQuick 2.0

Rectangle {
    id: button
    width: 150
    height: 50
    radius: 10
    color: releasedColor
    border.color: "black"
    border.width: 1
    anchors.horizontalCenter: parent.horizontalCenter

    property string label: ""
    property color pressedColor: "#888888"
    property color releasedColor: "#aaaaaa"

    signal buttonClicked()

    Text {
        id: buttonLabel
        text: label;
        anchors.centerIn: parent
        font.pointSize: 20
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onPressed: {
            button.color = pressedColor
        }
        onReleased: {
            button.color = releasedColor
        }
        onClicked: {
            buttonClicked()
        }
    }
}

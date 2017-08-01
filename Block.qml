import QtQuick 2.0

Rectangle {
    id: rect
    width: 100
    height: 100
    radius: 10
    color: "green"
    border.color: "black"
    border.width: 1
    antialiasing: true
    state: currentPosition

    property int label: 0
    property int currentPosition: 0
    property int animationDuration: 200

    signal buttonClicked()

    Text {
        anchors.centerIn: parent
        text: label
        font.pointSize: 30
    }

    MouseArea {
        id: mouseArea
        onClicked: {
            if ((rect.currentPosition == (emptyField.currentPosition - 1))
                    || (rect.currentPosition == (emptyField.currentPosition + 1))
                    || (rect.currentPosition == (emptyField.currentPosition - 4))
                    || (rect.currentPosition == (emptyField.currentPosition + 4))) {
                var tmp = emptyField.currentPosition
                emptyField.currentPosition = rect.currentPosition
                rect.currentPosition = tmp
                buttonClicked()
            }
        }
        anchors.fill: parent
    }

    states: [
        State {
            name: "0"
            PropertyChanges {
                target: rect
                x: 0
                y: 0
            }
        },

        State {
            name: "1"
            PropertyChanges {
                target: rect
                x: 100
                y: 0
            }
        },

        State {
            name: "2"
            PropertyChanges {
                target: rect
                x: 200
                y: 0
            }
        },

        State {
            name: "3"
            PropertyChanges {
                target: rect
                x: 300
                y: 0
            }
        },

        State {
            name: "4"
            PropertyChanges {
                target: rect
                x: 0
                y: 100
            }
        },

        State {
            name: "5"
            PropertyChanges {
                target: rect
                x: 100
                y: 100
            }
        },

        State {
            name: "6"
            PropertyChanges {
                target: rect
                x: 200
                y: 100
            }
        },

        State {
            name: "7"
            PropertyChanges {
                target: rect
                x: 300
                y: 100
            }
        },

        State {
            name: "8"
            PropertyChanges {
                target: rect
                x: 0
                y: 200
            }
        },

        State {
            name: "9"
            PropertyChanges {
                target: rect
                x: 100
                y: 200
            }
        },

        State {
            name: "10"
            PropertyChanges {
                target: rect
                x: 200
                y: 200
            }
        },

        State {
            name: "11"
            PropertyChanges {
                target: rect
                x: 300
                y: 200
            }
        },

        State {
            name: "12"
            PropertyChanges {
                target: rect
                x: 0
                y: 300
            }
        },

        State {
            name: "13"
            PropertyChanges {
                target: rect
                x: 100
                y: 300
            }
        },

        State {
            name: "14"
            PropertyChanges {
                target: rect
                x: 200
                y: 300
            }
        },

        State {
            name: "15"
            PropertyChanges {
                target: rect
                x: 300
                y: 300
            }
        }
    ]

    transitions: Transition {
        NumberAnimation {
            target: rect
            properties: "x,y"
            duration: animationDuration
            easing.type: Easing.Linear
        }
    }
}

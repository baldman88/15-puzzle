import QtQuick 2.0

Rectangle {
    width: 200
    height: 400
    color: "#452424"

    signal shuffled()

    Column {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 20

        Button {
            id: shuffleButton
            label: "Shuffle"

            onButtonClicked: {
                makeShuffle()
            }
        }

        Button {
            id: exitButton
            label: "Exit"

            onButtonClicked: {
                Qt.quit()
            }
        }
    }

    function makeShuffle() {
        for(var j = (gameField.children[0].children.length - 1); j > 0 ; j--) {
            gameField.children[0].children[j - 1].animationDuration = 0
        }
        for (var i = 0; i < 1000; i++) {
            var shift = 1
            if (Math.round(Math.random()) == 1) {
                shift = 4
            }
            var sign = 1
            if (Math.round(Math.random()) == 1) {
                sign = -1
            }
            var newPosition = emptyField.currentPosition + (shift * sign)
            if ((newPosition >= 0) && (newPosition <= 15)) {
                var tmp = emptyField.currentPosition
                for(j = (gameField.children[0].children.length - 1); j > 0 ; j--) {
                    if (gameField.children[0].children[j - 1].currentPosition == newPosition) {
                        emptyField.currentPosition = gameField.children[0].children[j - 1].currentPosition
                        gameField.children[0].children[j - 1].currentPosition = tmp
                        break
                    }
                }
            }
        }
        for(j = (gameField.children[0].children.length - 1); j > 0 ; j--) {
            gameField.children[0].children[j - 1].animationDuration = 200
        }
        shuffled()
    }
}

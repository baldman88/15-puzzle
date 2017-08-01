import QtQuick 2.0

Rectangle {
    width: 400
    height: 400
    color: "#ffffff"

    Grid {
        id: gameFieldGrid
        rows: 4
        columns: 4

        Repeater {
            model: 15

            Block {
                currentPosition: index
                label: index + 1
                onButtonClicked: checkForCompletion()
            }
        }
    }

    Rectangle {
        id: completePopup
        visible: false
        width: 220
        height: 100
        color: "#ff2222"
        border.width: 3
        radius: 20
        anchors.centerIn: parent

        Text {
            id: completePopupText
            anchors.centerIn: parent
            font.pointSize: 20
            text: "Complete!"
        }
    }

    function checkForCompletion() {
        var result = true
        for(var j = (gameFieldGrid.children.length - 1); j > 0 ; j--) {
            if ((gameFieldGrid.children[j - 1].currentPosition + 1) != gameFieldGrid.children[j - 1].label) {
                result = false
                break
            }
        }
        if (result == true) {
            completePopup.visible = true
        } else {
            completePopup.visible = false
        }
    }

    function onShuffleComplete() {
        completePopup.visible = false
    }

//    function makeShuffle() {
//        for(var j = (gameFieldGrid.children.length - 1); j > 0 ; j--) {
//            gameFieldGrid.children[j - 1].animationDuration = 0
//        }
//        for (var i = 0; i < 1000; i++) {
//            var shift = 1
//            if (Math.round(Math.random()) == 1) {
//                shift = 4
//            }
//            var sign = 1
//            if (Math.round(Math.random()) == 1) {
//                sign = -1
//            }
//            var newPosition = emptyField.currentPosition + (shift * sign)
//            if ((newPosition >= 0) && (newPosition <= 15)) {
//                var tmp = emptyField.currentPosition
//                for(j = (gameFieldGrid.children.length - 1); j > 0 ; j--) {
//                    if (gameFieldGrid.children[j - 1].currentPosition == newPosition) {
//                        emptyField.currentPosition = gameFieldGrid.children[j - 1].currentPosition
//                        gameFieldGrid.children[j - 1].currentPosition = tmp
//                        break
//                    }
//                }
//            }
//        }
//        for(j = (gameFieldGrid.children.length - 1); j > 0 ; j--) {
//            gameFieldGrid.children[j - 1].animationDuration = 200
//        }
//    }
}

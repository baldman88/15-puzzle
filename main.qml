import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3

Window {
    id: window
    visible: true
    width: 600
    height: 400
    title: qsTr("15-Puzzle")

    Item {
        id: emptyField
        property int currentPosition: 15
    }

    Row {
        anchors.fill: parent

        ControlsField {
            id: controlsField
            onShuffleButtonClicked: gameField.makeShuffle()
        }

        GameField {
            id: gameField
        }
    }

    onActiveChanged: gameField.makeShuffle()
}

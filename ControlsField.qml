import QtQuick 2.0

Rectangle {
    width: 200
    height: 400
    color: "#452424"

    signal shuffleButtonClicked()

    Column {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 20

        Button {
            id: shuffleButton
            label: "Shuffle"

            onButtonClicked: {
                shuffleButtonClicked()
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
}

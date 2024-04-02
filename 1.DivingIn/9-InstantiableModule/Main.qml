import QtQuick
import QtQuick.Controls
import movies 1.0

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("8-InstantableObject")


    Movie{
        id: movieId
        title: "Titanic"
        mainCharacter: "Leonardo D"
    }

    Button {
        text: "Invoke created object"
        onClicked: {
            movieId.title = "Fast and Furious"
            movieId.mainCharacter = "Vin Diesel"

            console.log("New " + movieId.title +" , " + movieId.mainCharacter);
        }
    }
}

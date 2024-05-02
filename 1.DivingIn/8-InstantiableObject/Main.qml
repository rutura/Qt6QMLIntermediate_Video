import QtQuick
import QtQuick.Controls
//import InstantiableObject
import guide.learnqt.movie

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Instantiable object")

    //Object created on the QML side
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

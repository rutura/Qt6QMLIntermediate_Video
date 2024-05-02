import QtQuick
import PropertyValueSources

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Property value sources")


    Rectangle{
        id: rectId
        RandomNumber on width {
            maxValue: 600
        }
        height: 300
        color: "dodgerblue"
        RandomNumber on radius{
            maxValue: 300
        }
    }
}

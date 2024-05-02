import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Connections")


    Row{
        spacing: 20
        Rectangle{
            id: redRectId
            width: 100
            height: 100
            color: "red"
            MouseArea{
                id: redRectMouseAreaId
                anchors.fill: parent
            }
        }
        Rectangle{
            id: greenRectId
            width: 100
            height: 100
            color: "green"
            Connections{
                target: redRectMouseAreaId
                function onClicked(){
                    console.log("This is the green rectangle responding")
                }
            }
        }
        Rectangle{
            id: blueRectId
            width: 100
            height: 100
            color: "blue"
            Connections{
                target: redRectMouseAreaId
                function onClicked(){
                    console.log("This is the blue rectangle responding")
                }
            }
        }
    }
}

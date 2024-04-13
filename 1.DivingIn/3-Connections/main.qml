/*

        . Exploring the Connections type :
            . It's used to hijcak signals from other components
            . In this example , green and blue rect are hijacking signals
                from the red rect and handling them.
            . The component you hijack from must possess the signal handled by
                the Connections block.
          . Improvise :
            . In Qt 6 it's advised to explicitly define the handler like so :
                Connections{
                    target: redRectMouseAreaId
                    function onClicked() {
                        console.log("This is blue rect responding")
                    }

                }

  */

import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Connections")

    Row{
            Rectangle{
                id : redRect
                width: 100
                height: 100
                color: "red"

                MouseArea{
                    id : redRectMouseAreaId
                    anchors.fill: parent
                    /*
                    onClicked: {
                        console.log("Clicked in the red rectangle")
                    }
                    */
                }
            }

            Rectangle{
                id : greenRect
                width: 100
                height: 100
                color: "green"

                Connections{
                    target: redRectMouseAreaId
                    function onClicked (){
                        console.log("This is green rect responding")
                    }
                }
            }

            Rectangle{
                id : blueRect
                width: 100
                height: 100
                color: "blue"

                Connections{
                    target: redRectMouseAreaId
                    function onClicked() {
                        console.log("This is blue rect responding")
                    }
                }
            }
        }
}

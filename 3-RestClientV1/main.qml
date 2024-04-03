/*

        . A rest  client that :
            . Downloads data from the C++ side
            . Feeds the data to qml through contextProperties.
            . Everytime the data changes on the C++ side, you have
                to reset the context properties.

        . Break this in 2 steps [Take reference from the Qt 5 course] :
            . Downloading the data in C++
            . Feeding to qml

  */


import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import RestClientV1 1.0

Window {
    id : root
    width: 640
    height: 480
    visible: true
    title: qsTr("Rest Client V1")

       ColumnLayout{
           anchors.fill: parent
           spacing: 0

           ListView{
               id : mListView
               model : myModel
               delegate: Rectangle{

                   width : root.width
                   height: textId.implicitHeight+30
                   color: "beige"
                   border.color: "yellowgreen"
                   radius: 5

                   Text {
                       width : parent.width
                       height: parent.height
                       id : textId
                       anchors.centerIn: parent
                       text : modelData
                       font.pointSize: 13
                       wrapMode: Text.WordWrap
                       verticalAlignment: Text.AlignVCenter
                       horizontalAlignment: Text.AlignHCenter
                   }
               }
               Layout.fillHeight: true
               Layout.fillWidth: true
           }


           Button {
               id : mButton1
               text : "Fetch"
               Layout.fillWidth: true
               onClicked: {
                   Wrapper.fetchPosts()
               }

           }
           Button {
               id : mButton2
               text : "RemoveLast"
               Layout.fillWidth: true
               onClicked: {
                   Wrapper.removeLast()

               }

           }
       }
}

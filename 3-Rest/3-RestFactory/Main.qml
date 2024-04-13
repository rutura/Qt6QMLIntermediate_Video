/*
        . Goal:
            . Change this application to use QNetworkRequestFactory, QRestAccessManager and QRestReply.
            . This is part of the changes introduced to make REST easy with Qt.
            . Reference:
                . (blog)[https://www.qt.io/blog/restful-client-applications-in-qt-6.7-and-forward]
                . (official docs)[https://doc-snapshots.qt.io/qt6-6.7/qrestaccessmanager.html]

  */
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import RestFactory
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
               id : button1Id
               text : "Fetch"
               Layout.fillWidth: true
               onClicked: {
                   Wrapper.fetchPosts()
               }

           }
           Button {
               id : button2Id
               text : "RemoveLast"
               Layout.fillWidth: true
               onClicked: {
                   Wrapper.removeLast()

               }

           }
       }
}

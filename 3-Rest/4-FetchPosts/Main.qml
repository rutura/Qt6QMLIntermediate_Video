/*
    . Set this up as an exercise
        . Students will expose FetchPosts, or you can even name it PostFetcher on the C++ side.
        . We will use it as shown in the QML file.
        . In the exercise I use QML_ELEMENT, but the student reserves the right to also use
            qmlRegisterType*.
        . Improvise in the video.
        . Mention the colorpalette example and show how the requests are being sent, mentioning the docs where necessary.
            . Mention it as a good example to dive in after they are done with the course.
            . Ref: https://doc.qt.io/qt-6/qtdoc-demos-colorpaletteclient-example.html
  */
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import FetchPosts

Window {
    id : root
    width: 640
    height: 480
    visible: true
    title: qsTr("FetchPosts")

    FetchPosts{
        id: fetcherId
    }

    ColumnLayout{
        anchors.fill: parent
        spacing: 0

        ListView{
            id : mListView
            model : fetcherId.posts
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
                fetcherId.fetchPosts()
            }

        }
        Button {
            id : button2Id
            text : "RemoveLast"
            Layout.fillWidth: true
            onClicked: {
                fetcherId.removeLast()

            }

        }
    }
}

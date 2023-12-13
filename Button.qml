import QtQuick

Rectangle {
   id: button
   signal clicked
   property alias text: text.text
   border.width: 1
   border.color: "black"
   property real textHeight: height - 2
   property real fontHeight: 0.9
   property bool pressed: mouse.pressed
   property real implicitMargin: (width - text.implicitWidth) / 2

   Text {
       id: text
       anchors.centerIn: parent
       height: parent.textHeight
       horizontalAlignment: Text.AlignHCenter
       verticalAlignment: Text.AlignVCenter
       font.pixelSize: height * fontHeight
       color: "white"
       font.family: "Open Sans Regular"
   }

   MouseArea {
       id: mouse
       anchors.fill: parent
       onClicked: button.clicked()
   }
}


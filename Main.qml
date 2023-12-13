import QtQuick
import QtQuick.Window

import CalcLogic

Window {
    id: mainWindow
    visible: true
    minimumWidth: 308
    minimumHeight: 435
    maximumWidth: 308
    maximumHeight: 435
    color: "black"
    title: qsTr("Calculator")
    CalcLogic {
        id: logic
    }

    Style
    {
        id: guiStyle
    }

    Rectangle {
        id: resultBox
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        height: 52
        border.color: "white"
        border.width: 1
        color: "#a5a5a5"

        Text {
            id: resultText
            anchors.leftMargin: buttons.implicitMargin
            anchors.rightMargin: buttons.implicitMargin
            anchors.fill: parent
            horizontalAlignment: Text.AlignRight
            verticalAlignment: Text.AlignVCenter
            text: qsTr( "0" )
            color: "black"
            font.pixelSize: 42
            font.family: "Open Sans Regular"
            fontSizeMode: Text.Fit
        }
    }

    Item {
        id: buttons
        anchors.top: resultBox.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        // C
        Button {
            width: guiStyle.btnWidth * 2 + 4
            height: guiStyle.btnHeight
            x: guiStyle.margin + ( 0 * ( width / 2 + guiStyle.margin ) )
            y: 4
            textHeight: 32
            id: clear_Btn
            text: "CLEAR"
            color: guiStyle.btnColor
            anchors.leftMargin: guiStyle.margin
            onClicked: {
                logic.resetLogic( );
                resultText.text = "0";
            } // onClicked
        }
        // ⌫
        Button {
            width: guiStyle.btnWidth
            height: guiStyle.btnHeight
            x: guiStyle.margin + ( 2 * ( width + guiStyle.margin ) )
            y: 4
            textHeight: 32
            id: erase_Btn
            text: "⌫"
            color: guiStyle.btnColor
            anchors.leftMargin: guiStyle.margin
            onClicked: {
                resultText.text = logic.onRemoveLastNumber( );
            }
        }
        // ÷
        Button {
            width: guiStyle.btnWidth
            height: guiStyle.btnHeight
            x: guiStyle.margin + ( 3 * ( width + guiStyle.margin ) )
            y: 4
            textHeight: 32
            id: btn_div
            text: "÷"
            color: guiStyle.btnColor
            anchors.leftMargin: guiStyle.margin
            onClicked: {
                resultText.text = logic.setOperationType( "/" );
            }
        }
        // 7
        Button {
            width: guiStyle.btnWidth
            height: guiStyle.btnHeight
            x: guiStyle.margin + ( 0 * ( width + guiStyle.margin ) )
            y: guiStyle.margin + ( 1 * ( height + guiStyle.margin ) )
            textHeight: 32
            id: btn_7
            text: "7"
            color: guiStyle.btnColor
            anchors.leftMargin: guiStyle.margin
            onClicked: {
                resultText.text = logic.onNumberInput( "7" );
            }
        }
        // 8
        Button {
            width: guiStyle.btnWidth
            height: guiStyle.btnHeight
            x: guiStyle.margin + ( 1 * ( width + guiStyle.margin ) )
            y: guiStyle.margin + ( 1 * ( height + guiStyle.margin ) )
            textHeight: 32
            id: btn_8
            text: "8"
            color: guiStyle.btnColor
            anchors.leftMargin: guiStyle.margin
            onClicked: {
                resultText.text = logic.onNumberInput( "8" );
            }
        }
        // 9
        Button {
            width: guiStyle.btnWidth
            height: guiStyle.btnHeight
            x: guiStyle.margin + ( 2 * ( width + guiStyle.margin ) )
            y: guiStyle.margin + ( 1 * ( height + guiStyle.margin ) )
            textHeight: 32
            id: btn_9
            text: "9"
            color: guiStyle.btnColor
            anchors.leftMargin: guiStyle.margin
            onClicked: {
                resultText.text = logic.onNumberInput( "9" );
            }
        }
        // ×
        Button {
            width: guiStyle.btnWidth
            height: guiStyle.btnHeight
            x: guiStyle.margin + ( 3 * ( width + guiStyle.margin ) )
            y: guiStyle.margin + ( 1 * ( height + guiStyle.margin ) )
            textHeight: 32
            id: btn_mult
            text: "×"
            color: guiStyle.btnColor
            anchors.leftMargin: guiStyle.margin
            onClicked: {
                resultText.text = logic.setOperationType( "*" );
            }
        }
        // 4
        Button {
            width: guiStyle.btnWidth
            height: guiStyle.btnHeight
            x: guiStyle.margin + ( 0 * ( width + guiStyle.margin ) )
            y: guiStyle.margin + ( 2 * ( height + guiStyle.margin ) )
            textHeight: 32
            id: btn_4
            text: "4"
            color: guiStyle.btnColor
            anchors.leftMargin: guiStyle.margin
            onClicked: {
                resultText.text = logic.onNumberInput( "4" );
            } // onClicked
        }
        // 5
        Button {
            width: guiStyle.btnWidth
            height: guiStyle.btnHeight
            x: guiStyle.margin + ( 1 * ( width + guiStyle.margin ) )
            y: guiStyle.margin + ( 2 * ( height + guiStyle.margin ) )
            textHeight: 32
            id: btn_5
            text: "5"
            color: guiStyle.btnColor
            anchors.leftMargin: guiStyle.margin
            onClicked: {
                resultText.text = logic.onNumberInput( "5" );
            } // onClicked
        }
        // 6
        Button {
            width: guiStyle.btnWidth
            height: guiStyle.btnHeight
            x: guiStyle.margin + ( 2 * ( width + guiStyle.margin ) )
            y: guiStyle.margin + ( 2 * ( height + guiStyle.margin ) )
            textHeight: 32
            id: btn_6
            text: "6"
            color: guiStyle.btnColor
            anchors.leftMargin: guiStyle.margin
            onClicked: {
                resultText.text = logic.onNumberInput( "6" );
            } // onClicked
        }
        // -
        Button {
            width: guiStyle.btnWidth
            height: guiStyle.btnHeight
            x: guiStyle.margin + ( 3 * ( width + guiStyle.margin ) )
            y: guiStyle.margin + ( 2 * ( height + guiStyle.margin ) )
            textHeight: 32
            id: btn_sub
            text: "-"
            color: guiStyle.btnColor
            anchors.leftMargin: guiStyle.margin
            onClicked: {
                resultText.text = logic.setOperationType( "-" );
            } // onClicked
        }
        // 1
        Button {
            width: guiStyle.btnWidth
            height: guiStyle.btnHeight
            x: guiStyle.margin + ( 0 * ( width + guiStyle.margin ) )
            y: guiStyle.margin + ( 3 * ( height + guiStyle.margin ) )
            textHeight: 32
            id: btn_1
            text: "1"
            color: guiStyle.btnColor
            anchors.leftMargin: guiStyle.margin
            onClicked: {
                resultText.text = logic.onNumberInput( "1" );
            } // onClicked
        }
        // 2
        Button {
            width: guiStyle.btnWidth
            height: guiStyle.btnHeight
            x: guiStyle.margin + ( 1 * ( width + guiStyle.margin ) )
            y: guiStyle.margin + ( 3 * ( height + guiStyle.margin ) )
            textHeight: 32
            id: btn_2
            text: "2"
            color: guiStyle.btnColor
            anchors.leftMargin: guiStyle.margin
            onClicked: {
                resultText.text = logic.onNumberInput( "2" );
            } // onClicked
        }
        // 3
        Button {
            width: guiStyle.btnWidth
            height: guiStyle.btnHeight
            x: guiStyle.margin + ( 2 * ( width + guiStyle.margin ) )
            y: guiStyle.margin + ( 3 * ( height + guiStyle.margin ) )
            textHeight: 32
            id: btn_3
            text: "3"
            color: guiStyle.btnColor
            anchors.leftMargin: guiStyle.margin
            onClicked: {
                resultText.text = logic.onNumberInput( "3" );
            } // onClicked
        }
        // +
        Button {
            width: guiStyle.btnWidth
            height: guiStyle.btnHeight
            x: guiStyle.margin + ( 3 * ( width + guiStyle.margin ) )
            y: guiStyle.margin + ( 3 * ( height + guiStyle.margin ) )
            textHeight: 32
            id: btn_sum
            text: "+"
            color: guiStyle.btnColor
            anchors.leftMargin: guiStyle.margin
            onClicked: {
                resultText.text = logic.setOperationType( "+" );
            } // onClicked
        }
        // 0
        Button {
            width: guiStyle.btnWidth * 2 + 4
            height: guiStyle.btnHeight
            x: guiStyle.margin + ( 0 * ( width / 2 + guiStyle.margin ) )
            y: guiStyle.margin + ( 4 * ( height + guiStyle.margin ) )
            textHeight: 32
            id: btn_0
            text: "0"
            color: guiStyle.btnColor
            anchors.leftMargin: guiStyle.margin
            onClicked: {
                resultText.text = logic.onNumberInput( "0" );
            } // onClicked
        }
        // .
        Button {
            width: guiStyle.btnWidth
            height: guiStyle.btnHeight
            x: guiStyle.margin + ( 2 * ( width + guiStyle.margin ) )
            y: guiStyle.margin + ( 4 * ( height + guiStyle.margin ) )
            textHeight: 32
            id: btn_dot
            text: "."
            color: guiStyle.btnColor
            anchors.leftMargin: guiStyle.margin
            onClicked: {
                resultText.text = logic.onDot( );
            } // onClicked
        }
        // =
        Button {
            width: guiStyle.btnWidth
            height: guiStyle.btnHeight
            x: guiStyle.margin + ( 3 * ( width + guiStyle.margin ) )
            y: guiStyle.margin + ( 4 * ( height + guiStyle.margin ) )
            textHeight: 32
            id: btn_result
            text: "="
            color: guiStyle.btnColor
            anchors.leftMargin: guiStyle.margin
            onClicked: {
                resultText.text = logic.doMath( );
            } // onClicked
        }
    }
}

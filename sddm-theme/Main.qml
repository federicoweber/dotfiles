/***************************************************************************
* Copyright (c) 2015 Víctor Granda García <victorgrandagarcia@gmail.com>
* Copyright (c) 2015 Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>
* Copyright (c) 2013 Abdurrahman AVCI <abdurrahmanavci@gmail.com>
* Copyright (c) 2013 Fabio Almeida| <fabio_r11@hotmail.com>
*
* Permission is hereby granted, free of charge, to any person
* obtaining a copy of this software and associated documentation
* files (the "Software"), to deal in the Software without restriction,
* including without limitation the rights to use, copy, modify, merge,
* publish, distribute, sublicense, and/or sell copies of the Software,
* and to permit persons to whom the Software is furnished to do so,
* subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included
* in all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
* OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
* OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
* ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
* OR OTHER DEALINGS IN THE SOFTWARE.
*
***************************************************************************/

import QtQuick 2.0
import SddmComponents 2.0

Rectangle {
  id: container
  width: 1024
  height: 768

  LayoutMirroring.enabled: Qt.locale().textDirection == Qt.RightToLeft
  LayoutMirroring.childrenInherit: true

  property int sessionIndex: session.index

  TextConstants {
    id: textConstants
  }

  Connections {
    target: sddm
    onLoginSucceeded: {
    }

    onLoginFailed: {
      errorMessage.color = "red"
      errorMessage.text = textConstants.loginFailed
    }
  }

  FontLoader {
    id: textFont; name: config.displayFont
  }

  Repeater {
    model: screenModel
    Background {
      x: geometry.x; y: geometry.y; width: geometry.width; height:geometry.height
      source: config.background
      fillMode: Image.PreserveAspectCrop
      onStatusChanged: {
        if (status == Image.Error && source != config.defaultBackground) {
          source = config.defaultBackground
        }
      }
    }
  }

  Rectangle {
    anchors.fill: parent
    color: "transparent"


    Rectangle {
      width: 600
      height: 200
      color: "transparent"
      anchors.leftMargin: - width / 2
      anchors.left: parent.horizontalCenter
      anchors.bottom: parent.bottom
      clip: true

      Item {
        id: usersContainer
        width: parent.width
        height: parent.height

        Column {
          id: nameColumn
          width: parent.width
          anchors.horizontalCenter: parent.horizontalCenter

          Text {
            id: lblName
            width: parent.width
            text: textConstants.userName
            font.family: textFont.name
            font.bold: true
            font.pixelSize: 12
            color: "#2aa889"
            anchors.left: parent.left
          }

          TextBox {
            id: name
            width: parent.width
            text: userModel.lastUser
            font: textFont.name
            color: "transparent"
            borderColor: "#2aa889"
            textColor: "#2aa889"
            anchors.left: parent.left

            Keys.onPressed: {
              if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                sddm.login(name.text, password.text, session.index)
                event.accepted = true
              }
            }

            KeyNavigation.backtab: layoutBox; KeyNavigation.tab: password
          }
          Text {
            id: errorMessage
            anchors.left: name.left
            //text: textConstants.prompt
            font.family: textFont.name
            font.pixelSize: 12
            color: "transparent"
          }
        }

        Column {
          id: passColumn
          width: parent.width
          anchors.left: parent.left
          anchors.top: nameColumn.bottom
          anchors.topMargin: 12

          Text {
            id: lblPassword
            width: parent.width
            text: textConstants.password
            font.family: textFont.name
            font.bold: true
            font.pixelSize: 12
            color: "#2aa889"
            anchors.left: parent.left
          }

          PasswordBox {
            id: password
            width: parent.width
            font: textFont.name
            color: "transparent"
            borderColor: "#2aa889"
            textColor: "#2aa889"
            tooltipBG: "#25000000"
            tooltipFG: "#dc322f"
            image: "warning_red.png"
            anchors.left: parent.left

            Keys.onPressed: {
              if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                sddm.login(name.text, password.text, session.index)
                event.accepted = true
              }
            }

            KeyNavigation.backtab: name; KeyNavigation.tab: loginButton
          }

        }
      }
    }
  }
  Rectangle {
    id: actionBar
    anchors.top: parent.top;
    anchors.horizontalCenter: parent.horizontalCenter
    width: parent.width; height: 40
    color: "transparent"

    Row {
      anchors.left: parent.left
      anchors.margins: 5
      height: parent.height
      spacing: 10

      Text {
        height: parent.height
        anchors.verticalCenter: parent.verticalCenter

        font.family: textFont.name
        verticalAlignment: Text.AlignVCenter
        color: "#2aa889"
      }

      ComboBox {
        id: session
        width: 245
        height: 20
        anchors.verticalCenter: parent.verticalCenter
        color: "transparent"
        textColor: "#2aa889"
        borderColor: "transparent"
        hoverColor: "transparent"
        arrowColor: "transparent"

        model: sessionModel
        index: sessionModel.lastIndex

        KeyNavigation.backtab: btnShutdown; KeyNavigation.tab: layoutBox
      }

    }

    Row {
      height: parent.height
      anchors.right: parent.right
      anchors.margins: 5
      spacing: 10

      ImageButton {
        id: btnReboot
        height: parent.height
        source: "reboot.svg"

        visible: sddm.canReboot
        onClicked: sddm.reboot()
        KeyNavigation.backtab: loginButton; KeyNavigation.tab: btnShutdown
      }

      ImageButton {
        id: btnShutdown
        height: parent.height
        source: "shutdown.svg"

        visible: sddm.canPowerOff

        onClicked: sddm.powerOff()

        KeyNavigation.backtab: btnReboot; KeyNavigation.tab: session
      }
    }
  }

  Component.onCompleted: {
        if (name.text == "")
            name.focus = true
        else
            password.focus = true
    }
}

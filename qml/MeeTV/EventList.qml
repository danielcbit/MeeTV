import QtQuick 1.1
import com.nokia.meego 1.0
import "core.js" as Core
import Htsp 1.0

ListView {
    property bool showChannel: false

    id: events
    anchors.fill: parent

    delegate: Column {
        Item {
            width: events.width
            height: titleTxt.height + startTxt.height

            Text {
                id: titleTxt
                text: title
                font: UiConstants.TitleFont
                width: parent.width
                clip: true
            }

            Text {
                id: startTxt
                text: Qt.formatTime(start) + " - " + Qt.formatTime(stop)
                font: UiConstants.FieldLabelFont
                anchors.top: titleTxt.bottom
            }

            Text {
                id: channelTxt
                text: channel
                font: UiConstants.FieldLabelFont
                anchors.top: startTxt.top
                anchors.right: parent.right
                visible: showChannel
            }

            MouseArea {
                onClicked: { Core.viewEvent(events.model, id); }
                anchors.fill: parent
            }
        }
    }
}

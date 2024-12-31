import QtQuick
import QtQuick.Controls.Basic

Window {
    id: window
    width: 900
    minimumWidth: 900
    maximumWidth: 900
    height: 480
    minimumHeight: 480
    maximumHeight: 480
    visible: true
    color: "#000000"
    title: qsTr("Hello World")

    Item {
        id: myItem
        property bool reIcon: true
        property double speed: 0.0;
    }

        function getIconButton() {
            if(myItem.reIcon) {
                myButton1.icon.source = "Resourses/icon/ButtonPause.jpg"
                myText.text = "Воспроизведение видео!"
                myItem.speed = 0.01
                timer.running = true
                myItem.reIcon = false
            }
            else {
                myButton1.icon.source = "Resourses/icon/ButtonPlay.jpg"
                myText.text = "Видео на паузе!"
                timer.running = false
                myItem.reIcon = true
            }
        }

        function getReward() {
            myText.text = "Перемотка видео к началу!"
            myItem.speed = -0.05
            timer.running = true
            myButton1.icon.source = "Resourses/icon/ButtonPlay.jpg"
            myItem.reIcon = true
        }

        function getForward() {
            myText.text = "Ускоренное воспроизведение!"
            myItem.speed = 0.05
            timer.running = true
            myButton1.icon.source = "Resourses/icon/ButtonPlay.jpg"
            myItem.reIcon = true
        }

        function getStop() {
            myText.text = "Воспроизведение видео окончено!"
            timer.running = false
            myProgressBar.value = 0.001
            myButton1.icon.source = "Resourses/icon/ButtonPlay.jpg"
            myItem.reIcon = true
        }

    Rectangle {
        id: myVideo
        visible: true
        color: "#000000"
        width: parent.width
        height: 350
        border.color: "#C28A14"
        border.width: 2

        Text {
            id: myText
            anchors.centerIn: myVideo
            text: "Нажмите старт!"
            color: "#ffffff"
            font.pixelSize: 15
        }


        anchors.top: parent.top
        anchors.verticalCenterOffset: -65
    }


    ProgressBar {
        id: myProgressBar
        height: 10
        width: parent.width
        value: 0.001
        Timer {
            id: timer
            interval: 1000
            running: false
            repeat: true

            onTriggered: {
                if(myProgressBar.value <= 0 || myProgressBar.value > 1) {
                    getStop()
                }
                else {
                    myProgressBar.value = myProgressBar.value + myItem.speed
                    console.log(myProgressBar.value)
                }
            }
        }

        anchors.bottom: myVideo.bottom
        anchors.bottomMargin: -10
    }

    Button {
        id: myButton1
        hoverEnabled: false
        height: 100
        width: 100

        background: RoundButton {
            anchors.fill: myButton1
            radius: 17
            }

        icon.height: myButton1.height
        icon.width: myButton1.width
        icon.source: "Resourses/icon/ButtonPlay.jpg" //"Resourses/icon/ButtonPause.jpg"
        icon.color: "transparent"


        onClicked: getIconButton()

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
    }

    Button {
        id: myButton2
        height: 70
        width: 90
        hoverEnabled: false

        background: RoundButton {
            anchors.fill: myButton2
            radius: 15
        }

        icon.height: myButton2.height
        icon.width: myButton2.width
        icon.source: "Resourses/icon/ButtonRewardLeft.jpg"
        icon.color: "transparent"
        display: Button.TextUnderIcon

        onClicked: getReward()

        anchors.bottom: parent.bottom
        anchors.bottomMargin: 15
        anchors.right: myButton1.left
        anchors.rightMargin: 5
    }

    Button {
        id: myButton3
        height: 70
        width: 90
        hoverEnabled: false

        background: RoundButton {
            anchors.fill: myButton3
            radius: 15
        }

        icon.height: myButton3.height
        icon.width: myButton3.width
        icon.source: "Resourses/icon/ButtonRewardRigth.jpg"
        icon.color: "transparent"
        display: Button.TextUnderIcon

        onClicked: getForward()

        anchors.bottom: parent.bottom
        anchors.bottomMargin: 15
        anchors.left: myButton1.right
        anchors.leftMargin: 5
    }

    Button {
    id: myButton4
    height: 70
    width: 90
    hoverEnabled: false

    background: RoundButton {
        anchors.fill: myButton4
        radius: 15
    }

    icon.height: myButton4.height
    icon.width: myButton4.width
    icon.source: "Resourses/icon/ButtonEject.jpg"
    icon.color: "transparent"

    onClicked: console.log("Кнопка временно неактивна!")

    anchors.bottom: parent.bottom
    anchors.bottomMargin: 15
    anchors.right: myButton2.left
    anchors.rightMargin: 5

    }

    Button {
        id: myButton5
        height: 70
        width: 90
        hoverEnabled: false

        background: RoundButton {
            anchors.fill: myButton5
            radius: 15
        }

        icon.height: myButton5.height
        icon.width: myButton5.width
        icon.source: "Resourses/icon/ButtonStop.jpg"
        icon.color: "transparent"

        onClicked: getStop()

        anchors.bottom: parent.bottom
        anchors.bottomMargin: 15
        anchors.left: myButton3.right
        anchors.leftMargin: 5
    }
}

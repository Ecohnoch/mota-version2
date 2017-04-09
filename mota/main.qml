import QtGraphicalEffects 1.0
import QtQuick 2.7
import QtQuick.Controls 2.0
import QtMultimedia 5.4

Rectangle{
    id: self
    color: "darkgray"

    // font for UI
    FontLoader {id: uiFont; source:'qrc:/font/PingFangM.ttf'}

    Text{
        id: fail
        anchors.centerIn: self
        text: 'fail!!'
        font.family: uiFont.name
        font.pixelSize: 40
    }

    property var bord: [0, 30, 60, 90, 120, 150, 180, 210, 240, 270, 300, 330, 360, 390,
        420, 450, 480, 510, 540, 570]
    property int level: 1

    MotaMap{
        id: map
    }

    MotaMusic{
        id: music
    }
    MotaNpc{
        id: npc
    }

    MotaActor{
        id: you
    }

    MotaEvent{
        id: event
    }

    MotaDeal{
        id: deal
    }

    MotaFight{
        id: fight
    }

    MotaUI{
        id: ui
    }


    Component.onCompleted: {
        console.log(you._where())
    }


}

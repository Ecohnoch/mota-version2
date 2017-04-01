import QtGraphicalEffects 1.0
import QtQuick 2.7
import QtQuick.Controls 2.0

Repeater {
    id: wall
    model: 400
    property var isWhat: ["wall/wall2","wall/wall","actors/moneyNpc","actors/moneyNpc","actors/npc","actors/npc","enemy/enemy",  //6
        "enemy/enemy2","enemy/enemy3","enemy/enemy4","enemy/enemy5","enemy/enemy6","enemy/enemy7","enemy/enemy8","enemy/enemy9",
        "enemy/enemy10","enemy/enemy11","enemy/enemy12","enemy/enemy13","enemy/enemy14","enemy/enemy15","enemy/enemy16","enemy/enemy17",
        "enemy/enemy18","enemy/enemy19","enemy/enemy20","enemy/enemy21","enemy/enemy22", //27
        "enemy/enemy23","enemy/enemy24","enemy/enemy25","enemy/enemy26","enemy/enemy27","enemy/enemy28","enemy/enemy29","enemy/enemy30","enemy/enemy31",
        "enemy/enemy32","enemy/enemy33","enemy/enemy34","enemy/enemy35","enemy/enemy36",
        "enemy/enemy37","enemy/enemy38","enemy/enemy39","enemy/enemy40","enemy/enemy41","enemy/enemy42","enemy/enemy43","enemy/enemy44",
        "wall/wall2","wall/wall2","wall/wall3","wall/wall4",//54
        "special/down_floor","special/up_floor",  //54 55
        "item/blo1","item/blo2","item/blo3","item/blo4","item/def1","item/def2","item/def3","item/def4",
        "item/w1","item/w2","item/w3","item/w4","item/s1","item/s2","item/s3","item/s4" //71
    ]


    MotaRectangle{

    }

    function getItem(whichItem){
        return wall.itemAt(whichItem)
    }
    Component.onCompleted: {
        console.log(wall.itemAt(382)._getWhat())
    }


}

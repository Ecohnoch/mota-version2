import QtGraphicalEffects 1.0
import QtQuick 2.7
import QtQuick.Controls 2.0

Item {
    x: 100
    //400, 450,, x= 0
    Image{
        id: weapen
        x: -90; y:400
        width: 30; height: 30
        source: "image/item/"+you.weapen+".png"
    }
    Image{
        id: shield
        x: -40; y:400
        width:30; height: 30
        source: "image/item/"+you.sheild+".png"
    }
    function changeWeapen(x){
        weapen.source = "image/item"+x+".png"
    }

    Image{
        id: logo
        source: "image/ui2.png"
        x: -100; y: 20
    }

    Image{
        id: uiBg
        source: "image/ui1.png"
        x: -100; y: 140
        Repeater{
            model: 5
            Text{
                x: 50; y: 31+index*35
                text: you.mainTable[index]
                font.family:  "Arial"
                font.pixelSize: 22
            }
        }
    }


    Image{
        id: showEnemy
        visible: false
        width: 100; height: 100
        source: "image/enemyBg.png"
        Repeater{
            model: 4
            Text{
                width: 40; height: 80
                x: 50; y: 5+index*26
            }
        }
    }

   property bool isShowEnemyOn: false
   function enemyShow(x, y){
       isShowEnemyOn = true
       showEnemy.x = x-100; showEnemy.y = y
       showEnemy.visible = true; event.transing = false
   }
   function enemyHide(){
       isShowEnemyOn = false
       showEnemy.visible = false; event.transing = true
   }
}

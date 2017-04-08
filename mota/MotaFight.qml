import QtQuick 2.7
import QtQuick.Controls 2.0

import Mota.File 1.0

Item{
    id: fight

    property int eBlood: 10
    property int eForce: 11
    property int eDefend: 9

    Image{
        id: fightBg
        visible: false
        width: 400; height: 400
        x: 200; y: 100
        source: "image/ui4.png"
        Image{
            id: fighter1
            source:""
            width: 30; height: 30
            x: 20; y: 20
        }
        Image{
            id: fighter2
            source: ""
            width: 30; height: 30
            x: 333; y: 20
        }
        function fighters(x){
            fighter1.source = "image/actor.png"
            fighter2.source = "image/" + map.isWhat[x + 6] + ".png"
            console.log(x)
        }

        Repeater{
            id: fighter1Character
            model: 3
            Text{
                x: 46; y:138 + (index) * 100
                text: you.mainTable[index]
                font.family: "Arial"
                font.pixelSize: 22
                color: "red"
            }
        }
        Repeater{
            id: fighter2Character
            model: 3
            Text{
                x: 294 ;y: 138 + (index) * 100
                text: eCharacter(index)
                function eCharacter(x){
                    if(x === 0) return eBlood
                    if(x === 1) return eForce
                    if(x === 2) return eDefend
                }

                font.family: "Arial"
                font.pixelSize: 22
                color: "red"
            }
        }
    }

    Timer{
        id: fightStart
        interval: 1000
        running: false
        onTriggered: {
            eachRound(yB, eB, yH, eH)
            checkFight(yB, eB, yH, eH, whichE)
        }
    }

    property int yB  // your blood
    property int eB  // enemy blood
    property int yH  // your hurt to enemy
    property int eH  // enemy hurt to you
    property int whichE  // which enemy you fight with

    function startFight(x){
        var yourF = you.force, yourD = you.defend
        yB = you.blood

        // name
        for(var thisEnemy in enemyData.enemy[x]){
            eForce = enemyData.enemy[x][thisEnemy][1]
            eDefend = enemyData.enemy[x][thisEnemy][2]
            eB = enemyData.enemy[x][thisEnemy][0]
            eBlood = eB
        }

           // should input a list
        whichE = x

        if(eDefend >= yourF){
            console.log("can't fight")
            stopFight()
            return
        }

        yH = (yourF - eDefend > 0) ? (yourF - eDefend) : 0
        eH = (eForce - yourD > 0) ? (eForce - yourD) : 0
        console.log("test:" ,yH, eH)
        if(!yH){

        }
        if(!eH){

        }
        showFightBg()
        music.fightBgm()
        fightStart.restart()

    }

    function showFightBg(){
        fightBg.visible = true
        // music
    }
    function hideFightBg(){
        fightBg.visible = false
    }

    function eachRound(yourB, enB, yourHurt, eHurt){
        console.log("Round start!")
        music.fightSe()
        yourB = yourB - eHurt
        you.blood = yourB
        yB = yourB

        console.log(enB)
        enB = enB - yourHurt
        eBlood = enB
        eB = enB
    }

    function checkFight(yourB, eB, yourHurt, eHurt){
        if(yourB <= 0){
            console.log("You dead!!")
            return
        }
        if(eB <= 0){
            getAward(whichE)
            stopFight()
            enemyDisappear()
            return
        }
        console.log("ready to start 2nd round", yB, eB, yH, eH)
        fightStart.restart()
    }

    function getAward(x){
        for(var thisEnemy in enemyData.enemy[x]){
            you._addMoney(enemyData.enemy[x][thisEnemy][3])
            you._addExp(enemyData.enemy[x][thisEnemy][4])
            console.log("Award: ", enemyData.enemy[x][thisEnemy][3])
        }
    }

    function enemyDisappear(){

    }

    function stopFight(){
        hideFightBg()
        music.mainBgm()
        eBlood = 100
        eForce = 11
        eDefend = 9
        yB = 0
        eB = 0
        yH = 0
        eH = 0
        whichE = 0
    }


    property var enemyData
    Component.onCompleted: {
        var d = File.read(':/enemy.json')
        enemyData = JSON.parse(d)

        for(var i in enemyData){
            console.log("key: ", i, "value: ", enemyData[i])
        }

        console.log(enemyData.enemy[0], enemyData.enemy[1])

    }
}

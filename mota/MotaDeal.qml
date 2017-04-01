import QtQuick 2.7
import QtQuick.Controls 2.0
import QtMultimedia 5.4

Item {
    x:100
    visible: false
    property bool isMoney: true
    Rectangle{
        visible: false
        id: dealBg
        color: "steelblue"
        width: 400; height: 150
        x: 100; y: 100
        Label{
            x: 30; y:30
            id: dealInstruction
            width: 360; height: 70
            text: {
                if(isMoney) return "单价25元，拒不还价"
                else return "单价100点经验，快去升级吧"
            }
            font.family:  "Arial"
            font.pixelSize: {if(isMoney) return 18; else return 15}
        }
    }
    Repeater{
        id: buttons
        model: 4
        property var data0:['攻击+3', '防御+10', '血量+800', '退出']
        Button{
            enabled: false
            width: 80; height: 30
            x: 125 + index * 85; y: 175
            text: buttons.data0[index]
            onClicked: myClicked(index)
            function myClicked(index){
                console.log("clicked")
                if(index === 0 && you.money >= 25){
                    if(isMoney){
                        you.force += 3
                        you.money -= 25
                        music.switchToSe('levelUp.wav')
                    }else{
                        if(you.exp >= 100){
                            you.force += 10
                            you.exp -= 100
                            music.switchToSe('levelUp.wav')
                        }
                    }

                }else if(index === 1 && you.money >= 25){
                    if(isMoney){
                        you.defend += 10
                        you.money -= 25
                        music.switchToSe('levelUp.wav')
                    }else{
                        if(you.exp >= 100){
                            you.defend += 10
                            you.exp -= 100
                            music.switchToSe('levelUp.wav')
                        }
                    }

                }else if(index === 2 && you.money >= 25){
                    if(isMoney){
                        you.blood += 800
                        you.money -= 25
                        music.switchToSe('levelUp.wav')
                    }else{
                        if(you.exp >= 100){
                            you.blood += 300
                            you.exp -= 100
                            music.switchToSe('levelUp.wav')
                        }
                    }
                }else if(index ===3){
                    deal.dealsDown()
                }
            }
        }
        function buttonsUp(){
            event.focus = false
            for(var i = 0; i < 4; i++){
                buttons.itemAt(i).enabled = true
                buttons.itemAt(i).focus = true
            }
        }
        function buttonsDown(){
            event.focus = true
            for(var i = 0; i < 4; i++){
                buttons.itemAt(i).enabled = false
                buttons.itemAt(i).focus = false
            }
        }
    }
    function dealsShow(b){
        event.offKeys()
        if(!b) isMoney = false
        deal.visible = true
        dealBg.visible = true
        buttons.buttonsUp()
    }
    function dealsDown(){
        event.openKeys()
        deal.visible = false
        dealBg.visible = false
        buttons.buttonsDown()
    }



}

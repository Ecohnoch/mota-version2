import QtQuick 2.7
import QtQuick.Controls 2.0

MouseArea {
    focus: true
    anchors.fill: parent
    acceptedButtons: Qt.LeftButton | Qt.RightButton

    // key down
    Keys.onPressed: function(e){
        you.cur_x = you._getX();
        you.cur_y = you._getY();

        if(isLeft(e.key)){
            you.move([-1, 0])
        }else if(isRight(e.key)){
            you.move([1, 0]);
        }else if(isUp(e.key)){
            you.move([0, -1]);
        }else if(isDown(e.key)){
            you.move([0, 1]);
        }else if(isGeneralEsc(e.key)){
            onGeneralEscDown();
        }else if(isGeneralE(e.key)){
            onGeneralEDown();
        }
        else
            console.log('***[Event] Keys.onPressed: detected unknown key:'+e.key)
    }

    // aux functions
    function isGeneralOk(key){
        return key===Qt.Key_Enter || key===Qt.Key_Return || key===Qt.Key_Space || key===Qt.LeftButton
    }
    function isGeneralEsc(key){
        return key===Qt.Key_Escape || key===Qt.RightButton
    }
    function isUp(key){
        return key===Qt.Key_Up || key===Qt.Key_W || key==='wheelUp'
    }
    function isDown(key){
        return key===Qt.Key_Down || key===Qt.Key_S || key==='wheelDown'
    }
    function isLeft(key){
        return key===Qt.Key_Left || key===Qt.Key_A
    }
    function isRight(key){
        return key===Qt.Key_Right || key===Qt.Key_D
    }
    function isGeneralE(key){
        return key===Qt.Key_E
    }
    function isButtonRight(key){
        return key===Qt.RightButton
    }
    function isButtonLeft(key){
        return key===Qt.LeftButton
    }

    function onGeneralEDown(){
    }
    function onGeneralEscDown(){
    }
    function onGeneralButtonRightDown(){
    }
    function onGeneralButtonnLeftDown(){
    }

    // control
    function openKeys(){
        Keys.enabled = true
    }
    function offKeys(){
        Keys.enabled = false
    }

}

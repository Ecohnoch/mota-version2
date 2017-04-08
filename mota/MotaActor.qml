import QtGraphicalEffects 1.0
import QtQuick 2.7
import QtQuick.Controls 2.0
Item {
    x: 100
    Image{
        id: people
        width: 30; height: 30
        source: "image/actor.png"
        x: 30; y: 540
    }

    property int cur_x: 30
    property int cur_y: 540

    property int blood: 10000
    property int force: 100
    property int defend: 100
    property int money: 100
    property int exp: 100
    property var mainTable: [blood, force, defend, money, exp]
    property bool dead: false

    property string weapen: "w1"
    property string sheild: "s1"
    Timer{
        id: youCheck
        interval: 33
        repeat: true
        running: true
        onTriggered: {
            if(dead) return
            confineInBound()
        }
    }

    // confine in bound
    function confineInBound(){
        var position = _where()
        var face = map.getItem(position)._getWhat()
        if(face !== 0){
            _editX(cur_x)
            _editY(cur_y)
        }
    }

    //control actor
    function move(dirc){
        var nowX = people.x + dirc[0] * 30
        var nowY = people.y + dirc[1] * 30
        var position = _xyWhere(nowX, nowY)
        var what = map.getItem(position)._getWhat()
        if(what === 0){
            people.x = nowX
            people.y = nowY
            music.switchToSe('cj003.wav')
        }else{
            doWhat(what, position)
        }
    }
    function doWhat(wall, p){
        switch(wall){
        case 1:
            music.switchToSe('hitWall.wav')
            break
        case 2:
            deal.dealsShow(1)
            break
        case 3:
            music.switchToSe('hitWall.wav')
            break
        case 4:
            music.switchToSe('hitWall.wav')
            break
        case 5:
            music.switchToSe('hitWall.wav')
            break

        case 6:
            music.switchToSe('hitWall.wav')
            break
        case 7:
            fight.startFight(7)
            map.getItem(p).what = 0
            break
        case 8:
            music.switchToSe('hitWall.wav')
            break
        case 9:
            music.switchToSe('hitWall.wav')
            break
        case 10:
            music.switchToSe('hitWall.wav')
            break
        case 11:
            music.switchToSe('hitWall.wav')
            break
        case 12:
            music.switchToSe('hitWall.wav')
            break
        case 13:
            music.switchToSe('hitWall.wav')
            break
        case 14:
            music.switchToSe('hitWall.wav')
            break
        case 15:
            music.switchToSe('hitWall.wav')
            break
        case 16:
            music.switchToSe('hitWall.wav')
            break
        case 17:
            music.switchToSe('hitWall.wav')
            break
        case 18:
            music.switchToSe('hitWall.wav')
            break
        case 19:
            music.switchToSe('hitWall.wav')
            break
        case 20:
            music.switchToSe('hitWall.wav')
            break
        case 21:
            music.switchToSe('hitWall.wav')
            break
        case 22:
            music.switchToSe('hitWall.wav')
            break
        case 23:
            music.switchToSe('hitWall.wav')
            break
        case 24:
            music.switchToSe('hitWall.wav')
            break
        case 25:
            music.switchToSe('hitWall.wav')
            break
        case 26:
            music.switchToSe('hitWall.wav')
            break
        case 27:
            music.switchToSe('hitWall.wav')
            break
        case 28:
            music.switchToSe('hitWall.wav')
            break
        case 29:
            music.switchToSe('hitWall.wav')
            break
        case 30:
            music.switchToSe('hitWall.wav')
            break
        case 31:
            music.switchToSe('hitWall.wav')
            break
        case 32:
            music.switchToSe('hitWall.wav')
            break
        case 33:
            music.switchToSe('hitWall.wav')
            break
        case 34:
            music.switchToSe('hitWall.wav')
            break
        case 35:
            music.switchToSe('hitWall.wav')
            break
        case 36:
            music.switchToSe('hitWall.wav')
            break
        case 37:
            music.switchToSe('hitWall.wav')
            break
        case 38:
            music.switchToSe('hitWall.wav')
            break
        case 39:
            music.switchToSe('hitWall.wav')
            break
        case 40:
            music.switchToSe('hitWall.wav')
            break
        case 41:
            music.switchToSe('hitWall.wav')
            break
        case 42:
            music.switchToSe('hitWall.wav')
            break

        }
    }


    // not use
    function _moveLeft(){
        people.x = people.x - 30
    }
    function _moveRight(){
        people.x = people.x + 30
    }
    function _moveUp(){
        people.y = people.y - 30
    }
    function _moveDown(){
        people.y = people.y + 30
    }

    // get info
    function _where(){
        return Math.floor(people.x / 30) + 20 * Math.floor(people.y / 30)
    }
    function _xyWhere(i, j){
        return Math.floor(i / 30) + 20 * Math.floor(j / 30)
    }

    function _getX(){
        return people.x
    }
    function _getY(){
        return people.y
    }

    // edit
    function _editX(newX){
        people.x = newX
    }
    function _editY(newY){
        people.y = newY
    }

    function _editBlood(newBlood){
        blood = newBlood
    }
    function _addBlood(plus){
        blood = blood + plus
    }

    function _editForce(newForce){
        force = newForce
    }
    function _addForce(plus){
        force = force + plus
    }

    function _editDefend(newDefend){
        defend = newDefend
    }
    function _addDefend(plus){
        defend = defend + plus
    }

    function _editMoney(newMoney){
        money = newMoney
    }
    function _addMoney(plus){
        money = money + plus
    }

    function _editExp(newExp){
        exp = newExp
    }
    function _addExp(plus){
        exp = exp + plus
    }
}

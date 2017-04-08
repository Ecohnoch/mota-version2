import QtQuick 2.7
import QtMultimedia 5.4

Item {
    Video{
        id: musicPlayer
        volume: 1
        property var myStarted
        property var myStopped
        autoPlay: false
        function _switchTo(path){
            musicPlayer.stop()
            musicPlayer.source = "bgm/"+path
            musicPlayer.play()
        }
    }
    function switchToSe(path){
        musicPlayer._switchTo(path)
    }
    function _editSeVolume(v){
        musicPlayer.volume = v
    }

    Video{
        id: bgm
        volume: 0.3
        autoPlay: true
        source: "bgm/Balloon.mp3"
        onStopped: {bgm.play()}
        function _switchTo(path){
            bgm.stop()
            bgm.source = "bgm/"+path
            bgm.play()
        }
    }
    function switchTo(path){
        bgm._switchTo(path)
    }

    function _editBgmVolume(v){
        bgm.volume = v
    }

    function mainBgm(){
        bgm._switchTo("Balloon.mp3")
    }

    function fightSe(){
        musicPlayer._switchTo("fight2.wav")
    }

    function fightBgm(){
        bgm._switchTo("fightBgm.mp3")
    }
}

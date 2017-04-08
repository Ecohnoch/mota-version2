import QtQuick 2.7
Rectangle {
    property int what:{
        if(index % 20 == 0 || index % 20 == 19 || index <= 20 || index >= 380) return 1 //must be
        //  test start
        else if(index == 43) return 7
        //  test end
        else return 0
    }

    id: eachWall
    width: 30; height: 30
    x: bord[index % 20] + 100; y: bord[Math.floor(index / 20)]

    Image{
        id: background
        source: "image/" + isWhat[parent.what] + ".png"
    }

    function _changeBackground(pic){
        background.source = "image/" + isWhat[what] + ".png"
    }

    function _getIndex(){
        return index
    }
    function _getWhat(){
        return what
    }


}

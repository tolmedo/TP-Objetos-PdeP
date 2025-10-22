import wollok.game.*

class ObstaculoHorizontal{
    var position = game.at(game.width()-1,1.randomUpTo(3.99).truncate(0))
    //const imagen = "vasoDeLeche.png"
    method imagen() = "vasoDeLeche.png"

    method colisionarCon(galletita) {
      galletita.chocarseConObstaculo(self)
    }

    method moverse(){
      position=position.left(1)
      if(position.x()==0){
        game.removeVisual(self)
      }
    }
}

/*
class VasoDeLeche{ var imagen= "vasoDeLeche.png" }
class Plato{}
class Tenedor{}
*/
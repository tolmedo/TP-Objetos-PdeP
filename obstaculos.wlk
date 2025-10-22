import wollok.game.*
import PepitosSweetRescue.*

class ObstaculoHorizontal{
  var property position = game.at(game.width(),1.randomUpTo(3.99).truncate(0))

  method image() = "vasoDeLeche.png"

  method colisionarCon(galletita) {
    galletita.chocarseConObstaculo(self)
  }

  method moverse(){
    position=position.left(1)
    if(position.x()==0){
      //position = game.at(game.width(),1.randomUpTo(3.9).truncate(0))
      juegoPepitosSweetRescue.sacarA(self)
      game.removeVisual(self)
      
     }
    }
}

/*
class VasoDeLeche{ var imagen= "vasoDeLeche.png" }
class Plato{}
class Tenedor{}
*/

/*
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
*/
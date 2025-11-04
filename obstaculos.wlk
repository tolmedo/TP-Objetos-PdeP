import wollok.game.*
import PepitosSweetRescue.*

class ObstaculoHorizontal{
  var property position = game.at(game.width() + 1,2.randomUpTo(4.99).truncate(0))
  const daño = 1
  method image() = "vasoDeLeche.png"

  method colisionarCon(galletita) {
    galletita.chocarseConObstaculo(daño)
  }

  method moverse(){
    position=position.left(1)
    if(position.x()<=-1){
      //position = game.at(game.width(),1.randomUpTo(3.9).truncate(0))
      instanciadorDeNiveles.sacarA(self)
      game.removeVisual(self)

     }
    }
}

class Chocolate inherits ObstaculoHorizontal(daño=-1){
  override method image() = "chocolate.png"
}

class Manzana inherits ObstaculoHorizontal(){
  override method image()= "manzana.png"
  override method moverse(){
    position=position.left(1)
    game.schedule(300,{position=position.left(1)})
    if(position.x()<=0){
      //position = game.at(game.width(),1.randomUpTo(3.9).truncate(0))
      instanciadorDeNiveles.sacarA(self)
      game.removeVisual(self)

     }
  }
}
/*
class VasoDeLeche{ var imagen= "vasoDeLeche.png" }
class Plato{}
class Tenedor{}
/

/
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
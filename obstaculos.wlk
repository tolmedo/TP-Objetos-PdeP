import wollok.game.*
import PepitosSweetRescue.*

class ObstaculoHorizontal{
  var property position = game.at(game.width() + 4,2.randomUpTo(4.99).truncate(0))
  const daño = 0
  method image() = ""

  method colisionarCon(galletita) {
    galletita.chocarseConObstaculo(daño)
    game.removeVisual(self)
  }
  
  method moverse(){
    position=position.left(1)
    //game.schedule(600,{position=position.left(1)})
    if(position.x()<=-2){
      instanciadorDeNiveles.sacarA(self)
      game.removeVisual(self)
     }
    }
}

class Chocolate inherits ObstaculoHorizontal(daño=-1){
  override method image() = "chocolate.png"
}
/*
class Pan inherits ObstaculoHorizontal(daño=1){
  override method image()= "manzana.png"
  
  override method initialize(){
    const filaAleatoria = [3, 2].anyOne()
    position = game.at(game.width(), filaAleatoria)
  }
}
*/
class VasoDeLeche inherits ObstaculoHorizontal(daño=1){
  override method image() = "vasoDeLeche.png"
}

class Cuchillo inherits ObstaculoHorizontal(daño=2){
  override method image() = "cuchillo.png"
}

import contador.*
import wollok.game.*
import PepitosSweetRescue.*


class Obstaculo{
  var property position = game.at(0,0)
  method spawns()
  method image()
  const daño = 0
  method colisionarCon(galletita) {
    galletita.chocarseConObstaculo(daño)
    game.removeVisual(self)
  }
  method moverse()
}

class ObstaculoHorizontal inherits Obstaculo(position=game.at(game.width() + 4,3)){
  override method spawns() = [2,3,4]
  
  override method moverse(){
    position=position.left(1)
    if(position.x()<=-2){
      instanciadorDeNiveles.sacarA(self)
      game.removeVisual(self)
     }
  }
}

class Chocolate inherits ObstaculoHorizontal(daño=-1){
  override method image() = "chocolate.png"
}

class TostadoraAbajo inherits ObstaculoHorizontal(daño=1){
  override method image()= "tostadora.png"
  override method spawns() = [2,3]
  override method colisionarCon(galletita) {
    galletita.chocarseConObstaculo(daño)
  }
}

class TostadoraArriba inherits ObstaculoHorizontal(daño=1){
  override method image()= "spriteInvisible.png"
  override method spawns() = [3,4]
}

class VasoDeLeche inherits ObstaculoHorizontal(daño=1){
  override method image() = "vasoDeLeche.png"
}

class Cuchillo inherits ObstaculoHorizontal(daño=2){
  override method image() = "cuchillo.png"
}



class ObstaculoVertical inherits Obstaculo(position = game.at(game.width()/2,game.height())){ // acomodar altura
  override method spawns() = [2,3,4,5,6]
  
  override method moverse(){
    position=position.down(1)
    if(position.y()<=-3){  // revisar bien donde queda -3, la idea es que esto ocurra cuando llegue al piso
      instanciadorDeNiveles.sacarA(self)
      game.removeVisual(self)
      // ademas para las pepitas agregar que le saquen una vida a pepito cuando tocan piso
     }
  }
}
/*
class Pepita inherits ObstaculoVertical(daño=0){
  override method image() = "pepita.png"
}
*/
class Plato inherits ObstaculoVertical(daño=1){
  override method image() = "plato.png"
}

class Pepitas inherits ObstaculoVertical{
  override method image() = "pepita.png"
  override method colisionarCon(galletita){
    instanciadorDeNiveles.atrapar() //Necesita modificar
    super(galletita)
  }
}
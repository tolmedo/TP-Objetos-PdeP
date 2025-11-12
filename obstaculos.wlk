import contador.*
import wollok.game.*
import PepitosSweetRescue.*


class Obstaculo{
  var property position = game.at(0,0)
  method spawns()
  method image()
  const daño = 0
  method daño()=daño
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
  override method spawns() = [3,4,5,6,7]
  var imagen
  const imagenChoque
  override method image() = imagen
  override method moverse(){
    position=position.down(1)
    
    if(position.y()<=2){
      imagen = imagenChoque
      game.schedule(150, {
      instanciadorDeNiveles.sacarA(self) 
      game.removeVisual(self)})
     }
    }
}

class Plato inherits ObstaculoVertical(daño=1, imagen="plato.png", imagenChoque="platoRoto.png"){
}

class Chispita inherits ObstaculoVertical(imagen="chispita.png", imagenChoque="chispitaAplastada.png"){
  override method colisionarCon(galletita){
    instanciadorDeNiveles.atrapar()
    super(galletita)
  }
}

class ChocolateVertical inherits ObstaculoVertical(daño=-1, imagen="chocolate.png", imagenChoque="chocolateAplastado.png"){
}
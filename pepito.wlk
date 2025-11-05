import wollok.game.*
import PepitosSweetRescue.*
import contador.*
import obstaculos.*


object pepito {

  var property position = game.at(1,2) // Posición inicial
  var vidas = 3 
  /*
  var puntaje = 0 

  method puntaje() = puntaje

  method recolectarChispita(chispita){
    game.removeVisual(chispita)
    puntaje += chispita.puntajeChip()
  }
  */
  method image() = "newPepito.png"

  method chocarseConObstaculo(daño){
    vidas -= daño
    contVidas.cantVidas(vidas)
    

    if(vidas > 0) {
      if (daño>0){
        game.say(self, "Ouch")
      }else{
        game.say(self, "Yum")
      }
    } else {
      instanciadorDeNiveles.perder()
    } 

  }

  method vidasIniciales(){
    vidas = 3 
    contVidas.cantVidas(vidas) 
  }

  //Pepito se mueve de 3 a 1 en y

  method irArriba(){
    if (position.y()<4){
      position=position.up(1)
    }
  }
  method irAbajo(){
    if (position.y()>2){
    position = position.down(1)
    }
  }

  method irDerecha(){
    if (position.x()<game.width()-2){
      position = position.right(1)
    }
  }
  method irIzquierda(){
    if (position.x()>2){
      position = position.left(1)
    }
  }

  method getVidas()=vidas

  method posicionarseEnElCentro(){
    position = game.at(position.x(),3)
  }

}
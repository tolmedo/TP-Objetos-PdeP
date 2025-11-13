import wollok.game.*
import PepitosSweetRescue.*
import contador.*
import obstaculos.*

class PepitoGeneral{
  var property position =game.at(0,0)
  var vidas =3
  var imagen=""

  method image() = imagen

  method imagen(nuevaImagen){
    imagen=nuevaImagen
  }

  method getVidas() = vidas

  method chocarseConObstaculo(daño){
    vidas -= daño
    contVidas.cantVidas(vidas)
      if(vidas > 0) {if (daño>0){
        imagen = "pepitoGameOver.png"
        game.schedule(1500, { imagen = "newPepito.png" })
        game.sound("oof.mp3").play()
        
      }else{
        imagen = "pepitoFeliz.png"
        game.schedule(1500, { imagen = "newPepito.png" })
        if(daño == -1){
        game.sound("mushroom.mp3").play()
        }else{
          game.sound("recoleccion.mp3").play()
        }
      }
      
    } else {
      instanciadorDeNiveles.perder()
    } 
  }
  method vidasIniciales(){
    vidas = 3 
    contVidas.cantVidas(vidas) 
  }
}

object pepitoNivel1 inherits PepitoGeneral(position=game.at(1,2)){

  override method image() = "newPepito.png"

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

}

object pepitoNivel2 inherits PepitoGeneral(position = game.at(5,2)){

  override method image() = "newPepito.png"
  
  method irDerecha(){
    if (position.x()< 7){
      position = position.right(1)
    }
  }

  method irIzquierda(){
    if (position.x()> 3){
      position = position.left(1)
    }
  }
}
import wollok.game.*
import PepitosSweetRescue.*


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

  method chocarseConObstaculo(obstaculo){
    vidas -= 1
    if(vidas > 0) {  
      game.say(self, "Ouch")
    } else {
      juegoPepitosSweetRescue.perder()
    } 
  
  }
  
  method vidasIniciales(){
    vidas = 3 
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

  method getVidas()=vidas

  
}
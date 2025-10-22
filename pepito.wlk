import wollok.game.*
import PepitosSweetRescue.*


object pepito {
  var property position = game.at(1,2) // Posición inicial
  var vidas = 0 //Luego cambiar a 3
  /*
  var puntaje = 0 

  method puntaje() = puntaje

  method recolectarChispita(chispita){
    game.removeVisual(chispita)
    puntaje += chispita.puntajeChip()
  }
  */
  method chocarseConObstaculo(obstaculo){
    if(vidas > 1) { 
      vidas -= 1  
      game.say(self, "Ouch")
    } else {
      game.say(self, "Me mori") //Prueba
      juegoPepitosSweetRescue.perder()
    } 
  
  }
  
  method vidasIniciales(){
    vidas = 10 //Luego cambiar a 3
  }
  //Pepito se mueve de 3 a 1 en y

  method irArriba(){
    if (position.y()<3){
      position=position.up(1)
    }
  }
  method irAbajo(){
    /*
    if (position.y()!=1){
      position.y(position.y()-1)
    }const rojo = "FF0000FF"
    method position() = game.at(game.center().x(), game.center().y() - 3)
    method text() = "Ganaste: R - reiniciar  |  Q - salir"
    method textColor() = rojo
}
    */
    if (position.y()>1){
    position = position.down(1)
    }
    
  }
  method image() = "pepito.png"
}
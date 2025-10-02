import wollok.game.*

object pepito {
  var property position =  game.at(1,2) //TODO Revisar posición inicial
  /*
  var puntaje = 0 

  method puntaje() = puntaje

  method recolectarChispita(chispita){
    game.removeVisual(chispita)
    puntaje += chispita.puntajeChip()
  }
  */
  method chocarseConObstaculo(obstaculo){
    /*game.removeVisual(obstaculo)
    */
    game.say(self, "Ouch")
    // TODO: Agregar consecuencias (morir / tomar daño)
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
    }
    */
    if (position.y()>1){
    position = position.down(1)
    }
    
  }
  method image() = "pepito.png"
}
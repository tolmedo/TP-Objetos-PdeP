import wollok.game.*

object pepito {
  var property position =  game.origin() //TODO Revisar posición inicial
  /*
  var puntaje = 0 

  method puntaje() = puntaje

  method recolectarChispita(chispita){
    game.removeVisual(chispita)
    puntaje += chispita.puntajeChip()
  }
  */
  method chocarseConObstaculo(obstaculo){
    //game.removeVisual(obstaculo)
    game.say(self, "Ouch")
    // TODO: Agregar consecuencias (morir / tomar daño)
  }
  
  //Pepito se mueve de 3
  method irArriba(){
    if (position.y()!=3){
      position.y(position.y()+1)
    }
  }

  method irAbajo(){
    if (position.y()!=1){
      position.y(position.y()-1)
    }
  }
  method image() = "pepito.png"
}
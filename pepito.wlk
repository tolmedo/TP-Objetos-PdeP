import wollok.game.*

object pepito {
  var property position =  game.origin()
  /*
  var puntaje = 0 

  method puntaje() = puntaje

  method recolectarChispita(chispita){
    game.removeVisual(chispita)
    puntaje += chispita.puntajeChip()
  }
  */
  method chocarseConObstaculo(obstaculo){
    game.removeVisual(obstaculo)
    game.say(self, "Ouch")
  }
  method image() = "pepito.png"
}
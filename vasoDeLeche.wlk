import wollok.game.*

object vasoDeLeche {
  var property position = game.at(game.width(),3)

    method image() = "vasoDeLeche.png"

    method colisionarCon(galletita) {
      galletita.chocarseConObstaculo(self)
    }

    method moverse(){
      position=position.left(1)
      if(position.x()==-1){
        position = game.at(game.width(),1.randomUpTo(3.9).truncate(0))
      }
    }
 
  /*
  var puntaje = 0 

  method puntaje() = puntaje

  method recolectarChispita(chispita){
    game.removeVisual(chispita)
    puntaje += chispita.puntajeChip()
  }
  */

  //method image() = "pepito.png"
}
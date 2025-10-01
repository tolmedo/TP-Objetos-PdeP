import wollok.game.*

object vasoDeLeche {
  var property position =  10 //TODO Revisar posición inicial
  var property position1 = game.at(3,5)

    method image() = "vaso-de-leche.png"

    method colisionarCon(galletita) {
      galletita.chocarseConObstaculo(self)
    }

    method moverse(){
      position.x(position.x()-1)
      if(position.x()==0){
        position.x(10)
        position.y(1.randomUpTo(3))
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

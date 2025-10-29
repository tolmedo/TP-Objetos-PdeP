object contador {
  var property puntaje = 0
  var property position = game.at(game.width()-3, game.height()-3)
  method text()= "Puntos : " + puntaje.toString()
  method textColor()="000000"
}

object contVidas{
  var property cantVidas = 3
  var property position = game.at(game.width(), game.height())
  method text()= "♥ : "+ cantVidas.toString()
  method textColor()="000000"
}
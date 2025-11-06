object contadorDistancia {
  var property puntaje = 6000
  var property position = game.at(game.width()-3, game.height())
  method text()= "Distancia a Pepita: " + puntaje.toString() + "mm"
  method textColor()="000000"
}

object contVidas{
  var property cantVidas = 3
  var property position = game.at(game.width(), game.height())
  method text()= "♥ : "+ cantVidas.toString()
  method textColor()="000000"
}

object contadorAtrapados {
  var property atrapados = 0
  var property position = game.at(game.width()-3, game.height())
  method text()= "Pepitas atrapadas: " + atrapados.toString() + "/10"
  method textColor()="000000"
}
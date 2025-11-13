object contadorDistancia {
  var property puntaje = 6000
  var property position = game.at(game.width()-3, game.height())
  method text()= "Distancia a Pepita: " + puntaje.toString() + "mm"
  method textColor()="000000"
}

object contVidas{
  var property cantVidas = 3
  var property position = game.at(game.width()-3, game.height()+1)
  method text()= "♥ : "+ cantVidas.toString()
  method textColor()="000000"
}

object contadorAtrapados {
  var property atrapados = 0
  var property position = game.at(game.width()-3, game.height())
  method text()= "Chispitas atrapadas: " + atrapados.toString() + "/10"
  method textColor()="000000"
}

object barraVida{
  var property position = game.at(game.width()+2, game.height())
  var imagen = "barraDeVidaLlena.png"
  method cambiarBarra(veces){
    if(veces==0){
      imagen= "barraDeVidaLlena.png"
    }else if (veces == 1){
      game.sound("ugh.mp3").play()
      imagen = "barraDeVida2.png"
    } else {
      imagen = "barraDeVidaFinal.png"
      game.sound("ugh.mp3").play()
    }
  }
  method image() = imagen
}
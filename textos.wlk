object textoMuerte {
    const rojo = "FF0000FF"
    method position() = game.at(game.center().x(), game.center().y() - 3)
    method text() = "R - reiniciar  |  Q - salir"
    method textColor() = rojo
}

object textoGanar {
    const rojo = "FF0000FF"
    method position() = game.at(game.center().x(), game.center().y() - 3)
    method text() = "Ganaste: R - reiniciar  |  Q - salir"
    method textColor() = rojo
}
object textoMenu{
    const rojo = "FF0000FF"
    method position() = game.at(game.center().x()-2, game.center().y() +1)
    method text() = "Presionar Enter para empezar"
    method textColor() = rojo
}

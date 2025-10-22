object textoMuerte {
    const rojo = "FF0000FF"
    method position() = game.at(game.center().x(), game.center().y() - 3)
    method text() = "R - reiniciar  |  Q - salir"
    method textColor() = rojo
}
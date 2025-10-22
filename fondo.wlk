import example.pepita

object fondo {
    var property imagenActual = "menuPrincipal.png"
    method position() = game.origin()
    method image() = imagenActual
    method ponerFondoMenu() { imagenActual = "menuPrincipal.png" }
    method ponerFondoJuego() { imagenActual = "backgroundPepito.png" }
    method ponerFondoGameOver() { imagenActual = "gameOver.png" }
    method ponerFondoGanar() { imagenActual = "ganaste.png" } // falta el png
}

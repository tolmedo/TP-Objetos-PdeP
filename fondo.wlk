import wollok.game.*
import pepito.*
import vasoDeLeche.*
import obstaculos.*

object fondo {
    var property imagenActual = "cargando.png" // falta foto
    method position() = game.origin()
    method image() = imagenActual
    
    method ponerFondoMenu() { 
        imagenActual = "menuPepito.png"
        self.actualizarFondo()
    }
    
    method ponerFondoJuego() { 
        imagenActual = "backgroundPepito.png"
        self.actualizarFondo()
    }
    
    method ponerFondoGameOver() { 
        imagenActual = "gameOver.png"
        self.actualizarFondo()
    }
    
    method ponerFondoGanar() { 
        imagenActual = "ganastePepito.png"
        self.actualizarFondo()
    }
    
    method actualizarFondo() {
        game.removeVisual(self)
        game.addVisual(self)
    }
}

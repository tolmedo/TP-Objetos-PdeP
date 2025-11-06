import wollok.game.*
import pepito.*
import obstaculos.*

object fondo {
    var property imagenActual = "" 
    method position() = game.origin()
    method image() = imagenActual
    
    method ponerFondoLoading() { 
        imagenActual = "cargando.png"
        self.actualizarFondo()
    }

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

    method ponerFondoNivelDos() { 
        imagenActual = "fondoNivel2.png"
        self.actualizarFondo()
    }
    
    method actualizarFondo() {
        game.removeVisual(self)
        game.addVisual(self)
    }

}

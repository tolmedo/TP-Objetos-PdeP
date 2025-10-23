import wollok.game.*
import pepito.*
import vasoDeLeche.*
import obstaculos.*
import fondo.*
import contador.*


object juegoPepitosSweetRescue{

  method menu(){
    game.title("Pepito´s Sweet Rescue")
    game.height(10)
	  game.width(10)
	  fondo.ponerFondoMenu()
    keyboard.enter().onPressDo({self.iniciar()})
  
  }

  const obstaculos=[]
  var puntos = 0
  
  method iniciar(){
    puntos=0
    
    fondo.ponerFondoJuego()
    
    const nuevoVaso = new ObstaculoHorizontal()
    obstaculos.add(nuevoVaso)
    game.addVisual(nuevoVaso)
	  game.addVisual(pepito)
    game.addVisual(contador)
    //dar vidas a pepito
    pepito.vidasIniciales()
	  //
	  game.onCollideDo(pepito, { elemento =>
      elemento.colisionarCon(pepito)
    })
	  // Cada Tick acercar obstáculos
	
    game.onTick(150, "acercarObstaculos", {
      obstaculos.forEach({obstaculo => obstaculo.moverse()})
    })
    
    game.onTick(500, "agregarObstaculo",{
      const nuevoObstaculo = new ObstaculoHorizontal()
      obstaculos.add(nuevoObstaculo)
      game.addVisual(nuevoObstaculo)
    })

    game.onTick(500, "sumarPuntos",{
      if (puntos<6000){
        puntos += 50
        contador.puntaje(puntos)
      }
      else{
        self.ganar()
      }
    })
  
    //Mover personaje para arriba y para abajo al tocar
    keyboard.w().onPressDo({pepito.irArriba()})
    keyboard.s().onPressDo({pepito.irAbajo()})
	  //game.showAttributes(pepito) //Debug
    
    // keyboard.r().onPressDo({ self.reiniciar() })
    
  }

  method perder(){
    fondo.ponerFondoGameOver()
    keyboard.q().onPressDo({ self.menu() })
    self.terminar()
  }
/*
  method reiniciar(){
    self.iniciar()
    pepito.vidasIniciales()
  }
*/
  //Por ahora solo gana, para la próxima entrega cambiar de modo (salto, vertical, etc)
  method ganar(){
    fondo.ponerFondoGanar()
    self.terminar()
  }
  
  method terminar(){
    
    game.removeTickEvent("acercarObstaculos")
    game.removeTickEvent("agregarObstaculo")
    game.removeTickEvent("sumarPuntos")
    //game.removeVisual(vasoDeLeche)
    //obstaculos.forEach({objeto => {game.removeVisual(objeto) self.sacarA(objeto)}})
    obstaculos.forEach({objeto => game.removeVisual(objeto)})
    game.removeVisual(pepito)

  }

  method sacarA(obstaculoASacar){
    obstaculos.remove(obstaculoASacar)
  }
  

 
}
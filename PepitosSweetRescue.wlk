import wollok.game.*
import gameOver.*
import pepito.*
import vasoDeLeche.*
import obstaculos.*

object juegoPepitosSweetRescue{
  const obstaculos=[]

  method iniciar(){
    game.title("Pepito´s Sweet Rescue")
	  game.height(10)
	  game.width(10)
	
	  // Agregar a los elementos visuales
    game.boardGround("cocina.png")
	  game.addVisual(vasoDeLeche)
    obstaculos.add(vasoDeLeche) //Prueba
	  game.addVisual(pepito)
    //dar vidas a pepito
	  //
	  game.onCollideDo(pepito, { elemento =>
      elemento.colisionarCon(pepito)
    })
	  // Cada Tick acercar obstáculos
	
    game.onTick(150, "acercarObstaculos", {
      obstaculos.forEach({obstaculo => obstaculo.moverse()})
    })
    /*
    game.onTick(500, "agregarObstaculo",{
      const nuevoObstaculo = new ObstaculoHorizontal()
      obstaculos.add( nuevoObstaculo)
      game.addVisual(nuevoObstaculo)
    })
    */
  
    //Mover personaje para arriba y para abajo al tocar
    keyboard.w().onPressDo(
      {
        pepito.irArriba()
      }
    )
    keyboard.s().onPressDo({pepito.irAbajo()})
	  //game.showAttributes(pepito) //Debug
  }

  method perder(){
    game.boardGround("gameOver.png")
    game.removeTickEvent("acercarObstaculos")
    //game.removeTickEvent("agregarObstaculo")
    game.removeVisual(vasoDeLeche)
    obstaculos.forEach({objeto => game.removeVisual(objeto)})
    game.removeVisual(pepito)
    game.addVisual(textoMuerte)
    keyboard.r().onPressDo({ self.reiniciar() })
    keyboard.q().onPressDo({ self.cerrar() })
  }

  method reiniciar(){
    game.clear()
    self.iniciar()
    pepito.vidasIniciales()
  }

  method cerrar(){
    game.clear()
    game.stop()
  }
  
  /*
  method clear(){

  }
  */
}
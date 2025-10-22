import wollok.game.*
import textos.*
import pepito.*
import vasoDeLeche.*
import obstaculos.*
import fondo.*

object juegoPepitosSweetRescue{
  method menu(){
    game.title("Pepito´s Sweet Rescue")
    game.height(10)
	  game.width(10)
    game.boardGround("backgroundPepito.png")
    game.addVisual(textoMenu)
	  // fondo.imagenActual = "menuPrincipal.png"

    keyboard.enter().onPressDo({self.iniciar()})
    
  }

  const obstaculos=[]
  var puntos = 0
  
  method iniciar(){
    game.removeVisual(textoMenu)
    //game.boardGround("backgroundPepito.png")
    const nuevoVaso = new ObstaculoHorizontal()
    obstaculos.add(nuevoVaso)
    game.addVisual(nuevoVaso)
	  game.addVisual(pepito)
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
      }
      else{
        self.ganar()
      }
    })
  
    //Mover personaje para arriba y para abajo al tocar
    keyboard.w().onPressDo({pepito.irArriba()})
    keyboard.s().onPressDo({pepito.irAbajo()})
	  //game.showAttributes(pepito) //Debug
    /*
    keyboard.r().onPressDo({ self.reiniciar() })
    keyboard.q().onPressDo({ self.cerrar() })
    */
  }

  method perder(){
    //fondo.ponerFondoGanar()
    game.addVisual(textoMuerte)
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
    // fondo.ponerFondoGanar()
    game.addVisual(textoGanar)
    self.terminar()
  }
  
  method terminar(){
    
    game.removeTickEvent("acercarObstaculos")
    game.removeTickEvent("agregarObstaculo")
    //game.removeVisual(vasoDeLeche)
    obstaculos.forEach({objeto => game.removeVisual(objeto)})
    game.removeVisual(pepito)
  }
/*
  method cerrar(){
    game.clear()
    game.stop()
  }
  */
  method sacarA(obstaculoASacar){
    obstaculos.remove(obstaculoASacar)
  }
  

 
}
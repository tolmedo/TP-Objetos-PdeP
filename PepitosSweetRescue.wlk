import wollok.game.*
import pepito.*
import obstaculos.*
import fondo.*
import contador.*

//nivel 1 = movimiento entre filas (tres secciones)
//nivel 2 = boss fight
/*
clase nivelGenerico
Pros:
- Más fácil el código que se repite entre niveles
- Se puede usar override y herencia

Contras:
- Más dificil vincular entre niveles

*/
object instanciadorDeNiveles{
  var punteroNivelActual=0

  method iniciar(nivel){
    if(nivel){
      punteroNivelActual= new PrimerNivel()
      punteroNivelActual.menu()
      
    }
    else {
      punteroNivelActual = new PrimerNivel() //Cambiar a nivel 2
      punteroNivelActual.nivel1() //Cambiar a nivel 2
      
    }
    
    
  }
  
  method perder(){
    punteroNivelActual.perder()
  }

  method sacarA(cosaASacar){
    punteroNivelActual.sacarA(cosaASacar)
  }
}

class NivelGenerico {
  const obstaculos=[]
  const listaTicks=[]
  var puntos = 6000
  var nivelActual=1
  

  
  method menu(){
    game.title("Pepito´s Sweet Rescue")
    game.height(10)
	  game.width(10)
	  fondo.ponerFondoMenu()
    
    keyboard.enter().onPressDo({self.iniciarInterno()})
  }

  method iniciarInterno(){
    
  }

  method perder(){
    fondo.ponerFondoGameOver()
    keyboard.q().onPressDo({ self.menu() })
    self.terminar()
  }

  method reiniciar(){
    self.terminar()
    game.clear()
    obstaculos.clear()
    puntos = 6000
    contador.puntaje(6000)
    self.iniciarInterno()
    pepito.vidasIniciales()
    
    //self.iniciar()
}

  
  method ganar(){
    fondo.ponerFondoGanar()
    self.terminar()
    nivelActual += 1
  }

  /* override method ganar() {
      
      super()
      if (nivelActual == (nivelFinal-1)){
      
        self.terminar()
      }
    }
  */
  
  method terminar(){
    
    listaTicks.forEach({tick => game.removeTickEvent(tick)})
    //game.removeVisual(vasoDeLeche)
    //obstaculos.forEach({objeto => {game.removeVisual(objeto) self.sacarA(objeto)}})
    obstaculos.forEach({objeto => game.removeVisual(objeto)})
    game.removeVisual(pepito)

  }

  method sacarA(obstaculoASacar){
    obstaculos.remove(obstaculoASacar)
  }
  
}

class PrimerNivel inherits NivelGenerico(listaTicks=["acercarObstaculos", "agregarObstaculo", "restarDistancia"]){
  
  override method iniciarInterno(){
    if(nivelActual==1){
      //self.reiniciar()
      self.nivel1()
    }else{
      instanciadorDeNiveles.iniciar(false)
      //Agregar autodestrucción
    }
  }

  method nivel1(){
    puntos = 6000
    
    fondo.ponerFondoJuego()
    
    const nuevoVaso = new VasoDeLeche()
    obstaculos.add(nuevoVaso)
    game.addVisual(nuevoVaso)
	  game.addVisual(pepito)
    game.addVisual(contador)
    game.addVisual(contVidas)
    
	  game.onCollideDo(pepito, { elemento =>
      elemento.colisionarCon(pepito)
    })
	  // Cada Tick acercar obstáculos
	
    game.onTick(125, "acercarObstaculos", {
      obstaculos.forEach({obstaculo => obstaculo.moverse()})
    })
    /*
    game.onTick(500, "agregarObstaculo",{
      var nuevoObstaculo
      const numRandom =0.randomUpTo(20)
      if (numRandom<19){
        if(numRandom<10){
          nuevoObstaculo = new VasoDeLeche()
        }else{
          nuevoObstaculo = new Manzana()
        }
      }else {
        nuevoObstaculo = new Chocolate()
      }
      
      obstaculos.add(nuevoObstaculo)
      game.addVisual(nuevoObstaculo)
    })
    */

    game.onTick(400, "agregarObstaculo", {
      var nuevoObstaculo
      const numRandom =0.randomUpTo(30)
      if (numRandom<29){
        if (puntos > 4750){
         nuevoObstaculo = new VasoDeLeche() 
        } else if (puntos > 3500){
         nuevoObstaculo = new Cuchillo() 
        /*} else if (numRandom < 2){
          nuevoObstaculo = new Pan()*/
        } else if (numRandom < 14){
          nuevoObstaculo = new Cuchillo()
        } else {
          nuevoObstaculo = new VasoDeLeche()
        }
      }else {
        nuevoObstaculo = new Chocolate()
      }
      obstaculos.add(nuevoObstaculo)
      game.addVisual(nuevoObstaculo)
    })



/*
    game.onTick(500, "sumarPuntos",{
      if (puntos<6000){
        puntos += 50
        contador.puntaje(puntos)
      }
      else{
        self.ganar()
      }
    })
*/
  game.onTick(500, "restarDistancia",{
      if (puntos>0){
        puntos -= 50
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
    
    keyboard.r().onPressDo({ self.reiniciar() })
    if (puntos == 0){
      nivelActual = 2
    }
    
  }
}

class SegundoNivel inherits NivelGenerico{
  override method iniciarInterno(){
    if(nivelActual==1){
      self.reiniciar()
      //self.nivel1()
    }else{
      instanciadorDeNiveles.iniciar(false)
      //Agregar autodestrucción
    }
  }
}
/*

class NivelGenerico {


  // COMPORTAMIENTO GENÉRICO: iniciar, ganar, perder, terminar, reiniciar, las imagenes

  method spawnPepito() {
  
    game.addVisual(pepito)
  
  }

}

class Nivel1 inherits NivelGenerico {

  // COMPORTAMIENTO EXCLUSIVO DEL NIVEL CON FILAS

  method moverObstaculo(){}
}

class Boss inherits NivelGenerico {

  override method spawnPepito() {
  
    game.addVisualCharacter(pepito)
  
  }
  
  method moverObstaculo(){}

  // COMPORTAMIENTO EXCLUSIVO DE LA BOSS FIGHT
}

*/


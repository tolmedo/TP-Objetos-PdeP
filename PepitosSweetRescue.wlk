import wollok.game.*
import pepito.*
import obstaculos.*
import fondo.*
import contador.*


object instanciadorDeNiveles{
  var punteroNivelActual = 0
  method iniciar(nivel){
    if(nivel == 1){
      punteroNivelActual = new PrimerNivel()
      punteroNivelActual.menu()
    }
    else {
      punteroNivelActual = new SegundoNivel() //Cambiar a nivel 2
      punteroNivelActual.nivel2()
      
    }
    
  }
  method perder(){
    punteroNivelActual.perder()
  }
  method atrapar(){
    punteroNivelActual.sumarAtrapar()
  }
  method sacarA(cosaASacar){
    punteroNivelActual.sacarA(cosaASacar)
  }
}

class NivelGenerico {
  const obstaculos=[]
  const listaTicks=[]
  var puntos = 0
  var nivelActual = 0
  var ultimoSpawn = 3
  const suPepito

  method menu(){
	  fondo.ponerFondoMenu()
    keyboard.enter().onPressDo({self.iniciarInterno()})
  }

  method iniciar(){
    if (nivelActual == 0)self.menu()
    else if (nivelActual == 1) PrimerNivel.nivel1()
    else SegundoNivel.nivel2()
  }

  method perder(){
    fondo.ponerFondoGameOver()
    // keyboard.q().onPressDo({ self.menu() })
    keyboard.r().onPressDo({ self.reiniciar() })
    self.terminar()
  }

  method reiniciar(){
    self.terminar()
    game.clear()
    obstaculos.clear()
    self.iniciarInterno()
    suPepito.vidasIniciales()
    suPepito.imagen("newPepito.png")
  }

  method aplicarTickAcercar(){
    game.onTick(125, "acercarObstaculos", {
      obstaculos.forEach({obstaculo => obstaculo.moverse()})
    })
  }
  
  method agregarPrimerosVisuales(){
    game.addVisual(suPepito)
    game.addVisual(contVidas)
  }

  method sacarContadores(){
    game.removeVisual(contadorDistancia)
    game.removeVisual(contadorAtrapados)
    game.removeVisual(contVidas)
  }

  method ganar()

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
    game.removeVisual(suPepito)

  }

  method sacarA(obstaculoASacar){
    obstaculos.remove(obstaculoASacar)
  }

  method asignarFilaDiferente(spawns) {
    const spawnsDisponibles = spawns.filter({ fila => fila != ultimoSpawn })
    const nuevoSpawn = spawnsDisponibles.anyOne()
    ultimoSpawn = nuevoSpawn
    return nuevoSpawn
  }
  
  method iniciarInterno()
  
}

class PrimerNivel inherits NivelGenerico(listaTicks=["acercarObstaculos", "agregarObstaculo", "restarDistancia"], suPepito=pepitoNivel1, nivelActual=1){

  override method iniciarInterno(){
    if(nivelActual==1){
      //self.reiniciar()
      self.nivel1()
    }
    /*else{
      instanciadorDeNiveles.iniciar(2)
      //Agregar autodestrucción
    }
    */
  }

  method nivel1(){

    game.onCollideDo(pepitoNivel1, 
      {elemento => elemento.colisionarCon(pepitoNivel1)}
    )

    puntos = 6000
    contadorDistancia.puntaje(puntos)
    fondo.ponerFondoJuego()
	  self.agregarPrimerosVisuales()
    game.addVisual(contadorDistancia)
    
	  // Cada Tick acercar obstáculos
    self.aplicarTickAcercar()

    game.onTick(400, "agregarObstaculo", {
      var nuevoObstaculo
      var esTos = false
      const numRandom =0.randomUpTo(40)
      if (numRandom<39){
        if (puntos > 5500){
         nuevoObstaculo = new VasoDeLeche() //Prueba
        } else if (puntos > 5000){
         nuevoObstaculo = new Cuchillo() 
        } else if (numRandom < 5){
          nuevoObstaculo = new TostadoraAbajo()
          esTos = true
        } else if (numRandom < 24){
          nuevoObstaculo = new Cuchillo()
        } else {
          nuevoObstaculo = new VasoDeLeche()
        }
      }else {
        nuevoObstaculo = new Chocolate()
      }
      
      nuevoObstaculo.position(game.at(nuevoObstaculo.position().x(), self.asignarFilaDiferente(nuevoObstaculo.spawns())))
      obstaculos.add(nuevoObstaculo)
      game.addVisual(nuevoObstaculo)

      if(esTos){
        nuevoObstaculo = new TostadoraArriba()
        const filaArriba = ultimoSpawn + 1

        nuevoObstaculo.position(game.at(nuevoObstaculo.position().x(), filaArriba))
        obstaculos.add(nuevoObstaculo)
        game.addVisual(nuevoObstaculo)
        esTos = false
      }
    })

    game.onTick(500, "restarDistancia",{
      if (puntos>0){
        puntos -= 500
        contadorDistancia.puntaje(puntos)
      }
      else{
        self.ganar()
      }
    })
  
    keyboard.w().onPressDo({pepitoNivel1.irArriba()})
    keyboard.s().onPressDo({pepitoNivel1.irAbajo()})
	  //game.showAttributes(pepito) //Debug
    
  }
  /*
  override method ganar(){
      fondo.ponerFondoLoading()
      self.terminar()
      game.schedule(10000 ,{fondo.ponerFondoNivelDos()})
      nivelActual = 2
    }
  */
  override method ganar(){
    nivelActual = 2
    self.reiniciar()
    instanciadorDeNiveles.iniciar(nivelActual)
    //SegundoNivel.nivel2()
  }
}

class SegundoNivel inherits NivelGenerico(suPepito=pepitoNivel2){
  
  override method iniciarInterno(){
    if(nivelActual == 2){
      //self.reiniciar()
      self.nivel2()
    }else{
      instanciadorDeNiveles.iniciar(false)
      //Agregar autodestrucción
    }
  }

  override method ganar(){
      self.sacarContadores()
      fondo.ponerFondoGanar()
      self.terminar()
      nivelActual=1 //Hay que revisar después
    }

  method sumarAtrapar(){
    puntos+=1
  }
  method nivel2(){

    game.onCollideDo(pepitoNivel2, 
      { elemento => elemento.colisionarCon(pepitoNivel2)}
    )

    puntos = 0
    contadorAtrapados.atrapados(puntos)
    game.addVisual(contadorAtrapados)
    self.agregarPrimerosVisuales()

    fondo.ponerFondoNivelDos()
  
    self.aplicarTickAcercar()

    game.onTick(400, "agregarObstaculo", {
      var nuevoObstaculo
      const numRandom = 0.randomUpTo(40)
      if (numRandom > 39) nuevoObstaculo = new Chocolate() 
      else if (numRandom > 36) nuevoObstaculo = new Pepitas()
      else nuevoObstaculo = new Plato()

      nuevoObstaculo.position(game.at(self.asignarFilaDiferente(nuevoObstaculo.spawns()), nuevoObstaculo.position().y()))
      obstaculos.add(nuevoObstaculo)
      game.addVisual(nuevoObstaculo)
    })

    keyboard.d().onPressDo({pepitoNivel2.irDerecha()})
    keyboard.a().onPressDo({pepitoNivel2.irIzquierda()})

    game.onTick(150, "contarAtrapados",{
      if (puntos<10){
        contadorAtrapados.atrapados(puntos)
      }
      else{
        self.ganar()
      }
    })

}}


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


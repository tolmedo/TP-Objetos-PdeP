import wollok.game.*
import pepito.*
import obstaculos.*
import fondo.*
import contador.*


object instanciadorDeNiveles{
  var property punteroNivelActual = 0
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
  var property puntos = 0
  var nivelActual = 0
  var ultimoSpawn = 3
  const suPepito
  const velocidadMovimiento = 180

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
    suPepito.vidasIniciales()
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
    // suPepito.vidasIniciales()
    suPepito.imagen("newPepito.png")
  }

  method aplicarTickAcercar(){
    game.onTick(velocidadMovimiento, "acercarObstaculos", {
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
      self.nivel1()
    }
    /*else{
      instanciadorDeNiveles.iniciar(2)
      //Agregar autodestrucción
    }
    */
  }

  method nivel1(){
    suPepito.vidasIniciales()
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
        if (puntos > 5250){
         nuevoObstaculo = new VasoDeLeche() 
        } else if (puntos > 4500){
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
        puntos -= 50
        contadorDistancia.puntaje(puntos)
      }
      else{
        self.ganar()
      }
    })
  
    keyboard.w().onPressDo({pepitoNivel1.irArriba()})
    keyboard.s().onPressDo({pepitoNivel1.irAbajo()})
    
  }

  override method ganar(){
    nivelActual = 2
    self.reiniciar()
    instanciadorDeNiveles.iniciar(nivelActual)
  }
}

class SegundoNivel inherits NivelGenerico(listaTicks=["acercarObstaculos", "agregarObstaculo"] , suPepito=pepitoNivel2){
  var veces = 0
  const velocidadAparicion = 220
  var rarezaChispita = 42
  override method iniciarInterno(){
    if(nivelActual == 2){
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
  }
  /*
  method cambiarVelocidad(){
    velocidadAparicion -= 50
    velocidadMovimiento -= 40
  }
  */
  method sumarAtrapar() {
    puntos += 1
    contadorAtrapados.atrapados(puntos)
    if(puntos == 10){
        puntos = 0
        contadorAtrapados.atrapados(puntos)
        
        if (veces == 2){
          veces=0
          self.ganar()
        }else{
          veces +=1
          barraVida.cambiarBarra(veces)
          // self.cambiarVelocidad()
          rarezaChispita += 2
        }
    }
  }

  method nivel2(){
    fondo.ponerFondoNivelDos()

    game.onCollideDo(pepitoNivel2, 
      { elemento => elemento.colisionarCon(pepitoNivel2)}
    )
    
    puntos = 0
    veces = 0
    //velocidadAparicion = 250
    contadorAtrapados.atrapados(puntos)
    game.addVisual(contadorAtrapados)
    
    game.addVisual(barraVida)
    barraVida.cambiarBarra(veces)
    self.agregarPrimerosVisuales()

    self.aplicarTickAcercar()

    game.onTick(velocidadAparicion, "agregarObstaculo", {
      var nuevoObstaculo
      const numRandom = 0.randomUpTo(50)
      if (numRandom > 49) nuevoObstaculo = new ChocolateVertical() 
      else if (numRandom > rarezaChispita) nuevoObstaculo = new Chispita()
      else nuevoObstaculo = new Plato()

      nuevoObstaculo.position(game.at(self.asignarFilaDiferente(nuevoObstaculo.spawns()), nuevoObstaculo.position().y()))
      obstaculos.add(nuevoObstaculo)
      game.addVisual(nuevoObstaculo)
    })

    keyboard.d().onPressDo({pepitoNivel2.irDerecha()})
    keyboard.a().onPressDo({pepitoNivel2.irIzquierda()})

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

IDEA NIVEL 2:

>> En vez de "Pepitas" que caigan pepitas de chocolate. Cada 3 que recolectas Pepito se pone dorado
y el Monstruo titila. A las tres veces de eso ganas.

*/


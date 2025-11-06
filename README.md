# **PEPITO'S SWEET RESCUE**

## **¡Pepita fue capturada por el Monstruo Come Galletas!**

Ayuda a Pepito en una carrera para alcanzar a su amada antes de que sea demasiado tarde.
En este juego deberás esquivar, rodar y saltar distintos obstáculos para abrirte camino
hasta el final de la mesa, ¿podrás lograr que Pepito y Pepita se reencuentren a tiempo?

## **CONTROLES**

### General:
- "Enter" para empezar
- "R" para reiniciar

### En el primer nivel:
- "W" para subir un espacio
- "S" para bajar un espacio

### En el segundo nivel:
- "D" para moverse un espacio a la derecha
- "A" para moverse un espacio a la izquierda

## **OBSTÁCULOS**

- Vaso de Leche: **DAÑO 1**
- Cuchillo: **DAÑO 2**
- Tostadora: **DAÑO 1** y ocupa el doble de filas
- Plato: **DAÑO 1** (segundo nivel)

## **CLASES**

- Para el modelado de los obstáculos, se optó por crear una clase abstracta (`Obstaculo`)
  la cual permita definir un comportamiento común ante la colisión con Pepito y plantear los métodos comunes, pero con la libertad de sobreescribir como sea necesario e incluso hacer uso de "super". 

- De la misma manera, el personaje Pepito también aprovecha las ventajas de la herencia.

- De esta forma pudimos modificar "en cascada", sin tener que aplicar los cambios clase a clase.

## **COLECCIONES**

- El uso de colecciones está ligado a la aparición de múltiples obstáculos en pantalla al mismo
  tiempo. Era necesario contar con una lista que permita gestionar el comportamiento de varios
  objetos a la vez, sin diferenciar su tipo (podrían ser obstaculos horizontales o verticales).

- También es usado para la lista de Ticks usados.

## **POLIMORFISMO**

- La estructura del código permite mantenibilidad y escalabilidad en torno al comportamiento de
  los obstáculos. Tanto si comprende los métodos de movimiento como los de colisión, esto permite
  que el objeto se vincule con `object pepito` sin importar si es un vaso, un plato o un chocolate.

- Además, mediante "duck typing", al mover los objetos, no le interesa cuál sea su clase, tan solo que puedan comprender el mensaje deseado.



---


## **DIAGRAMA DE CLASES**

![Diagrama de Clases](/assets/Diagrama_de_Clases.png)

En una primera versión, `juegoPepitoSweetRescue` actuaba como el cerebro del programa; implementando la interfaz de **fondo**
daba formato al juego, para así luego ejecutar los métodos *menu()* e *iniciar()*, los cuales dan lugar
a los **onTick events** que regulan la interacción entre `juegoPepitoSweetRescue`, `pepito`, y las
instancias de la clase `ObstaculoHorizontal`.

Actualmente, el `instanciadorDeNiveles` es quien crea objetos de la clase respectiva al nivel deseado y les comunica los mensajes a esa instancia específica.
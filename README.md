# **PEPITO'S SWEET RESCUE**

## **¡Pepita fue capturada por el Monstruo Come Galletas!**

Ayuda a Pepito en una carrera para alcanzar a su amada antes de que sea demasiado tarde.
En este juego deberás esquivar, rodar y saltar distintos obstáculos para abrirte camino
hasta el final de la mesa, ¿podrás lograr que Pepito y Pepita se reencuentren a tiempo?

### **Clases**

- Para el modelado de los obstáculos, se optó por crear una clase base (`ObstaculoHorizontal`)
  la cual permita definir un comportamiento común en torno al movimiento de los mismos y los
  efectos ante la colisión con Pepito.

- De esta forma también, pensando en próximas entregas, se facilita la aplicación de métodos
  de carácter polimórfico sin necesidad de modificar objeto por objeto.

### **Colecciones**

- El uso de colecciones está ligado a la aparición de múltiples obstáculos en pantalla al mismo
  tiempo. Era necesario contar con una lista que permita gestionar el comportamiento de varios
  objetos a la vez, sin diferenciar su tipo (podrían ser obstaculos verticales).

### **Polimorfismo:**

- La estructura del código permite mantenibilidad y escalabilidad en torno al comportamiento de
  los obstáculos. Tanto si comprende los métodos de movimiento como los de colisión, esto permite
  que el objeto se vincule con `object pepito` sin importar si es un vaso, un plato o una garrafa.


---

## **Diagrama de Clases:**

![Diagrama de Clases](/assets/Diagrama_de_Clases.png)

`juegoPepitoSweetRescue` actúa como el cerebro del programa; implementando la interfaz de **fondo**
da formato al juego, para así luego ejecutar los métodos *menu()* e *iniciar()*, los cuales dan lugar
a los **onTick events** que regulan la interacción entre `juegoPepitoSweetRescue`, `pepito`, y las
instancias de la clase `ObstaculoHorizontal`.
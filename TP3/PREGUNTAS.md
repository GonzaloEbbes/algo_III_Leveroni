## Preguntas teóricas

### Aporte de los mensajes de DD
En un double dispatch (DD), ¿qué información aporta cada uno de los dos llamados?

El primer llamado te indica el tipo de receptor instanciado. El segundo te indica cual es el tipo de colaborador externo instanciado, que fue llamado en el primer mensaje.

### Lógica de instanciado
Con lo que vieron y saben hasta ahora, ¿donde les parece mejor tener la lógica de cómo instanciar un objeto? ¿por qué? ¿Y si se crea ese objeto desde diferentes lugares y de diferentes formas? ¿cómo lo resuelven?

La logica de como implementar una instancia debe estar en un mensaje de inicializacion, propio de la clase (esto es, en la seccion 'class' y no en la sección 'instance'). 
Suponiendo una jerarquia de clases, la implementacion debería estar en la superclase siempre y cuando la inicialización sea la misma para dichas subclases. Si es distinta, debe delegarse la responsabilidad en cada una de las subclases.

### Nombres de las categorías de métodos
Con lo que vieron y trabajaron hasta ahora, ¿qué criterio están usando para categorizar métodos?

Estamos utilizando dos criterios: uno para separar private/public según el uso que se le de a los mensajes, y el otro asociado al uso de dichos metodos. Ejemplo, usamos en este caso "private - doubleDispatch" para indicar los mensajes privados que se utilizan para el double dispatch.

### Subclass Responsibility
Si todas las subclases saben responder un mismo mensaje, ¿por qué ponemos ese mensaje sólo con un “self subclassResponsibility” en la superclase? ¿para qué sirve?

Sirve en un sentido de diseño y de lógica. La superclase no debe tener una implementacion específica de un mensaje, sino el QUÉ. Esto significa; una definicion clara de qué van a hacer las subclases. “self subclassResponsibility” nos esta indicando que, aunque la declaración del metodo este en la superclase, cada subclase debe saber responder el mensaje con su propio metodo.

### No rompas
¿Por qué está mal/qué problemas trae romper encapsulamiento?

1) Romper el encapsulamiento implica romper la lógica de la delegación de los objetos. El objeto se encarga de realizar una accion con un determinado mensaje. No debe llamar desde un objeto a otros objetos para resolverle una determinada accion. 
A lo sumo, podría crear un metodo para resolver una determinada accion, y que se llame a otro objeto en un sentido meramente delegativo (pero eso ya es parte de la implementacion, a ciencia cierta el objeto SABE responder y lo hace con un mensaje).


2) Cada objeto sabe responder mensajes, pero esto tiene en cuenta tambien que su implementacion (el método) puede variar en un futuro. Si esto es así, con modificar el método del mensaje en cuestión ya estaría solucionado. Si el encapsulamiento se rompe, la implementacion de un determinado mensaje puede estar desperdigada por todo el código. Por ende, modificar algo implica mayor tiempo para buscar y comprender qué partes del codigo cambiar.

3) La implementacion de los ifs que estaba previo a Double Dispatch estaba rompiendo el encapsulamiento. Por el hecho de que se estaba implementando en el objeto incorrecto unas determinadas acciones que no le correspondian. Por ello, cuando creamos los nuevos mensajes (los correspondientes al 2do llamado) trasladamos la implementacion al objeto que les correspondian. Al hacer esto, encapsulamos cada implementacion de los ifs en un mensaje apropiado, en el objeto apropiado.


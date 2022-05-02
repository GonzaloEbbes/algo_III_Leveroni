# En los test 01 y 02 hay código repetido. Cuando lo extrajeron crearon algo nuevo. Eso es algo que estaba en la realidad y no estaba representado en nuestro código, por eso teníamos código repetido. ¿Cuál es esa entidad de la realidad que crearon?

El ente representado es el calcular tiempo de una accion. ¡Es basicamente un cronometro!

#¿Cuáles son las formas en que podemos representar entes de la realidad en Smalltalk que conocés? Es decir, ¿qué cosas del lenguaje Smalltalk puedo usar para representar entidades de la realidad?

En primer lugar, puedo usar objetos y mensajes para representar entes de la realidad. Pero ademas, debo tener en cuenta que en Smalltalk puedo usar sus objetos predefinidos (y correspondientes mensajes) para intentar representar entes de la realidad que quienes diseñaron Smalltalk ya contemplaron.}

#¿Qué relación hay entre sacar código repetido (creando abstracciones) y la teoría del modelo/sistema (del paper de Naur)?

Segun Naur, el programador debe construir una TEORIA de cómo ciertos aspectos de la realidad (entes) serán representados por la computadora. Es, a ciencia cierta, un conocimiento directo o desempeño inteligente del programador. 

Eliminar código repetido requiere tener la teoría de como funciona el programa. 
De no tenerla, cualquier modificacion al código no será inteligentemente. Y por ende, para cualquiera que quisiese adquirir la teoría del código ahora, le resultara mucho mas complicado: esto es, que se acortó la vida del programa.

Por otro lado, si se tiene la teoría y se elimina codigo repetido; se esta reforzando la teoria, porque al quitar código repetido uno debe cuestionar porqué cada parte del código es como es. Además, ahora el código representará de forma mas clara la teoría. Esto significa que el programa estaría extendiendo su período de vida.


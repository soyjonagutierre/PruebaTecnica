# pruebatecnica

Es un proyecto de flutter basado en la API de Rick And Morty.

Tome esa API porque me gusta la serie.

Decidi utilizar provider principalmente para el manejo de estados del usuario. En este caso solo se usa el nombre para pasar el nombre del usuario a las demas pantallas, pero se podria implementar para mas cosas.

Para el diseño utilice una pantalla de incio minimalista, solo con una imagen, un text field y un boton. 
Tome esa decision porque los colores de rick and morty son muy hostigantes.

Despues de el el login la siguiente pantalla te muestra la lista de los personajes que te retorna la API, para mostrarlos se me ocurrio hacer un listbuilder de un widget que se llama ExpansionTile ya que en lo personal se me hace muy llamativo el tocar un item y que se expanda, a demas de que ahi podria meter informacion basica y un boton que te dirija a otra pantalla con mas informacion.

Utilice dos modelos, el de usuario que por el momento solo tiene el nombre y el del personaje que tiene, nombre, estado, especie, origen, imagen y location.

Depende del personajes que eligas ver mas informacion sera los valores de la clase CharacterModel.

Otra decision que cabe destacar es el uso de las colas de la aplicacion. Por ejemplo una vez que inicias sesion y quieres regresar con el boton o el gesto regresar incluido en los telefonos android ya no se podra, tendras que usar el boton incluido en la app y al dirigirte a la pagina de informacion se deja la cola para que con el boton o gesto de regresar incluido en el telefono android puedes volver a elegir tu personaje, al menos que le des en el boton de regresar o "done" ahi si destuira la cola para que no puedas volver a esa pantalla hasta que eligas otro personaje



## Getting Started

Antes de comenzar asegurate de tener instalado flutter.

Ejecuta flutter pub get

Despues ejecuta flutter run

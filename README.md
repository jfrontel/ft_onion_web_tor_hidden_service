# ft_onion_web_tor_hidden_service
Web de Onion accesible con Tor mediante la creación de un hidden service usando Nginx como servidor web y acceso SSH a través del puerto 4242. 


¿Sabes qué es un hidden service y cómo funciona? Al utilizar internet, los protocolos de comunicación segura permiten ocultar los datos que intercambia un usuario con el servidor de una página. No obstante, normalmente es visible el hecho de que ocurre dicha comunicación. Es decir, se oculta el contenido de las peticiones, mas no el hecho de que se hayan realizado.

Para ocultar esto, existen servicios como el de la VNP, que impiden que los proveedores de servicios y otros terceros accedan a este tipo de información. Sin embargo, al utilizar una VPN, los desarrolladores de este servicio sí tienen acceso a esos datos. Entonces si, por ejemplo, se visita una página con conexión HTTP, el servidor de la VPN tendría acceso total a la información sin cifrar.

Por eso, existe un mecanismo para hacerle peticiones anónimas a un servidor sin que ningún tercero (incluido una VPN) pueda ver que nos comunicamos con un servidor web. El método se conoce como onion routing y es muy famoso por ser el sistema que utiliza el navegador Tor. No obstante, en este post, hablaremos de un caso particular, en el que tanto el usuario como el servidor se pueden conectar de manera anónima. A continuación, te explicaremos qué es un hidden service.

<h2>¿Qué es un hidden service?</h2>
<p>Si bien por medio del onion routing (el sistema utilizado por el navegador Tor para mantener las peticiones web anónimas) sirve para ocultar la identidad del usuario, un hidden service o servicio oculto es una comunicación por internet en la que el servidor web también es anónimo.</p>

<p>Este tipo de servicios se utilizan para actividades ilegales como:

<p>Ventas ilícitas por medio de pagos anónimos con ciertas criptomonedas.
Foros de hackers donde se comparten datos filtrados, como contraseñas, números de tarjetas de crédito, etc.
No obstante, cabe aclarar que la deep web no solo se utiliza con estos fines.

<h3>¿Qué es el onion routing?</h3>
<p>Para entender qué es un hidden service, es necesario saber cómo funciona el onion routing. Por eso, haremos un breve repaso sobre este sistema.</p>

<p>El onion routing es un sistema de comunicación anónima que se basa en enrutar las peticiones a un servidor web por medio de un sistema de tres nodos:</p>

<p>Nodo de entrada.</p>
<p>Nodo del medio.</p>
<p>Nodo de salida.</p>

<h3>¿Cómo funciona el onion routing?</h3>
<p>El mensaje se encripta con la clave pública del nodo de salida, luego con la del nodo del medio y, finalmente, con la del nodo de entrada.</p>
<p>El mensaje se envía al nodo de entrada, el cual desencripta la primera capa y le envía el mensaje al segundo servidor.</p>
<p>El nodo del medio recibe el mensaje y desencripta la segunda capa, luego lo remite al tercer servidor.</p>
<p>El nodo de salida recibe la petición desencriptada y se la envía al servidor web, pero no conoce la dirección IP del usuario ni la del nodo de entrada.</p>
<p>Finalmente, la respuesta del servidor se envía siguiendo el procedimiento inverso.</p>

<h3>¿Cómo funciona un hidden service?</h3>
Ya sabes qué es un hidden service y cómo funciona el onion routing. Ahora, veremos cómo funciona un servicio oculto.</p>

<p>El modelo de un hidden service permite que no haya un nodo de salida y, además, que la dirección del servidor web también sea anónima, ya que funciona del siguiente modo:</p>

<p>El mensaje se envía por un túnel anónimo, es decir, por medio de un proceso de onion routing.</p>
<p>La petición se almacena en un directorio común.</p>
<p>El servidor web actúa como un usuario anónimo que consulta constantemente si existen peticiones a su dirección.</p>
<p>De este modo, se oculta la dirección IP real del servidor web del mismo modo que con la de cualquier usuario. La ventaja de esto es que no requiere de un nodo de salida, pero la desventaja es que puede tardar el doble que un onion routing normal.</p>

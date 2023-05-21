# Debian Installation
FROM	debian


# OS Package Updates
RUN	apt-get update
RUN	apt-get -y upgrade


# Instalación de Nginx y copiamos nginx.conf que hemos creado prviamente en carpeta correspondiente
RUN	apt-get install -y nginx
COPY nginx.conf /etc/nginx/nginx.conf


# Instalación de ssh-server y copiamos nginx.conf creada prviamente en carpeta correspondiente
RUN	apt-get install -y openssh-server
COPY	./sshd_config /etc/ssh/sshd_config


# Instalamos Sudo. Creamos usuario jorge y le metemos en grupo sudo
RUN apt-get update && \
      apt-get -y install sudo
RUN useradd -m jorge && RUN echo "jorge:ft_onion" | chpasswd && adduser docker sudo
# El comando chpasswd para agregar una contraseña al usuario
USER jorge
CMD /bin/bash
# Este comando se encarga de pasar valores por defecto a un contenedor. Entre estos valores se pueden pasar ejecutables.
# CMD a diferencia del comando RUN, los comandos que se pasen por medio de este método se ejecutan una vez que el contenedor se ha inicializado, mientras que RUN se utiliza para crear la imagen de un contenedor.


# Tor Installation
RUN	apt-get install -y tor
COPY	./torrc /etc/tor/torrc


# Ports
EXPOSE	42
EXPOSE	80


# Init Container
CMD	service nginx start	&& \
	service ssh start	&& \
	tor
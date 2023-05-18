# Debian Installation
FROM	debian

# OS Package Updates
RUN	apt-get update
RUN	apt-get -y upgrade

# Nginx Installation
RUN	apt-get install -y nginx
COPY nginx.conf /etc/nginx/nginx.conf

# SSH Installation
RUN	apt-get install -y openssh-server
COPY	./sshd_config /etc/ssh/sshd_config
# User ssh configuration
RUN useradd -m user
RUN echo "user:jorge" | chpasswd

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
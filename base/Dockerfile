FROM debian:latest

# Installation des packages nécessaires
RUN apt-get update && apt-get install -y openssh-server nano vim cron \
&& rm -rf /var/lib/apt/lists/* \
# Configuration du serveur SSH
&& sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config \
# Création de l'utilisateur ctf
&& useradd -m -s /bin/bash ctf \
&& ln -s /dev/null /home/ctf/.bash_history \
&& ln -s /dev/null /root/.bash_history \
# Ajout de la tâche cron pour redémarrer toutes les 30 minutes
&& echo '*/1 * * * * root /usr/sbin/service ssh start' > /etc/cron.d/restart-ssh \
&& chown -R root:root /home/ctf \
&& chmod 1333 /tmp /var/tmp

# Exposition du port SSH
EXPOSE 22

COPY entrypoint.sh /
RUN chmod 550 /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]

WORKDIR /home/ctf

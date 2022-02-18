# Dockers
# Preparación del equipo
1)	Creación del usuario “snoop”
2)	Instalación Dockers para Debian

**a.	Se eliminaron versiones previas**

sudo apt-get remove docker docker-engine docker.io containerd runc

**b.	Se ejecuto el comando de actualización**

sudo apt-get update

**c.	Se instalaron los paquetes para utilizar sobre HTTP**

$ sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

**d.	Se instaló la llave de GPG:**

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

**e. Se ejecuto el siguiente comando para estabilizar el repositorio**

$ echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

**f.	Se Instaló el Engine de Dockers**
$ sudo apt-get update
$ sudo apt-get install docker-ce docker-ce-cli containerd.io

## DESPUÉS DE LA INSTALACIÓN

**g. Se creó el grupo de Docker**

sudo groupadd docker

**h.	Se agregó el usuario de la cuenta al grupo de dockers**

sudo usermod -aG docker $USER

** i. Se comprobó que se podián ejecutar comandos de dockers sin necesidad de sudo**

docker run hello-world
Siendo la prueba exitosa 


**j.	Se verificarón permisos de usuario**

sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
$ sudo chmod g+rwx "$HOME/.docker" -R

# Escenario mtorices/my-apache2-ok”  

## Para este escenario se preparó el archivo Dockerfile con las siguientes líneas :

Dockerfile
FROM httpd:2.4
COPY ./public-html/ /usr/local/apache2/htdocs/


**Se creo un directorio local llamado ./public-html/  con el archivo index.html**

Se ejecutaron los comandos de dockers :
**Creación del Contenedor**

$ docker build -t mtorices/my-apache2-ok .
 

**Ejecución del contenedor**

$ docker run -dit --name my-running-app -p 8080:80 mtorices/my-apache2-ok

 

Al hacer la prueba a la página de pruebas el resultado fue satisfactorio ya que todavía faltaba agregar la parte del SSH y el usuario
 

## Prueba NO Satisfactorio con creación de usuario.
Se procedió a hacer una prueba similar a la anterior pero ahora incluyendo los parámetros de usuario los cuales se resumen en las siguientes líneas :
**Dockerfile con líneas adicionales de usuario**

FROM httpd:2.4
COPY ./public-html/ /usr/local/apache2/htdocs/
RUN useradd -ms /bin/bash web
USER web
WORKDIR /web


Esta es la única diferencia con la cual la parte web ya no funciona de la misma forma que el anterior, de hecho separa el contenedor para poder identificar por qué no trabajaba conforme a lo esperado

**Se ejecutaron los comandos de dockers :
Creación del Contenedor**

$ docker build -t mtorices/my-apache2-nok .
 

**Ejecución del contenedor**

$ docker run -dit --name my-running-app -p 8080:80 mtorices/my-apache2-nok

 

# **Al hacer la prueba a la página web  el resultado no fue satisfactorio ya que la página del servidor web no se desplegó cuando dentro del archivo de Dockerfile se encontraban las líneas correspondiente al usuario**

** Realicé 4 instalaciones en dos diferentes equipos y hasta el momento no he podido encontrar el error **

** En el primero tuve problemas de desempéño de la máquina  y en el segundo la página WEB no se desplegaba cuando había los comandos de usuario **
 
 

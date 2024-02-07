# Trabajamos en un fichero temporal
cd /tmp
# Descargamos el código de la aplicación de GitHub
git clone https://github.com/javiermmIBQ/BibliotecaJPA.git

# Movemos carpetas y ficheros para generar la estructura estandar de un WAR
cd BibliotecaJPA
cd build
mv classes ../src/main/webapp/WEB-INF
cd ..
cd src/main/webapp
sed -i 's/.*jakarta.persistence.jdbc.url.*/<property name="jakarta.persistence.jdbc.url" value="jdbc:mysql:\/\/192.168.18.128:3306\/biblioteca"\/>/' WEB-INF/classes/META-INF/persistence.xml


# Creamos el fichero WAR en la carpeta webapps de Tomcat
#
# "password" es la password del usuario de Ubuntu para poder ejecutar sudo
# cambiarla por la vuestra.
echo "profesor" | sudo -S jar -cvf /opt/tomcat/webapps/Biblioteca.war *

# Borramos todo para dejar la carpeta temporal limpia
echo "profesor" | sudo -S rm -rf /tmp/BibliotecaJPA
% DOTSYNC-SYNC(1) Version 2.0.1 | Manual del Usuario
% Teo Morales
% Marzo 2026

# DESCRIPCIÓN
Detalles sobre los mecanismos de sincronización que ofrece dotsync.

# Sincronización activa entre equipos

## Funcionamiento
Ambos equipos deben estar en la misma red y deben tener la misma versión de **dotsync** instalada.
En el equipo que va a exportar los archivos se ejecuta *dotsync export* y elige los contenidos a exportar bien mediante la línea de comandos ex:*dotsync export ~/.bashrc* o selecccionándolos en el menú interactivo.
Desde el equipo que quiere importar estas configuraciones se ejecuta *dotsync import* pasando como argumento la dirección IP del equipo que exporta.
Si se desea cambiar el puerto de comunicación, tanto en el cliente como en el servidor se deberá de especificar la opción **-p <puerto>**.
El puerto deberá ser el mismo tanto en el cliente como en el servidor.
Todos los archivos temporales generados y recibidos durante la exportación o la importación permanecerán en el sistema en la capeta *$HOME/.dotsync/.tmp*

## EXPORTACIÓN
Dotsync seguirá enlaces simbólicos mientras el archivo original pertenezca al repositorio.
Primero, se creará un archivo comprimido con los contenidos a exportar.
Después, se obtendrá el checksum del archivo comprimido con **sha256sum**.
Se creará otro archivo comprimido con el archivo comprimido de la exportación y el checksum.
Este nuevo archivo comprimido se cifrará simétricamente (con contraseña) usando **gpg**.
Por último, este archivo cifrado se envía al cliente que se conecte a través de **socat**.

## IMPORTACIÓN
El mecanismo de importación es inverso al de exportación, se realizan pocas comprobaciones adicionales.
Primero se realiza una prueba de conexión al host y se conecta para descargar el archivo.
Cuando se obtiene el archivo comprmido cifrado, se le pide al usuario que ponga la contraseña, esta contraseña la habrá definido el usuario que exporta los archivos.
Una vez se descifra este archivo, se descomprime para obtener el archivo comprimido con los contenidos a importar y el checksum.
Se comprueba que el checksum coincide con el del archivo recibido y se descomprime el tarball que contiene los archivos.
Por último se recorren los archivos obtenidos, se realizan comprobaciones y se mueven al repositorio.
En caso de existir conflictos entre los archivos descargados y los archivos del repositorio, dotsync permitirá al usuario elegir qué archivo conservar.

# Sincronización pasiva con repositorio remoto git

## FUNCIONAMIENTO
Dotsync usa **git** automáticamente para controlar el historial de los cambios realizados en el repositorio.
Eso le permite sincronizarse sin herramientas adicionales con servicios de hosting basados en **git**.
Algunos de estos son GitHub, CodeBerg, GitLab y Gitee.
La sincronización debe hacerse manualmente, ejecutando *dotsync sync push/pull* dependiendo de lo que se quiera hacer.

## CONFIGURACIÓN
Lo único que hay que configurar en dotsync es el enlace del repositorio remoto.
Se configura con el siguiente comando:

*dotsync sync set-remote <enlace/al/repositorio/remoto>*

El enlace al repositorio remoto puede reconfigurarse con ese mismo comando y se puede consultar con el comando *dotsync sync get-remote*.

## SUBIR LOS CAMBIOS AL REPOSITORIO REMOTO
Para subir los cambios al repositorio remoto, usa *dotsync sync push*. 
El comportamiento predeterminado de la opción *push* es realizar un **git-push(1)** sin argumentos adicionales.
Puedes definir opciones adicionales al final del comando.

Por ejemplo: si quieres subir los cambios al repositorio, sobreescribiendo los contenidos remotos cómo harias con *git push --force*, ejecutarías: 

*dotsync sync push --force*

## DESCARGAR CONTENIDO DEL REPOSITORIO REMOTO
Para descargar el contenido del repositorio remoto al repositorio local, usa *dotsync sync pull*.
El comportamiento predeterminado de la opción *pull* es realizar un **git-pull(1)** sin argumentos adicionales.
Puedes definir opciones adicionales al final del comando.

Por ejemplo: si quieres cargar los cambios del repositorio, teniendo en cuenta tus cambios como harías con *git pull --rebase*, ejecutarías: 

*dotsync sync pull --rebase*

## ERRORES EN LA SINCRONIZACIÓN
Errores y conflictos de *merge* deberán ser resueltos manualmente. 
Si *set-remote* falla, es posible que el servicio de hosting que utilices requiera usar SSH en lugar de HTTPS, consulta la documentación del servicio elegido.

# SOLUCIONAR ERRORES DE GIT
Dotsync no silenciará los errores de git.
Los errores o avisos de git deberán resolverse manualmente.
Consulta la documentación de **git(1)** para más información.

# COPYRIGHT
Coyright 2026 Teo Morales. Licencia GPLv3: GNU GPL versión 3 o posterior <https://gnu.org/licences/gpl.html>. Este es software libre: eres libre de modificar y redistribuirlo. NO HAY GARANTÍA, en medida de lo permitido por ley. 

% DOTSYNC-REPO(1) Version 1.0.0 | Manual del Usuario
% Teo Morales
% Marzo 2026

# DESCRIPCIÓN
Detalles avanzados sobre los mecanismos de dotsync de gestión del repositorio.

# OPCIONES
## **init** - Crea la carpeta del repositorio y configura los elementos necesarios para su funcionamiento:
1. Crea la carpeta del repositorio
2. Inicializa el repositorio git
3. Crea el archivo stow-local-ignore (extremadamente importante)
4. Crea un pequeño archivo README
Dotsync asume que el repositorio ha sido creado con éxito al realizar

## **add** [archivo1 directorio1 ...] - Añadir elementos al repositorio
Mueve los archivos seleccionados al repositorio y usa **stow** para generar enlaces simbólicos en la ruta original del archivo.
Llamar a add sin argumentos permitirá al usuario seleccionar los archivos mediante una interfaz gráfica.
Omite automáticamente los enlaces simbólicos y comprueba que los elementos indicados existen y son accesibles.
Para mover todo al repositorio, se hace uso de una función recursiva para poder mover con seguridad todos los elementos en un árbol de directorios.
Este proceso puede ser lento al mover carpetas con varias subcarpetas y archivos.
Para que **dotsync** ignore automáticamente ciertos tipos de archivos al añadirlos al repositorio, revisa las opciones de configuración de dotsync **dotsync-config(1)**.
Al terminar crea un commit para reflejar los cambios realizados.

## **remove** [archivo1 directorio1 ...] - Quitar elementos del repositorio
Mueve archivos del repositorio a sus ubicaciones originales .
Llamar a remove sin argumentos permitirá al usuario seleccionar los archivos mediante una interfaz gráfica.
Se encarga de desvincular los enlaces simbólicos generados por stow de forma segura.
Saca los archivos del repositorio comprobando errores en cada paso.
Al terminar crea un commit para reflejar los cambios realizados.

## **list**
Muestra la estructura de archivos y directorios del repositorio.
Ignora automáticamente los archivos y directorios creados automáticamente.
Se recomienda tener instalado **eza** para poder visualizar la estructura de directorios, si no está instalado, se usará **tree**.
Se visualizarán archivos y directorios hasta 5 niveles por debajo de la raíz del repositorio ($HOME).

## **edit** [archivo1 archivo2 ...]
Usa el editor de texto configurado en $EDITOR para editar los archivos deseados.
Si la variable $EDITOR no está definida, permitirá añadirla al **.bashrc** mediante un menú interactivo que dará a elegir entre algunos editores de texto populares instalados.
Las modificaciones en archivos realizadas manualmente (sin dotsync) no serán guardadas automáticamente y podrían perderse.
La edición de múltiples archivos puede fallar y depende del editor de archivos usado.
Si se ejecuta sin argumentos la elección será mediante un menú interactivo.

## **log**
Ver de forma interactiva el historial de git del repositorio.
La previsualización muestra la comparación (en formato git-diff) entre los archivos alterados en ese commit y su estado actual.
Al seleccionar un commit mostrará el diff completo a través de un pager.
Se usará **less(1)** cómo pager predeterminado, si bat está instalado, se usará en lugar de less.

## **undo**
Reestablece el repositorio al estado en el que estaba en el commit seleccionado.
No reescribirá el historial de cambios del repositorio.
Creará un nuevo commit **VOLVER** con los archivos alterados.
Si hay archivos que no existían en ese punto del repositorio, volverán a su ubicación original al igual que con **dotsync remove** y su referencia en el repositorio se eliminará.

# COPYRIGHT
Coyright 2026 Teo Morales. Licencia GPLv3: GNU GPL versión 3 o posterior <https://gnu.org/licences/gpl.html>. Este es software libre: eres libre de modificar y redistribuirlo. NO HAY GARANTÍA, en medida de lo permitido por ley. 
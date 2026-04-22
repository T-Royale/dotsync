% DOTSYNC(1) Version 2.2 | Manual del Usuario
% Teo Morales
% Marzo 2026

# NOMBRE
dotsync - Gestor de dotfiles interactivo basado en FZF, Git y GNU Stow.

# DESCRIPCIÓN
**dotsync** es una herramienta interactiva para gestionar tus archivos de configuración. 
Soporta:

1. Gestión interactiva del repositorio mediante menús de selección con fzf.
2. Control de versiones automático con git.
3. Rollback interactivo del repositorio mediante una interfaz gráfica.
4. Exportación e importación de archivos sobre la red con cifrado.
5. Sincronización del repositorio con servicios de hosting basados en git.

# SINOPSIS
**dotsync** [OPCIÓN] [ARGUMENTOS]

# DEPENDENCIAS

## Gestión del repositorio
**git**, **stow**, **fzf**

## Exportación e importación
**tar**, **gpg**, **sha256sum**, **socat**

### Si alguna dependencia no existe, dotsync sugerirá un comando de instalación haciendo una petición con curl a **www.command-not-found.com**, este proceso fallará si curl no está instalado.

# OPCIONES

## REPOSITORIO - Más detalles en dotsync-repo(1)

**init**
: Inicializa el repositorio en ~/.dotsync y configura la estructura base.
: Dotsync se comportará de manera inesperada si el repositorio no se inicializa correctamente.

**add** [archivo1 directorio1 ...]
: Añade los archivos o directorios al repositorio.
: Si se ejecuta sin argumentos la elección será mediante un menú interactivo.

**remove** [archivo1 directorio1 ...]
: Quita un archivo del repositorio y lo devuelve a su ubicación original.
: Si se ejecuta sin argumentos la elección será mediante un menú interactivo.

**list**
: Muestra los archivos y directorios dentro del repositorio dotsync.

**edit** [archivo1 archivo2 ...]
: Usa el editor de texto configurado en $EDITOR para editar los archivos deseados.
: Las modificaciones en archivos realizadas manualmente (sin dotsync) no serán guardadas automáticamente y podrían perderse.
: La edición de múltiples archivos puede fallar y depende del editor de archivos usado.
: Si se ejecuta sin argumentos la elección será mediante un menú interactivo.

**log**
: Muestra los cambios realizados en el repositorio.
: Al seleccionar un cambio, mostrará la comparación de ese punto con el estado actual del repositorio.

**undo**
: Deshacer cambios en el repositorio, usa un menú interactivo para seleccionar el punto de restauración.
: El historial de cambios no se pierde al restaurar un punto anterior.
: Puedes deshacer el undo al igual que cualquier cambio realizado mediante dotsync.

## SINCRONIZACIÓN - Más detalles en dotsync-sync(1)

**export** [-p PUERTO] [archivo1 directorio1 ... {all}]
: Envia archivos a otro equipo (ejecutar con all para exportar repositorio entero).
: El puerto predeterminado es TCP:57342.
: Si se ejecuta sin argumentos la elección de archivos será mediante un menú interactivo.

**import** HOST [-p PUERTO]
: Se conecta a un servidor remoto (HOST), descarga los archivos y los integra en el repositorio local.
: El equipo que exporta su configuración debe estar esperando conexiones para poder iniciar una conexión.
: El puerto predeterminado es TCP:57342.

**sync** [OPERACIÓN]
: Permite sincronizar el repositorio local con un repositorio remoto de un servicio basado en git.
: Es compatible con servicios cómo GitHub, GitLab, CodeBerg...
: **OPERACIONES:**
:   **push** - Subir los cambios al repositorio remoto.
:   **pull** - Descargar los cambios del repositorio remoto al local.
:   **set-remote** - Define el repositorio remoto con el que sincronizar los cambios.
:   **get-remote** - Obtener el enlace del repositorio remoto que está sincronizado actualmente.

# SEGURIDAD
Las exportaciones e importaciones están protegidas mediante:

1. **Cifrado AES-256** simétrico (con contraseña) a través de GPG.
2. **Checksum SHA-256** para asegurar que el archivo no fue alterado en tránsito.

# EJEMPLOS
*dotsync add ~/.bashrc*
: Añade el archivo .bashrc al repositorio dotsync.

*dotsync remove ~/.bashrc*
: Saca el archivo .bashrc del repositorio devolviendolo a su ubicación original.

*dotsync edit ~/.bashrc*
: Edita el archivo .bashrc.

*dotsync export all*
: Exportar el repositorio entero a otro equipo.

*dotsync import 192.168.1.33*
: Importar contenidos del repositorio de 192.168.1.33

# PÁGINAS DEL MANUAL ADICIONALES
**dotsync-repo(1)** 	- Detalles avanzados sobre la gestión del repositorio.

**dotsync-sync(1)** 	- Información adicional sobre la sincronización y replicación

**dotsync-config(1)**	- Opciones de configuración y personalización de dotsync.

**dotsync-ui(1)**		- Configuración de la interfaz de usuario.

# COPYRIGHT
Coyright 2026 Teo Morales. Licencia GPLv3: GNU GPL versión 3 o posterior <https://gnu.org/licences/gpl.html>. Este es software libre: eres libre de modificar y redistribuirlo. NO HAY GARANTÍA, en medida de lo permitido por ley. 

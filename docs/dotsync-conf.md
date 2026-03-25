% DOTSYNC-CONF(1) Version 1.0.0 | Manual del Usuario
% Teo Morales
% Marzo 2026

# DESCRIPCIÓN
Configuración del repositorio.

# MÉTODO DE CONFIGURACIÓN
Todos los elementos configurables de dotsync, se configurarán modificando manualmente el archivo "~/.config/dotsync/dotsync.conf".
El archivo (aunque la extensión sea .conf) es un script de bash que deberá contener únicamente **redefiniciones y modificaciones de variables**.
Dotsync cargará este archivo temporalmente y cargará las variables válidas antes de realizar ninguna acción.
En la versión actual de **dotsync**, no se verifica que el archivo de configuración contenga elementos válidos, si contiene errores de sintaxis, dotsync fallará al cargar el archivo y saldrá del programa de forma segura.
Usa comodines, globbing y variables de entorno en los elementos de este archivo.

# ELEMENTOS CONFIGURABLES

## EXCLUSIÓN DE PATRONES AL AÑADIR DIRECTORIOS
Antes de añadir directorios enteros con *dotsync add*, se puede configurar una lista de patrones a ignorar automáticamente.
Los patrones se compararán directamente con la ruta completa del elemento y se evitará mover al repositorio si coincide con alguno de los elementos del array **conf_exclude**.
Usa comodines para

# EJEMPLO

Para que dotsync ignore automáticamente archivos con la extensión .log y la carpeta de plugins de neovim:

declare -a conf_exclude=(

	"*.log" 
	
	"*/nvim/*/plugins/*"

)


# COPYRIGHT
Coyright 2026 Teo Morales. Licencia GPLv3: GNU GPL versión 3 o posterior <https://gnu.org/licences/gpl.html>. Este es software libre: eres libre de modificar y redistribuirlo. NO HAY GARANTÍA, en medida de lo permitido por ley. 

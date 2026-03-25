% DOTSYNC-UI(1) Version 1.0.0 | Manual del Usuario
% Teo Morales
% Marzo 2026

# DESCRIPCIÓN
Configuración y personalización de la interfaz de usuario de dotsync.

# Elementos personalizables

## EDITOR DE TEXTO
Al editar un documento con *dotsync edit*, dotsync invocará al editor de texto definido en la variable de entorno $EDITOR.
Si esta variable no existe, dotsync mostrará un menú interactivo con algunos editores de texto populares y lo exportará automáticamente al archivo **.bashrc**.
Si quieres configurar manualmente un editor de texto o configurar uno que no aparece en el menú proporcionado, puedes escribir la siguiente línea en el archivo **~/.bashrc**

**export EDITOR=nano**		# Reemplaza nano con el comando para invocar tu editor favorito

## SISTEMA DE PAGINACIÓN
Para visualizar diffs de git, se usa **less** cómo sistema de paginación.
Si **bat** está instalado, se usará en su lugar.
**bat** es un clon de **cat(1)** con alas, ofrece resaltado de sintaxis, paginación automática y búsqueda de patrones mejorada.
Consulta el método de instalación de bat para tu distribución en <https://github.com/sharkdp/bat/blob/master/README.md>

## ÁRBOL DE DIRECTORIOS (**LIST**)
Al ejecutar *dotsync list* para ver en forma de árbol los elementos del repositorio, se usará **tree** si **eza** no está instalado.
**eza** muestra colores e iconos en los archivos y proporciona más funcionalidades que **ls** o **tree**.
Consulta el método de instalación de eza para tu distribución en <https://eza.rocks>

# RESUMEN
No hay muchas formas de personalizar la interfaz de usuario en dotsync.
Define la variable entorno $EDITOR en tu sistema con el editor de texto que te resulte más cómodo.
Instala **eza** (ls mejorado) y **bat** (cat mejorado) para una mejor experiencia.

# COPYRIGHT
Coyright 2026 Teo Morales. Licencia GPLv3: GNU GPL versión 3 o posterior <https://gnu.org/licences/gpl.html>. Este es software libre: eres libre de modificar y redistribuirlo. NO HAY GARANTÍA, en medida de lo permitido por ley. 
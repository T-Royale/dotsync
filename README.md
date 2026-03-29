# dotsync
Mi proyecto final para el ciclo formativo de grado medio en sistemas microinformáticos y redes.
## Objetivo: 
Desarollar una herramienta que permita editar, gestionar y compartir archivos de configuración de Linux (`dotfiles`) de forma segura, intuitiva y visual.
## Dependencias:
### Para la instalación
+ GNU Make	- Instalación automática
+ pandoc	- Compilación de páginas de manual
+ gzip		- Compresión de las páginas del manual
### De **dotsync**
+ curl		- Obtener contenido remoto
+ stow		- Gestionar enlaces simbólicos
+ fzf		- Menú interactivo
### Para exportar/importar contenido entre equipos
+ tar 		- Creación de archivos
+ sha256sum - Calcular checksum
+ gpg 		- Cifrar archivos
+ socat		- Enviar archivos por la red
### Opcionales
+ eza		- ls mejorado
+ bat		- cat mejorado
## Instalación completa:
```
git clone https://github.com/T-Royale/dotsync dotsync
cd dotsync
make install
```
## Estado: 
En pruebas
Template de memoria ELO UTFSM
=============================

Este template cumple con las normas del departamento de
electrónica de la UTFSM para los trabajos de memoria. Está
pensado para escribir la memoria en Markdown(Pandoc), sin
embargo también se puede usar para escribir en LaTeX (ver
comentarios sobre el uso de LaTeX mas abajo).

Uso
---

El template funciona nativamente en Ubuntu 15.10. Y NO
funciona en Ubuntu 14.04. Sin embargo se ha creado una
imagen de Docker que funciona en Linux, Mac y Windows.

### Instalación

Primero es necesario instalar Docker. Para esto hay que
seguir los pasos en:
<https://docs.docker.com/engine/installation/>.

Luego se puede crear un contenedor con el comando:

    docker create -it --name=memoria -v ~/memoria:/home/mtemplate/TemplateMemoria cganterh/template_memoria

### Ejecución

Para iniciar el contenedor hay que ejecutar:

    docker start -ia memoria

Este último comando abre una consola con la cual es posible
compilar los archivos que se habrán creado en la carpeta
`~/memoria`. Para compilar el template solo hace falta
ejecutar el comando `make`. Para salir de la consola del
contenedor hay que apretar `control+d`.

### Configuración

Para configurar tu proyecto modifica el archivo
`config.yaml`.

LaTeX
-----

Si quieres escribir con LaTeX no hay problema! Solo tienes
que modificar los archivos `makefile` que hay en cada
carpeta dentro de `src` para que tus archivos `.tex` no se
eliminen cuando hagas un `make clean`. Además es conveniente
modificar los archivos ocultos `.gitignore` dentro de `src`
para que tus archivos `.tex` no sean ignorados por `git`.

Otra opción, más fácil pero menos limpia, es escribir LaTeX
directamente en los archivos `.md`. Esto funciona debido a
que Pandoc acepta código LaTeX dentro de los archivos de
Markdown y no lo modifica al compilar desde Markdown a
LaTeX.

Colaboración
------------

Los pull requests son bienvenidos! Sería genial si alguien
se motivara con un fork para otras carreras/universidades.

Además siempre es útil que prueben el template en más
sistemas para poder agregarlos a la lista de distribuciones
soportadas.

Por hacer
---------

- [x]   Hacer un backport de los makefiles de
        <https://github.com/cganterh/memoria>.
- [x]   Crear ejemplos de cómo utilizar imágenes SVG.
- [x]   Crear un archivo `Dockerfile`.
- [ ]   Simplificar el template.
- [ ]   Verificar la compatibilidad del template con el
        template que provee pandoc.
- [ ]   Agregar una opción en la configuración para activar
        y desactivar los márgenes para imprimir por ambas
        caras.
- [x]   Agregar nano al `Dockerfile` para poder usarlo con
        `git commit`.
- [x]   Agregar el paquete de español de LaTeX al
        `Dockerfile`.
- [ ]   Quitar los comentarios enojados de la bibliografía.

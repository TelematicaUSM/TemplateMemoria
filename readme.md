Template de memoria ELO UTFSM
=============================

Este template cumple con las normas del departamento de
electrónica de la UTFSM para los trabajos de memoria. Está
pensado para escribir la memoria en Markdown(Pandoc), sin
embargo también se puede usar para escribir en LaTeX (ver
comentarios sobre el uso de LaTeX mas abajo).

Uso
---

El template funciona sin problemas en Ubuntu 15.10. NO
funciona en Ubuntu 14.04. No he probado otras versiones de
Ubuntu/Linux.

### Ubuntu 15.10

####Requisitos

-   Tener activado el repositorio Multiverse.
-   Make 4.0.
-   Git.
-   Sudo.

####Instalación

    git clone https://github.com/cganterh/template_memoria.git
    cd template_memoria
    make

Esto debiera instalar todas las dependencias y compilar el
documento de ejemplo.

####Configuración

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

Colaboración
------------

Los pull requests son bienvenidos! Sería genial si alguien
se motivara con un fork para otras carreras/universidades.

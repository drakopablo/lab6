ARG PI_NB_SIZE=1000000 
ARG PYTHON_VERSION=3.7
FROM python:${PYTHON_VERSION}
#FROM python:3.7

# Añadimos algunas etiquetas (opcionales)
LABEL org.opencontainers.image.authors="Pablo Guillén Marquina <pablo.guillen1@um.es>"

# Definimos el tipo de "SHELL" a utilizar. Este shell sobreescribirá cualquier shell definido anteriormente; además, no hará falta definirlo de nuevo al usar el comando "RUN". Dado que la imagen del contenedor se crea sobre Linux, utilizamos el siguiente shell:
SHELL ["/bin/sh", "-c"]

# Copiamos el fichero que contiene las dependencias y las instalamos mediante "pip"
COPY requirements.txt /tmp/
RUN pip install --requirement /tmp/requirements.txt

# Copiamos el resto del proyecto al directorio "/home"
COPY lab6-jupyter-files.zip /tmp/
RUN unzip -q /tmp/lab6-jupyter-files.zip -d /home/

# Cambiamos el directorio de trabajo a "/home"
WORKDIR /home

# Hacemos esto para "refrescar" el valor de la variable
ARG PI_NB_SIZE
#ENV PI_NB_SIZE=1000000 

# Ejecutamos los trabajos. 
RUN ipython /home/pi-solution.ipynb ${PI_NB_SIZE}
#RUN ipython pi-solution.ipynb 1000000
RUN ipython /home/kmer-solution.ipynb


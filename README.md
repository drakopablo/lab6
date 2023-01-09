# lab6
Laboratorio 6 de HPC-Bio

Para utilizar el fichero "Dockerfile" se debe de colocar los siguientes ficheros en la misma carpeta:
  - Dockerfile 
  - requirements.txt
  - lab6-jupyyer-files.zip
  
Y ejecutar el siguiente comando en la linea de comandos:
  DOCKER_BUILDKIT=0 COMPOSE_DOCKER_CLI_BUILD=0 docker build --progress=plain . > [nombre_fichero_salida]

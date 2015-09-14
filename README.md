# Haar Trainer #

Este repositorio está creado con la finalidad de agilizar el proceso de entrenamiento de clasificadores HAAR.

Para clonar este repositorio:

```
#!shell

git clone https://bitbucket.org/sandiego206/haar_trainer.git
```

Contiene dos formas de entrenamiento:

1. Cropped Images:  Donde usaremos imágenes positivas que **únicamente** contienen el objeto, y negativas que no lo incluyen. 
En este caso creamos imágenes marcadas combinando positivas y negativas y creamos archivos de descripción automáticamente.

2. Marked Images:  En esta forma de entrenamiento las imágenes positivas tienen el objeto a encontrar **marcado** en un archivo de descripción, 
y las imágenes negativas no lo incluyen.


# MODO DE USO #

### Método 1: Cropped Images ###

Requisitos:

1. Un directorio con las imágenes **positivas** y una lista de estas en el mismo directorio llamada *positives.txt*

2. Un directorio con las imágenes **negativas** y una lista de estas en el mismo directorio llamada *negatives.txt*

Para esta forma de entrenamiento encontrará lo siguiente:

* **CONFIG_HAAR.cfg**:  Aquí definimos los parámetros de configuración y entrenamiento, e indicamos la ubicación de los directorios de entrada y salida.
* **01_create_samples.sh**:  Con este ejecutable combinamos las imágenes positivas y negativas para crear ejemplos nuevos y archivos de descripción automáticamente.
* **02_combine_samples.sh**: Con este archivo combinamos las salidas anteriores en un vector el cual será leido por opencv para iniciar el entrenamiento.
* **03_train_cascade.sh**:  Por último, lanzando este ejecutable iniciamos el entrenamiento, puede tardar varias horas.
* **00_one_time_script.sh**: Lanza todos los ejecutables uno tras otro, en un solo script.

### Método 2: Marked Images ###

### TO DO ###
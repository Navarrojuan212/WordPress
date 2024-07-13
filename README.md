# Despliegue de Servidor WordPress con Docker

>[!IMPORTANT]
> **Requisitos previos**
> - Una instancia de **EC2** con **Ubuntu**.
> - Acceso **SSH** a la instancia de **EC2**.

## Instalar Docker
- Actualizar el sistema

```bash
sudo apt update
```
- Instalar Docker
  
```bash
sudo apt install docker.io -y
```

- Iniciar el servicio Docker
```bash
sudo service docker start
```
- Agregar tu usuario al grupo Docker
```bash
sudo usermod -aG docker $USER
```

- Verificar la instalación de Docker
```bash
docker version
```

## Instalar Docker Compose
```bash
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```
## Descargar el Repositorio
```bash
git clone https://github.com/Navarrojuan212/WordPress.git
```
### Estructura del Repositorio
```bash
cd WordPress
```
```bash
tree -I .git -a 
```
Debería obtener una salida como esta
```bash                                                                                                                         
├── docker-compose.yml
├── Dockerfile
├── .gitignore
├── pu.sh
└── README.md

1 directory, 5 files

```

# Desplegar WordPress en Docker
- Dentro del repositorio Wordpress ejecute lo siguiente:

>[!IMPORTANT]
>Por favor, asegúrate de crear un archivo `.env` en la siguiente ruta :arrow_right: `Cloud-Automations/WordPress/.env`
> ```bash
> nano .env
> ```
> Este archivo debe contener las variables de entorno necesarias para que el proyecto funcione correctamente. Sin este archivo, la aplicación no funcionará como se espera.
> ```bash
>WORDPRESS_DB_HOST=db
> WORDPRESS_DB_USER=wordpress
> WORDPRESS_DB_PASSWORD=wordpress
> WORDPRESS_DB_NAME=wordpress
> MYSQL_ROOT_PASSWORD=root_password
> MYSQL_DATABASE=wordpress
> MYSQL_USER=wordpress
> MYSQL_PASSWORD=wordpress

>[!CAUTION]
>Asegúrate de que las variables estén configuradas correctamente según tu entorno local o de producción.

## Iniciar los servicios con Docker Compose
```bash
docker-compose up -d --build
```


>[!TIP]
> **Detener y Eliminar los contenedores**
> ```bash
> docker-compose down

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
git clone https://github.com/Navarrojuan212/Cloud-Automations.git
```
### Estructura del Repositorio

```bash
tree Cloud-Automations -I .git
```
Debería obtener una salida como esta
```bash                                          
Cloud-Automations
├── .gitignore
├── pu.sh
├── README.md
└── WordPress
    ├── docker-compose.yml
    ├── Dockerfile
    └── README.md
```

# Desplegar WordPress en Docker
- Acceda a la carpeta de Wordpress y ejecute el comando
```bash
cd Cloud-Automations/WordPress
```

>[!IMPORTANT]
>Por favor, asegúrate de crear un archivo `.env` en la siguiente ruta :arrow_right: `Cloud-Automations/WordPress/.env`
> ```bash
> nano .env
> ```
> Este archivo debe contener las variables de entorno necesarias para que el proyecto funcione correctamente. Sin este archivo, la aplicación no funcionará como se espera.
> ```bash
> WORDPRESS_DB_HOST=IP
> WORDPRESS_DB_USER=user
> WORDPRESS_DB_PASSWORD=your_secure_password
> WORDPRESS_DB_NAME=wordpress

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

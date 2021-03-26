# django_shopping_docker
This is a shopping website developed with Django framework, and the deelopment environment is created with Docker.

## Preparation
Install docker on your computer, both docker and docker-compose. Check [docker](https://docs.docker.com/get-docker/) for more details.

If you are using Windows 10 computer, change docker to "docker in Linux".

Clone this project to your computer.

In this project, Port 8001 and 8002 are needed. Port 8002 is used to open phpmyadmin, and port 8001 is used for website.
If any of them are used, edit the docker-compose.yaml file.

```yaml
phpmyadmin:
        image: phpmyadmin/phpmyadmin:latest
        ports:
            - 8002:80
```
and 
```yaml
myapp:
        ports:
            - "8001:8000"
```

## Start the project
Open terminal and change the directory to where docker.compose.yaml is. 
Run command: 
```bash
docker-compose up --build
```

When it is ready, open browser and open page with url: http://127.0.0.1:8001/product to check the project.

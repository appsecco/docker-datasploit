# Alpine Linux Docker for Datasploit

### Software required to use docker container
- Docker (Tested version 1.12.1)

### Steps to use the container
- Pull the docker-datasploit image from the docker hub https://hub.docker.com/r/appsecco/datasploit

```
docker pull appsecco/datasploit:alpine
```

- Use the docker container with interactive shell from the host system

```
docker run -p 8000:8000 -it appsecco/datasploit:alpine
```
- Then add the “API_KEYS” to the “/opt/datasploit/config.py”
- Then start the mongodb, rabbitmq and celery

```
mongod --fork --logpath datasploitDb/mongodb.log --dbpath datasploitDb
cd /datasploit/core
nohup C_FORCE_ROOT=root celery -A core worker -l info --concurrency 20  &
nohup python manage.py runserver 0.0.0.0:8000 &
```
- Then navigate to the browser http://localhost:8000
- If you want to use command line scripts. You can navigate to “/opt/datasploit/” in docker container

```
python domainOsint.py -d <domain_name>
```

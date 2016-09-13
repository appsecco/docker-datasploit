# docker-datasploit
Docker container for datasploit framework

- Here is a medium post about the release [https://medium.com/appsecco/docker-container-for-datasploit-26953f175e21](https://medium.com/appsecco/docker-container-for-datasploit-26953f175e21)

The datasploit docker container is created by using ubuntu:16.04 (Xenial Xerus) and it will install all the dependencies to quick start the working setup. 

### Software required to use docker container

- Docker (Tested version 1.12.1)

### Steps to use the container

- Pull the docker-datasploit image from the docker hub [https://hub.docker.com/r/appsecco/datasploit](https://hub.docker.com/r/appsecco/datasploit)

```
docker pull appsecco/datasploit
```

- Use the docker container with interactive shell from the host system

```
docker run -p 8000:8000 -it appsecco/datasploit
```

- Then add the “API_KEYS” to the “/opt/datasploit/config.py”
- Then start the mongodb, rabbitmq and celery

```
service rabbitmq-server start
mongod --fork --logpath datasploitDb/mongodb.log --dbpath datasploitDb
cd /opt/datasploit/core
nohup C_FORCE_ROOT=root celery -A core worker -l info --concurrency 20 &
nohup python manage.py runserver 0.0.0.0:8000 &
```

- Then navigate to the browser [http://localhost:8000](http://localhost:8000)

- If you want to use command line scripts. You can navigate to “/opt/datasploit/” in docker container

```
python domainOsint.py -d <domain_name>
```

- Read more about tool in documentation http://www.datasploit.info/en/latest

Please feel free to make a pull request or tweet to me [@madhuakula](https://twitter.com/madhuakula) for improvements and suggestions.

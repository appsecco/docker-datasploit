# docker-datasploit
Docker container for datasploit framework

- Here is a medium post about the release [https://medium.com/appsecco/docker-container-for-datasploit-26953f175e21](https://medium.com/appsecco/docker-container-for-datasploit-26953f175e21)


### [Docker Image v1.0 Version](/v1.0/)

The datasploit docker container is created by using `python:2.7-stretch` and it will install all the dependencies to quick start the working setup. 

### Software required to use docker container

- Docker (Tested version 17.X-ce)

### Steps to use the container

- Pull the docker-datasploit image from the docker hub [https://hub.docker.com/r/appsecco/datasploit](https://hub.docker.com/r/appsecco/datasploit)

```
docker pull appsecco/datasploit:1.0
```

- Start the docker container with volume mounts

```
docker run --name datasploit -v `pwd`/config.py:/opt/datasploit/config.py:ro -v `pwd`:/opt/datasploit/data -d appsecco/datasploit:1.0
```

- Use the docker container with interactive shell from the host system

```
docker exec -it datasploit bash
```

- Then add the `API_KEYS` to the `config.py` in your host and it will get updated in container automatically

- If you want to use command line scripts. You can navigate to `/opt/datasploit/` in docker container

```
python usernameOsint.py username
```

- Read more about tool in documentation http://www.datasploit.info/en/latest

Please feel free to make a pull request or tweet to me [@madhuakula](https://twitter.com/madhuakula) for improvements and suggestions.

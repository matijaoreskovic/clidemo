## How to use with docker

First is needed to build an application. The builder used in this demo is Gradle provided as Docker container. Container mounts to the current folder and builds an app. After the app has been created, the container is automatically discarded and stopped. 
```bash
docker run --rm -u gradle -v "$PWD":/home/gradle/project -w /home/gradle/project gradle gradle clean build
```

After the creation of `.jar` file inside `/build/libs/` app is ready to be packed as Docker image itself. To run `.jar` files and apps Java; jdk is required. To avoid installing jdk and wasting time on that process, jdk preinstalled already exists as Docker image.

For creating our custom Docker image, Dockerfile provided in this repo is used. Content of file is next:
```dockerfile
FROM openjdk:11-jre
#defining predinstall jdk11 image to build on top off

WORKDIR /app
#defined working directory

COPY . .
#copying all files from current host folder to image working directory

ENTRYPOINT [ "/app/run-cli.sh" ]
#command that will execute upon starting the container
```

For applying Dockerfile run:
```bash
docker build -t dockerHubUsername/containerName:version .
```
where:
-   `-t` stands for `tag` and tags created image with entered parameters
-   `dockerHubUsername` users username for [DockerHub](https://hub.docker.com/)
-   `containerName` is arbitrarily name of image
-   `version` is image version (eg. alpha)

Dot (.) on the end of command represents that Dockerfile is located within current folder.

### After the build is complete you should get similar result:
<br>

![after build](https://user-images.githubusercontent.com/102029624/175520209-6b806d79-212c-42e6-9ca5-4ccb3f2d5793.png)

Next step is to run and try image. That is accomplished using:
```bash
docker run -i -t --name cli-test mdockerHubUsername/containerName:version
```
where:
-   `-i` keeps STDIN opened
-   `-t` allows user to connect via terminal
-   `--name` is any arbitrarily name of container (eg. cli-test)
### And response should bi like this:
<br>

![cli](https://user-images.githubusercontent.com/102029624/175520213-721bf93f-f587-4cbc-9e7c-9e0b6dacd26d.png)


FROM openjdk:11-jre

WORKDIR /app

COPY . .

ENTRYPOINT [ "/app/run-cli.sh" ]
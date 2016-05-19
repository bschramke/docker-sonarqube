# docker-sonarqube
SonarQube in Docker

## Build image
```
make build
```
or
```
docker build -t bschramke/sonarqube:5.5 --rm .
```

## Run
```
make run
```
or
```
docker run -d --name bschramke/sonarqube -p 9000:9000 -p 9092:9092 bschramke/sonarqube:5.5
```

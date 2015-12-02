# docker-teamspeak3

## Requirements
- [docker](https://github.com/docker/docker)
- [docker-compose](https://github.com/docker/compose) (optional)

## Clone
```sh
git clone git@github.com:svagi/docker-teamspeak3.git
cd docker-teamspeak3
```

## With docker
The quickest way to start a new teamspeak3 server is using a few [docker](https://github.com/docker/docker) commands.

### Build
```sh
docker build -t ts3server .
```

### Run
```sh
docker run -d -p 9987:9987/udp -p 10011:10011/tcp -p 30033:30033/tcp --restart=always --name=ts3server ts3server
```

### Logs
```sh
docker logs ts3server
```
**IMPORTANT**: After first run, you should find server admin token and server query admin account in server logs.

## With docker-compose
More convenient way is through the configuration file  [docker-compose](https://github.com/docker/compose).

### Run server
```sh
docker-compose up -d
```
See: [default configuration](docker-compose.yml)

### Logs
```sh
docker-compose logs
```
**IMPORTANT**: After first run, you should find server admin token and server query admin account in server logs.

#### Initial files

If you have some initial files, for example license key, whitelist, blacklist or even sqllite db, you can place them to [init folder](init). Everything from [init folder](init) will be used at build time of docker image.

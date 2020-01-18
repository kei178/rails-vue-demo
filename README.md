# README

A dockerlized demo app with Rails and Vue.js.

## Requirements

- [Git](https://git-scm.com/)
- [Docker](https://www.docker.com/)
- [docker-compose](https://docs.docker.com/compose/)

## Development

Puma + Webpack Dev Server + MySQL

### Run

```
docker-compose up
```

You can access the server at `http://localhost:3000`.

If you change something, execute the following command, instead:

```
docker-compose up --build
```

### Shutdown

```
docker-compose down
```

### Test

With the running app service:

```
docker-compose exec app ./bin/rspec
```

## Production Mock

Puma + Nginx + MySQL

### Run

```
docker-compose -f docker-compose-prod.yml up
```

You can access the server at `http://localhost`.

If you change something, execute the following command, instead:

```
docker-compose -f docker-compose-prod.yml up --build
```

### Shutdown

```
docker-compose down
```

# Useful docker commands

## Removing images, containers, volumes, and networks

### Remove images

Remove all images not used by existing containers:
```sh
docker image prune -a
```

Remove dangling images:
```sh
docker image prune
```

Limit which images are pruned using filterting expressions:
```sh
docker image prune -a --filter "until=24h"
```

### Remove containers

See all containers, including stopped containers:
```sh
docker ps -a
```

Remove stopped containers:
```sh
docker container prune
```

### Remove volumes

Remove unused volumes:
```sh
docker volume prune
```

Remove volumes with a limited scope:
```sh
docker volume prune --filter "label!=keep"
```

### Remove networks

Remove networks which aren't used by any containers:
```sh
docker network prune
```

Remove networks with a limited scope:
```sh
docker network prune --filter "until=24h"
```

### Remove everything

Volumes are not pruned by default when running `docker system prune`,
and must be specified with the `--volumes` flag.

To remove everything (including volumes):
```sh
docker system prune --volumes
```

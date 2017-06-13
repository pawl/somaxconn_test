# SOMAXCONN Test

An attempt to build a gunicorn + nginx + flask example that will begin to these errors:
> [error] 2388#0: *208027 connect() to unix:/tmp/gunicorn.sock failed (11: Resource temporarily unavailable) while connecting to upstream

The theory is that net.core.somaxconn needs to be increased to solve this problem: https://serverfault.com/a/513334

## Docker Commands

### Building the image
`docker build -t somaxconn_test .`

### Running the container (with default net.core.somaxconn=128)
`docker run -p 80:80 somaxconn_test`

### Running the container (with net.core.somaxconn bumped to 1024)
`docker run -p 80:80 --sysctl net.core.somaxconn=1024  somaxconn_test`

### Poking around inside the container
`docker run -it somaxconn_test sh`

## Load Testing
`ab -n 1000 -c 200 http://127.0.0.1/`

## Outcome

Bumping the net.core.somaxconn did end up making the "Resource temporarily unavailable" errors go away.

# SOMAXCONN Test

An attempt to build a gunicorn + nginx + flask example that will begin to these errors:
> [error] 2388#0: *208027 connect() to unix:/tmp/gunicorn.sock failed (11: Resource temporarily unavailable) while connecting to upstream

The theory is that SOMAXCONN needs to be increased to solve this problem: https://serverfault.com/a/513334

## Docker Commands

### Building the image
`docker build -t somaxconn_test .`

### Running the container
`docker run -p 80:80 somaxconn_test`

### Poking around inside the container
`docker run -it somaxconn_test sh`

## Load Testing
`ab -n 1000 -c 200 http://127.0.0.1/`

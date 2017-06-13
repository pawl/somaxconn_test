import multiprocessing

bind = 'unix:/tmp/gunicorn.sock'

workers = multiprocessing.cpu_count() * 2 + 1
worker_class = 'gevent'
worker_connections = 200

max_requests = 1000
max_requests_jitter = 50

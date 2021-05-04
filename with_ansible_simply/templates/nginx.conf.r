user  nginx;
worker_processes  auto;

error_log  /var/log/nginx/error.log notice;
pid        /var/run/nginx.pid;

events {
    worker_connections  500;
}

http {
    server {

                     location /service/a {
                 proxy_pass http://servicea ;
             }
             location /service/a/version {
                 proxy_pass http://servicea ;
             }
        
        
        location /service/c {
            proxy_pass http://127.0.0.1:8090 ;
        }
    }

                         upstream servicea {
                   server 127.0.0.1:8080;
                   keepalive 16;
                }
        
        }
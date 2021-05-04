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
                            proxy_pass http://service_a ;
                        }
                                            location /service/a/version {
                            proxy_pass http://service_a ;
                        }
                                            location /service/a/events {
                            proxy_pass http://service_a ;
                        }
                                                                                                        location /service/b {
                            proxy_pass https://service_b ;
                        }
                                            location /service/b/version {
                            proxy_pass https://service_b ;
                        }
                                            location /service/b/events {
                            proxy_pass https://service_b ;
                        }
                                                                    
        location /service/c {
            proxy_pass http://127.0.0.1:8090 ;
        }
    }

                             upstream service_a {
                   server 127.0.0.1:8080;
                   keepalive 16;
                }
                                     upstream service_b {
                   server 127.0.0.1:9000;
                   keepalive 16;
                }
                         }
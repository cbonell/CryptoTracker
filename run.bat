docker build -t blazor-server-with-docker .
docker run -p 443:80 blazor-server-with-docker

docker-compose down
docker rmi siteliang
docker build -t siteliang .
docker-compose up -d

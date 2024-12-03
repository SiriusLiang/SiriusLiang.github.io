scp -r ./docs 2c2g:~/app/docsify/
scp dockerfile 2c2g:~/app/docsify/
scp docker-compose.yml 2c2g:~/app/docsify/
scp ./update_server.sh 2c2g:~/app/docsify/

# run on server
ssh 2c2g "cd ~/app/docsify/ && sudo ./update_server.sh"
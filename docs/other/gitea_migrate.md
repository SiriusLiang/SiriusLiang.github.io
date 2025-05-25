
除了拷贝docker映射出来的文件，还需要设置权限，步骤如下:  
1. 在老服务器上`sudo docker-compose down`, 然后`sudo scp -r`所有文件到新服务器上
2. 在新服务器上`sudo docker-compose up -d`
3. gitea的所有设置在容器内的`/data`目录, 已映射到`./gitea`
4. 设置`./gitea/gitea/conf/app.ini`里面的domain
5. 进容器内, 把`/data/git/.ssh`更改权限
    ```bash
    chmod 700 .ssh
    chmod 600 .ssh/*
    chown -R git .ssh/
    chgrp -R git .ssh/
    ```
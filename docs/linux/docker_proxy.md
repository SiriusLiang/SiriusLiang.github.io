docker使用代理pull
1. 新建配置, 这将会覆盖docker默认配置
```bash
sudo mkdir -p /etc/systemd/system/docker.service.d
sudo vi http-proxy.conf
```

2. 设置代理地址
```bash
[Service]
Environment="HTTP_PROXY=http://172.16.7.13:7890"
Environment="HTTPS_PROXY=http://172.16.7.13:7890"

```

3. 重载配置, 重启服务
```bash
sudo systemctl daemon-reload
sudo systemctl restart docker
```

4. 可以查看配置成功了没
```bash
sudo systemctl show --property=Environment docker
```

----

设置使用腾讯镜像库
```bash
sudo vi /etc/docker/daemon.json
```

```json
{
  "registry-mirrors": [
    "https://mirror.ccs.tencentyun.com"
  ]
}
```

重启
```bash
sudo systemctl daemon-reexec
sudo systemctl restart docker
```